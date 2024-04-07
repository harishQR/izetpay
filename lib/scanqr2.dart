import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:izetpay/homepage.dart';
import 'package:izetpay/transaction.dart';

class scanqr2 extends StatefulWidget {
  @override
  _scanqr2State createState() => _scanqr2State();
}

class _scanqr2State extends State<scanqr2> {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
      if (_qrInfo != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => transaction_p(qrInfo: _qrInfo.toString(),)), // Navigate to NextPage with qrInfo
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: Icon(Icons.camera),
      ),
      body: camState
          ? Center(
        child: SizedBox(
          height: 1000,
          width: 500,
          child: QRBarScannerCamera(
            onError: (context, error) => Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            qrCodeCallback: (code) {
              qrCallback(code);
            },
          ),
        ),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Code :" + _qrInfo!,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}