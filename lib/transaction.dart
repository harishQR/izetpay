import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:izetpay/mpin.dart'; // Import Fluttertoast package

class transaction_p extends StatefulWidget {
  final String qrInfo;
  transaction_p({required this.qrInfo, Key? key}) : super(key: key);

  @override
  State<transaction_p> createState() => _transaction_pState();
}

class _transaction_pState extends State<transaction_p> {
  TextEditingController controller = TextEditingController();

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      // Display toast message if input is null or empty
      Fluttertoast.showToast(
        msg: "Invalid transaction",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return "Invalid transaction";
    } else if (int.parse(value) <= 0 ) {
      // Display toast message if amount is less than or equal to 1 rupee
      Fluttertoast.showToast(
        msg: "Transaction must be greater than 1 rupee",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return "Transaction must be greater than 1 rupee";
    }
    return null; // Return null if validation passes
  }

  void _validateAndNavigate() {
    // Validate the input
    String? error = _validateInput(controller.text);
    if (error == null) {
      // Navigate to another screen or perform desired action
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => mpin(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("asset/izetprof.png"),
                      backgroundColor: Colors.white,
                      radius: 70,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text("Paying ${widget.qrInfo}",style: TextStyle(fontSize: 18,)))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("₹", style: TextStyle(fontSize: 60),),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 100,
                            width: 200,
                            child: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 50),
                              decoration: InputDecoration(
                                hintText: "0",
                                hintStyle: TextStyle(fontSize: 50),
                              ),
                              validator: _validateInput,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed:_validateAndNavigate,
                            icon: Icon(Icons.check),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
