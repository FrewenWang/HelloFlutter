package com.frewen.flutter.demo

import android.os.Bundle
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import org.devio.flutter.splashscreen.SplashScreen

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        // 添加的Splash的启动页
        // https://pub.dev/packages/flutter_splash_screen#-installing-tab-
        // TODO 为了测试方便，我们先关闭闪屏的显示
        // SplashScreen.show(this, true)
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
