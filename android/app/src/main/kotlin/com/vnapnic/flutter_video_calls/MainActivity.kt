package com.vnapnic.flutter_video_calls

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // custom method to get flavor
        MethodChannel(flutterEngine.dartExecutor, "flavor").setMethodCallHandler { _, result -> result.success(BuildConfig.FLAVOR) }
    }
}
