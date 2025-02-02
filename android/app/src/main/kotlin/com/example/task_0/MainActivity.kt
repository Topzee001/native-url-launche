package com.example.task_0

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.net.Uri
import android.util.Log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "app/url_launcher"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "launchUrl" -> {
                    try {
                        val url = call.argument<String>("url")
                        Log.d("URL_LAUNCHER", "Attempting to launch URL: $url")
                        
                        val intent = Intent(Intent.ACTION_VIEW)
                        intent.data = Uri.parse(url)
                        
                        // Check if there's an app that can handle this intent
                        if (intent.resolveActivity(context.packageManager) != null) {
                            startActivity(intent)
                            result.success(true)
                            Log.d("URL_LAUNCHER", "URL launch successful")
                        } else {
                            Log.e("URL_LAUNCHER", "No app can handle this URL")
                            result.error("NO_APP", "No app can handle this URL", null)
                        }
                    } catch (e: Exception) {
                        Log.e("URL_LAUNCHER", "Error launching URL: ${e.message}")
                        result.error("URL_LAUNCH_FAILED", e.message, null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}