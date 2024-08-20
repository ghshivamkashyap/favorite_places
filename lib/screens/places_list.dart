import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/provider/place_list_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/place_datails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerStatefulWidget {
  const PlacesList({super.key, required this.placeList});

  final List<Place> placeList;

  @override
  ConsumerState<PlacesList> createState() {
    return _PlacesListState();
  }
  // _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends ConsumerState<PlacesList> {
  late Future<void> _placeFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placeFuture = ref.read(userPlaceProvider.notifier).loadPlaces();
  }
  // final x = ref.watch(userPlaceProvider);

  @override
  Widget build(BuildContext context) {
    final PlaceList = ref.watch(userPlaceProvider);
    print('Placelist in main screen: ${PlaceList}');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddPlaceScreen()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text('Favorite places'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _placeFuture,
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: PlaceList.length,
                    itemBuilder: (ctx, idx) => ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlaceDatails(place: PlaceList[idx]),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundImage: FileImage(PlaceList[idx].image),
                          ),
                          title: Text(PlaceList[idx].title),
                          // leading: Text(PlaceList[idx].title),
                        )),
          )),
    );
  }
}
