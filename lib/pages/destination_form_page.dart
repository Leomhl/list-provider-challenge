import 'package:flutter/material.dart';
import 'package:list_provider_challenge/core/app_colors.dart';

class DestinationFormPage extends StatelessWidget {
  const DestinationFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar destino"),
        centerTitle: true,
        backgroundColor: AppColors.principal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nome do destino",
                        labelStyle: TextStyle(
                          color: AppColors.principal,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
