import 'package:flutter/material.dart';
import 'package:izetpay/scanqr.dart';
import 'package:izetpay/scanqr2.dart';
class scanqr3 extends StatefulWidget {
  const scanqr3({super.key});

  @override
  State<scanqr3> createState() => _scanqr3State();
}

class _scanqr3State extends State<scanqr3> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.qr_code,
                  size: 40,
                ),
              ),
            ],
          ),
          title: Text(
            '  QR / Barcode Scanner',
          ),
        ),
        body: TabBarView(
          children: [
            scanqr2(),
            Scanqr(),
          ],
        ),
      ),
    );

  }
}
