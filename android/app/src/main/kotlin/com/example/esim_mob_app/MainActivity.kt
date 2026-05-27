package com.esimapp.awinst

import android.util.Log
import android.app.Activity
import android.content.Intent
import android.os.Build
import android.net.Uri
import android.provider.Settings
import android.telephony.euicc.EuiccManager
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.activity.result.contract.ActivityResultContracts

class MainActivity : FlutterFragmentActivity() {

    private val CHANNEL = "samples.flutter.dev/esim"

    private var pendingResult: MethodChannel.Result? = null

    private val ACTIVATE_ACTIVITY_CODE = 1001

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
                "installEsimViaUniversalLink" -> {

                    val cardData: String? = call.argument<String>("activationCode")

                    if (cardData == null) {
                        result.error("invalid_args", "Missing parameters", null)
                        return@setMethodCallHandler
                    }

                    val link = buildUniversalLink(
                        cardData
                    )

                    openUniversalLink(link)

                    result.success(link)
                }

                "canInstallEsim" -> {
                    result.success(getCapabilityInfo())
                }

                "openEsimSettings" -> {
                    openEsimSettings()
                }

                else -> result.notImplemented()
            }
        }
    }

    override fun onActivityResult(
        requestCode: Int,
        resultCode: Int,
        data: Intent?
    ) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == ACTIVATE_ACTIVITY_CODE) {

            when (resultCode) {

                Activity.RESULT_OK -> {
                    pendingResult?.success("installed")
                }

                Activity.RESULT_CANCELED -> {
                    pendingResult?.success("cancelled")
                }

                else -> {
                    pendingResult?.success("unknown")
                }
            }

            pendingResult = null
        }
    }

    private fun openEsimSettings() {
        val intent = Intent(Settings.ACTION_NETWORK_OPERATOR_SETTINGS)
        startActivity(intent)
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

    private fun buildUniversalLink(
        cardData: String,
    ): String {
        var link: String = "https://esimsetup.android.com/esim_qrcode_provisioning?carddata=$cardData";
        Log.d("ESIM link", link);
        return link
    }

    private fun openUniversalLink(link: String) {

        try {

            val intent = Intent(Intent.ACTION_VIEW).apply {
                data = Uri.parse(link)
                addCategory(Intent.CATEGORY_BROWSABLE)
            }

            startActivity(intent)

        } catch (e: Exception) {

            // fallback
            openEsimSettings()
        }
    }
}
