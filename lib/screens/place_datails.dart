import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDatails extends StatelessWidget {
  const PlaceDatails({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
          child: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      )),
    );
  }
}
