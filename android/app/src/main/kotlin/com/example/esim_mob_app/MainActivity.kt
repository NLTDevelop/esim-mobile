package com.esimapp.nlt

import io.flutter.embedding.android.FlutterFragmentActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.net.Uri
import android.content.Intent

class MainActivity: FlutterFragmentActivity(){
    private val CHANNEL = "samples.flutter.dev/esim"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "launchESimSetup") {
                val activationCode = call.arguments as String
                launchESimSetup(activationCode)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun launchESimSetup(activationCode: String) {
        val intent = Intent(Intent.ACTION_VIEW)
        intent.data = Uri.parse(activationCode)
        startActivity(intent)
    }
}