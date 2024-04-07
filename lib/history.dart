import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var qrinfo;
  var amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 1000,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: qrinfo.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Text(qrinfo),
                    trailing: Text(amount),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}