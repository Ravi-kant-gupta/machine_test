package com.methodchaneltask.machine_test

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import okhttp3.*
import java.io.IOException

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.methodchaneltask.machine_test/login"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "login") {
                val email = call.argument<String>("email")
                val password = call.argument<String>("password")
                val deviceToken = call.argument<String>("device_token")
                val deviceType = call.argument<String>("device_type")

                login(email, password, deviceToken, deviceType, result)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun login(email: String?, password: String?, deviceToken: String?, deviceType: String?, result: MethodChannel.Result) {
        val client = OkHttpClient()
        val url = "https://scratchy.esferasoft.in/api/login"

        val requestBody = FormBody.Builder()
            .add("email", email ?: "")
            .add("password", password ?: "")
            .add("device_token", deviceToken ?: "")
            .add("device_type", deviceType ?: "")
            .build()

        val request = Request.Builder()
            .url(url)
            .post(requestBody)
            .build()

        client.newCall(request).enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {
                result.error("ERROR", "Login failed", e.message)
            }

            override fun onResponse(call: Call, response: Response) {
                response.use {
                    if (!it.isSuccessful) {
                        result.error("ERROR", "Unexpected code $response", null)
                    } else {
                        result.success(it.body?.string())
                    }
                }
            }
        })
    }
}
