import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../controllers/scanner_controller.dart';
import '../services/permission_service.dart';
import '../widgets/scan_result_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScannerController scannerController = ScannerController();

  @override
  void initState() {
    super.initState();
    PermissionService.requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code Scanner")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: MobileScanner(
              controller: scannerController.cameraController,
              onDetect: scannerController.onDetect,
            ),
          ),
          Expanded(
            flex: 2,
            child: ScanResultWidget(controller: scannerController),
          ),
        ],
      ),
    );
  }
}
