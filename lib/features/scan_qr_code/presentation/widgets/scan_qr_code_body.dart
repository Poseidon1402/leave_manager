import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/data/repository/user_repository.dart';
import '../../../../core/presentation/components/buttons/app_outlined_button.dart';
import '../../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/route_name.dart';

class ScanQrCodeBody extends StatefulWidget {
  const ScanQrCodeBody({super.key});

  @override
  State<ScanQrCodeBody> createState() => _ScanQrCodeBodyState();
}

class _ScanQrCodeBodyState extends State<ScanQrCodeBody> {
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
    return ConstrainedBox(
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
                SizedBox(
                  height: 60.h,
                ),
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
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
        showDialog(
          context: context,
          builder: (_) => _buildAlertDialogContent(),
        );
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget _buildAlertDialogContent() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: MediaQuery.sizeOf(context).height * 0.4,
        ),
        child: ColoredBox(
          color: Colors.white,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: FutureBuilder(
              future: UserRepository().getUserByEmail(result?.code as String),
              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  final user = snapshot.data;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 33.r,
                        child: CircleAvatar(
                          backgroundColor: AppColor.blue1,
                          radius: 31.r,
                          child: Text(
                            user?.fullName![0] ?? 'A',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                      Text(
                        user?.fullName ?? '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'en ${user?.department?.name}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color.fromRGBO(30, 30, 30, 0.8),
                            ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: AppColor.grey5,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            user?.phone ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: AppColor.grey5,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            user?.email ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      AppOutlinedButton(
                        onPressed: () {
                          controller?.resumeCamera();
                          context.pop();
                        },
                        text: 'OK',
                        fixedHeight: 38.h,
                        fontSize: 16.sp,
                        textColor: AppColor.blue1,
                        borderColor: AppColor.blue1,
                        borderRadius: 8.r,
                      ),
                      GradientButton(
                        onPressed: () => context.push(RouteName.userPauseDetail),
                        fixedHeight: 38.h,
                        colors: const [
                          AppColor.blue2,
                          AppColor.blue1,
                        ],
                        child: Text(
                          'Voir plus de details'.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Une erreur est survenue',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }

                return Center(
                  child: SpinKitWaveSpinner(
                    color: AppColor.blue1,
                    size: 25.sp,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
