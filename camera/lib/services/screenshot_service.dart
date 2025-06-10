import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class ScreenshotService {
  static Future<void> saveScreenshot(ScreenshotController controller) async {
    final image = await controller.capture();
    if (image != null) {
      final dir = await getTemporaryDirectory();
      final path = '\${dir.path}/qr_\${DateTime.now().millisecondsSinceEpoch}.png';
      File file = File(path);
      await file.writeAsBytes(image);
      await GallerySaver.saveImage(file.path);
    }
  }
}
