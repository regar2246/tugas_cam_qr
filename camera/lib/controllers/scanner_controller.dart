import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController {
  final MobileScannerController cameraController = MobileScannerController();
  final ValueNotifier<String> scannedData = ValueNotifier<String>('');

  void onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.first;
    final String? value = barcode.rawValue;
    if (value != null && value != scannedData.value) {
      scannedData.value = value;
    }
  }

  void switchCamera() {
    cameraController.switchCamera();
  }

  void dispose() {
    cameraController.dispose();
  }
}
