// ignore_for_file: depend_on_referenced_packages
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

class PermissionService {
  PermissionService._();

  static PermissionHandlerPlatform get _handler =>
      PermissionHandlerPlatform.instance;

  static DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<bool> isAndroid13() async {
    if (Platform.isAndroid) {
      await deviceInfoPlugin.androidInfo.then((value) {
        if (value.version.sdkInt >= 33) {
          return true;
        } else {
          return false;
        }
      });
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> isAndroid12() async {
    if (Platform.isAndroid) {
      await deviceInfoPlugin.androidInfo.then((value) {
        if (value.version.sdkInt == 32) {
          return true;
        } else {
          return false;
        }
      });
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> isPermissionGranted() async {
    Map<Permission, PermissionStatus> permissions =
    await _handler.requestPermissions(
      [
        Permission.notification,
        Permission.camera,
        Permission.contacts,
        if (await isAndroid13()) Permission.photos,
        if (await isAndroid12()) Permission.storage,
      ],
    );
    bool checkedTrue = true;
    for (var element in permissions.values) {
      if (element == PermissionStatus.granted) {
        checkedTrue = true;
      } else if (element == PermissionStatus.permanentlyDenied) {
        openAppSettings();
        checkedTrue = false;
      } else {
        checkedTrue = false;
      }
    }
    return checkedTrue;
  }
}
