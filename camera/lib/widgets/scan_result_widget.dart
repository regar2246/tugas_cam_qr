import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import '../controllers/scanner_controller.dart';
import '../services/screenshot_service.dart';

class ScanResultWidget extends StatelessWidget {
  final ScannerController controller;
  final ScreenshotController screenshotController = ScreenshotController();

  ScanResultWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: ValueListenableBuilder<String>(
          valueListenable: controller.scannedData,
          builder: (context, data, child) {
            return Column(
              children: [
                const Text("Hasil Scan:", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(data, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.cameraswitch),
                      label: const Text("Switch Camera"),
                      onPressed: controller.switchCamera,
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.save_alt),
                      label: const Text("Save"),
                      onPressed: () async {
                        await ScreenshotService.saveScreenshot(screenshotController);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Saved to gallery")),
                        );
                      },
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
