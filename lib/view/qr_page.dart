import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../widgets/appbar_widget.dart';
import 'web_view_page.dart';

class QrController extends GetxController {
  static QrController get to => Get.find();
  RxBool isQrRead = false.obs;

  @override
  void onInit() {
    super.onInit();
    isQrRead.value = false;
  }

  void changeQrRead(bool value) {
    isQrRead.value = value;
  }
}

class QrTagPage extends StatefulWidget {
  final String name;
  final String id;

  const QrTagPage({super.key, required this.name, required this.id});

  @override
  State<QrTagPage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrTagPage> {
  final QrController controller = Get.put(QrController());
  final MobileScannerController cameraController = MobileScannerController();
  bool isProcessing = false;

  Future<void> taggingRequest(String qrData) async {
    if (isProcessing) return;
    isProcessing = true;

    try {
      // URL 형식 확인
      if (qrData.startsWith('http://') || qrData.startsWith('https://')) {
        // URL로 이동
        await Get.to(() => WebViewPage(url: qrData));
      } else {
        Get.dialog(
          const AlertDialog(
            title: Text('잘못된 QR 코드', textAlign: TextAlign.center),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text('올바른 URL 형식이 아닙니다.')],
            ),
          ),
        );
      }

      controller.changeQrRead(true);
    } catch (e) {
      Get.snackbar('오류', '처리 중 문제가 발생했습니다');
    } finally {
      isProcessing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: basicAppBar(context: context, title: 'Mobile_Scanner'),
      body: Obx(() {
        if (controller.isQrRead.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('스캔 완료되었습니다.', textAlign: TextAlign.center),
                ElevatedButton(
                  onPressed: () {
                    controller.changeQrRead(false);
                    cameraController.start();
                  },
                  child: const Text('다시 스캔하기'),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              flex: 5,
              child: MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    if (barcode.rawValue != null) {
                      taggingRequest(barcode.rawValue!);
                    }
                  }
                },
              ),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('QR 코드를 스캔해주세요\nPlease scan QR code',
                        textAlign: TextAlign.center),
                    SizedBox(height: 10),
                    SizedBox(width: 200, child: LinearProgressIndicator()),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
