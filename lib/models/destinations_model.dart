import 'destination_model.dart';
import 'package:flutter/material.dart';

class Destinations extends ChangeNotifier {
  List<Destination> _destinations = [];
  List<Destination> get destinations => _destinations;

  void add(Destination value) {
    _destinations.add(value);

    notifyListeners();
  }
}