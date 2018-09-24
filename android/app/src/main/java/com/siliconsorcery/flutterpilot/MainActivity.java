package com.siliconsorcery.flutterpilot;

import android.content.Context;
import android.os.Bundle;
import android.support.multidex.MultiDex;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    }

    @Override
    protected void attachBaseContext(Context base) {
      super.attachBaseContext(base);
      MultiDex.install(this);
    }

}
