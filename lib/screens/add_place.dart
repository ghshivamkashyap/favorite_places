import 'dart:io';

import 'package:favorite_places/provider/place_list_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  File? _selectedImage;

  void _addPlace() {
    final placeName = _titleController.text;

    if (placeName.isEmpty) {
      return;
    }

    ref.read(userPlaceProvider.notifier).addPlace(placeName, _selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text('Add new place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(
                height: 15,
              ),

              // image input
              ImageInput(
                onPickedImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              // LocationInput(),

              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                onPressed: _addPlace,
                icon: const Icon(Icons.add),
                label: const Text('Add place'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
