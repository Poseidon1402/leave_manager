import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/utils/constants/app_color.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 21.sp,
            color: Colors.white,
          ),
        ),
        title: const Text('Scan code QR'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(
          height: MediaQuery.sizeOf(context).height,
        ),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: ColoredBox(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Placer le code QR sur la caméra',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h,),
                  Flexible(
                    flex: 2,
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: QRView(
                        key: qrKey,
                        overlay: QrScannerOverlayShape(
                          borderRadius: 12.r,
                          overlayColor: Colors.white,
                          borderColor: AppColor.blue1,
                        ),
                        onQRViewCreated: _onQRViewCreated,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.blue1,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}