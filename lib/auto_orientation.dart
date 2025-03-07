import 'package:flutter/services.dart';

// Class that provides different modes
// to rotate the device programmatically either landscape or portrait
class AutoOrientation {
  static const MethodChannel _channel = const MethodChannel('auto_orientation');

  // rotate the device to landscape left mode
  static landscapeLeftMode() async {
    try {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
      await _channel.invokeMethod('setLandscapeLeft');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape right mode
  static landscapeRightMode() async {
    try {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
      await _channel.invokeMethod('setLandscapeRight');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait up mode
  static portraitUpMode() async {
    try {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      await _channel.invokeMethod('setPortraitUp');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait down mode
  static portraitDownMode() async {
    try {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
      await _channel.invokeMethod('setPortraitDown');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to portrait auto mode
  static portraitAutoMode({bool forceSensor = false}) async {
    try {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      await _channel.invokeMethod('setPortraitAuto', {'forceSensor': forceSensor});
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape auto mode
  static landscapeAutoMode({bool forceSensor = false}) async {
    try {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      await _channel.invokeMethod('setLandscapeAuto', {'forceSensor': forceSensor});
    } on MissingPluginException catch (_) {
      return;
    }
  }

  // rotate the device to landscape auto mode
  static fullAutoMode() async {
    try {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      await _channel.invokeMethod('setAuto');
    } on MissingPluginException catch (_) {
      return;
    }
  }

  static setScreenOrientationUser() async {
    try {
      await _channel.invokeMethod('setScreenOrientationUser');
    } on MissingPluginException catch (_) {
      return;
    }
  }
}
