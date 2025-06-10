import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestPermissions() async {
    await Permission.camera.request();
    await Permission.storage.request();
  }
}
