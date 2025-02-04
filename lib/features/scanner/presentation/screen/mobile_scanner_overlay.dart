import 'package:flutter/material.dart';
import 'package:malina_app/core/res/colors/my_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerOverlay extends StatelessWidget {
  const MobileScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.k131313,
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final MobileScannerController controller = MobileScannerController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 54),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 350,
                height: 34,
              ),
              IconButton(
                icon: const Icon(Icons.close),
                color: MyColors.k777777,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 85),
        const Text(
          'Поместите QR-код в рамку',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: MyColors.kFFFFFF,
          ),
        ),
        const SizedBox(height: 29),
        SizedBox(
          height: 299,
          width: 299,
          child: MobileScanner(
            controller: controller,
            onDetect: (BarcodeCapture barcodes) {
              if (barcodes.raw != null) {
                final String code = barcodes.raw.toString();
                Navigator.pop(context, code);
              }
            },
          ),
        ),
      ],
    );
  }
}
