import 'dart:io';
import 'dart:math';

import 'package:MyPlacesApp/src/models/placeLocation.dart';
import 'package:flutter/foundation.dart';

class GreatePlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  int get placesCount {
    return _places.length;
  }

  Place placeByIndex(int i) {
    return _places[i];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );

    _places.add(newPlace);

    notifyListeners();
  }
}
