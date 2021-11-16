import 'package:list_provider_challenge/models/destination_category_model.dart';

class Destination {
  String name;
  DestinationCategory category;
  String country;
  String state;
  String city;

  Destination({
    required this.name,
    required this.category,
    required this.country,
    required this.state,
    required this.city
  });
}