import 'package:flutter/material.dart';
import 'package:izetpay/history.dart';
import 'package:izetpay/homepage.dart';

class mpin extends StatefulWidget {
  const mpin({super.key});

  @override
  State<mpin> createState() => _mpinState();
}

class _mpinState extends State<mpin> {
  List<TextEditingController> controllers =
  List.generate(4, (_) => TextEditingController());

  bool _showGif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home_p()),
            );
          },
          icon: Icon(
            Icons.cancel,
            size: 40,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
          ),
          Center(
              child: Text("Enter 4-Digit UPI PIN",
                  style: TextStyle(fontSize: 20))),
          SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(
              4,
                  (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controllers[index],
                    decoration: InputDecoration(
                      hintText: '0',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length > 1) {
                        // Clear the excess characters if more than 1 digit is entered
                        controllers[index].text = value.substring(0, 1);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      _showBottomSheet();
                    },
                    icon: Icon(Icons.check),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showBottomSheet() {
    bool gifDisplayed = false;
    bool bottomSheetClosed  = false;
    bool isAnyEmpty = controllers.any((controller) => controller.text.isEmpty);
    if (isAnyEmpty) {
      // Display a message or perform any action if any text form field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Function to toggle the visibility of the gif image
            void toggleGifVisibility() {
              setState(() {
                _showGif = !_showGif;
              });
            }

            // Delayed function to toggle the visibility after 4 seconds
            Future.delayed(Duration(seconds: 4), () {
              if (!gifDisplayed && !bottomSheetClosed) {
                toggleGifVisibility();
                gifDisplayed = true; // Set to true after GIF image is displayed
                // Close the bottom sheet after displaying the GIF image for 1 second
                Future.delayed(Duration(seconds: 2), () {
                  if (!bottomSheetClosed) {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>home_p()));
                    bottomSheetClosed = true; // Set to true after closing bottom sheet
                  }
                });
              }
            });
            return Container(
              height: 200,
              child: _showGif
                  ? Image.asset('asset/checks.png') // Replace 'your_gif_image.gif' with your actual gif image asset path
                  : Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
