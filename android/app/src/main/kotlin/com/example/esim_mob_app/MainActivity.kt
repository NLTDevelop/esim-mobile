package com.esimapp.appname

import android.content.Intent
import android.os.Build
import android.provider.Settings
import android.telephony.euicc.EuiccManager
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.activity.result.contract.ActivityResultContracts

class MainActivity : FlutterFragmentActivity() {

    private val CHANNEL = "samples.flutter.dev/esim"

    private var pendingResult: MethodChannel.Result? = null

    private val esimInstallerLauncher = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) { res ->
        val pr = pendingResult
        pendingResult = null
        pr?.success(mapOf("resultCode" to res.resultCode))
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "canInstallEsim" -> {
                    result.success(getCapabilityInfo())
                }

                "openEsimInstaller" -> {
                    val activationCode = call.argument<String>("activationCode")
                    if (activationCode.isNullOrBlank()) {
                        result.error("invalid_args", "activationCode is required", null)
                        return@setMethodCallHandler
                    }
                    openSystemInstaller(activationCode.trim(), result)
                }

                "openEsimSettings" -> {
                    openEsimSettings(result)
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun openSystemInstaller(activationCode: String, result: MethodChannel.Result) {
        val capability = getCapabilityInfo()
        val supported = capability["supported"] as? Boolean ?: false
        if (!supported) {
            result.error("not_supported", "Device does not support eSIM or eUICC is not enabled", capability)
            return
        }

        val intent = Intent("android.telephony.euicc.action.PROVISION_EMBEDDED_SUBSCRIPTION").apply {
            putExtra("android.telephony.euicc.extra.ACTIVATION_CODE", activationCode)
        }

        if (intent.resolveActivity(packageManager) == null) {
            result.error("no_handler", "No system activity found to handle eSIM provisioning intent", capability)
            return
        }

        if (pendingResult != null) {
            result.error("busy", "Another eSIM request is in progress", null)
            return
        }

        pendingResult = result
        try {
            esimInstallerLauncher.launch(intent)
        } catch (t: Throwable) {
            pendingResult = null
            result.error("launch_failed", "Failed to launch eSIM installer: ${t.message}", null)
        }
    }

    private fun openEsimSettings(result: MethodChannel.Result) {
        val intent = Intent(Settings.ACTION_NETWORK_OPERATOR_SETTINGS)
        try {
            startActivity(intent)
            result.success(true)
        } catch (t: Throwable) {
            result.error("settings_failed", "Failed to open settings: ${t.message}", null)
        }
    }

    private fun getCapabilityInfo(): Map<String, Any?> {
        val isApiOk = Build.VERSION.SDK_INT >= Build.VERSION_CODES.P
        val hasFeature = packageManager.hasSystemFeature("android.hardware.telephony.euicc")
        val euiccEnabled = if (isApiOk) {
            try {
                val mgr = getSystemService(EuiccManager::class.java)
                mgr != null && mgr.isEnabled
            } catch (_: Throwable) {
                false
            }
        } else false

        val supported = isApiOk && hasFeature && euiccEnabled

        return mapOf(
            "supported" to supported,
            "apiLevel" to Build.VERSION.SDK_INT,
            "hasEuiccFeature" to hasFeature,
            "euiccEnabled" to euiccEnabled
        )
    }
}
