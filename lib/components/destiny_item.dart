import 'package:flutter/material.dart';
import 'package:list_provider_challenge/models/destination_model.dart';

class DestinyListItem extends StatelessWidget {
  final Destination _destiny;

  DestinyListItem(this._destiny);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(Icons.airplanemode_active),
          title: Text(this._destiny.name),
          subtitle: Text(this._destiny.city),
          trailing: Text(this._destiny.state),
        ));
  }
}
