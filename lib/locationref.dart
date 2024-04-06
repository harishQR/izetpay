// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LiveLocationScreen extends StatefulWidget {
//   @override
//   _LiveLocationScreenState createState() => _LiveLocationScreenState();
// }
//
// class _LiveLocationScreenState extends State<LiveLocationScreen> {
//   String location = 'Loading...';
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       List<Placemark> placemarks =
//       await placemarkFromCoordinates(position.latitude, position.longitude);
//       Placemark place = placemarks[0];
//       setState(() {
//         location =
//         '${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}';
//       });
//     } catch (e) {
//       setState(() {
//         location = 'Error fetching location: $e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Location'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Current Location:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               location,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: LiveLocationScreen(),
//   ));
// }
