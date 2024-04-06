import 'package:flutter/material.dart';
import 'package:izetpay/homepage.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  bool isscanned = false;

  @override
  void initState() {
    super.initState();
    isscanned = false; // Ensure isscanned is initially set to false
  }

  void exitScreen() {
    setState(() {
      isscanned = false; // Reset isscanned when exiting the screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "QR Scanner",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              "Place the camera in QRCode",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Container(
              width: 300,
              height: 300,
              child: MobileScanner(
                onDetect: (barcode) {
                  if (!isscanned) {
                    String code = barcode.raw ?? '---';
                    setState(() {
                      isscanned = true; // Update isscanned when a QR code is scanned
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => home_p()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
