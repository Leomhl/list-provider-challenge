import 'package:flutter/material.dart';
import 'package:list_provider_challenge/components/destiny_item.dart';
import 'package:list_provider_challenge/core/app_colors.dart';
import 'package:list_provider_challenge/models/destination_category_model.dart';
import 'package:list_provider_challenge/models/destinations_model.dart';
import 'package:provider/provider.dart';

import 'destination_form_page.dart';

class DestinationsListPage extends StatelessWidget {
  DestinationCategory category;

  DestinationsListPage({@required this.category});

  @override
  Widget build(BuildContext context) {
    bool test = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
        backgroundColor: AppColors.principal,
      ),
      body: Consumer<Destinations>(
        builder: (context, information, child) {
          return ListView.builder(
            itemCount: information.destinations.length,
            itemBuilder: (context, int index) {
              if(information.destinations[index].category == category)
                return DestinyListItem(information.destinations[index]);
              return Container();
            });
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DestinationFormPage()),
            );
          },
          backgroundColor: AppColors.principal,
          child: Icon(Icons.add),
      ),
    );
  }
}
