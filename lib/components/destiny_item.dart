import 'package:flutter/material.dart';
import 'package:list_provider_challenge/models/destination_model.dart';

class DestinyListItem extends StatelessWidget {
  final Destination _destiny;

  DestinyListItem(this._destiny);

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(
      leading: Text(this._destiny.name),
      title: Text(this._destiny.country),
      subtitle: Text(this._destiny.city),
    ));
  }
}
