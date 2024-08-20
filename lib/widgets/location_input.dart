// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// class LocationInput extends StatefulWidget {
//   const LocationInput({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _LocationInputState();
//   }
// }

// class _LocationInputState extends State {
//   Location? _fetchedLocation;
//   bool _gettingLocation = false;
//   void _getCurrentLocation() async {
//     Location location = Location();

//     bool serviceEnabled;
//     PermissionStatus permissionGranted;
//     LocationData locationData;

//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }

//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//     setState(() {
//       _gettingLocation = true;
//     });
//     locationData = await location.getLocation();

//     setState(() {
//       _gettingLocation = false;
//     });
//     print("Location: $locationData");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 width: 1, color: Colors.white54, style: BorderStyle.solid),
//           ),
//           height: 250,
//           width: double.infinity,
//           child: Text(
//             _gettingLocation ? "loading..." : "No location selected",
//             style: const TextStyle(color: Color.fromARGB(255, 109, 80, 114)),
//           ),
//         ),
//         Row(
//           children: [
//             TextButton.icon(
//               onPressed: _getCurrentLocation,
//               icon: const Icon(Icons.location_on),
//               label: const Text('Get current location'),
//             ),
//             TextButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.map_outlined),
//               label: const Text('Select on map'),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
