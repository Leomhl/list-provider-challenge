import 'package:flutter/material.dart';
import 'package:list_provider_challenge/core/app_colors.dart';
import 'package:list_provider_challenge/models/destination_category_model.dart';

class DestinationsListPage extends StatelessWidget {
  DestinationCategory category;
  DestinationsListPage({@required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
        backgroundColor: AppColors.principal,
      ),
      body: Container(),
    );
  }
}
