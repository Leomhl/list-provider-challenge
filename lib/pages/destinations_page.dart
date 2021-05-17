import 'package:flutter/material.dart';
import 'package:list_provider_challenge/core/app_colors.dart';
import 'package:list_provider_challenge/pages/destination_form_page.dart';

class DestinationsPage extends StatelessWidget {
  const DestinationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destinos"),
        centerTitle: true,
        backgroundColor: AppColors.principal,
      ),
      body: Container(),
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
