package com.example.blue_book

import io.flutter.embedding.android.FlutterActivity

// add this import
import io.flutter.embedding.engine.FlutterEngine 
import android.view.WindowManager.LayoutParams
// end
class MainActivity: FlutterActivity(){
// and this 
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        window.addFlags(LayoutParams.FLAG_SECURE)
        super.configureFlutterEngine(flutterEngine)
    }
}