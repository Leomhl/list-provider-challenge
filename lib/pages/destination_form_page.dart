import 'package:flutter/material.dart';
import 'package:list_provider_challenge/core/app_colors.dart';
import 'package:list_provider_challenge/models/destination_category_model.dart';
import 'package:list_provider_challenge/models/destination_model.dart';
import 'package:list_provider_challenge/models/destinations_model.dart';
import 'package:provider/provider.dart';

class DestinationFormPage extends StatefulWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerCountry = TextEditingController();
  final TextEditingController _controllerState = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();

  DestinationCategory? _category;

  @override
  State<DestinationFormPage> createState() => _DestinationFormPageState();
}

class _DestinationFormPageState extends State<DestinationFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar destino"),
        centerTitle: true,
        backgroundColor: AppColors.principal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _generateTextFormField(
                    label: "Nome do destino",
                    controller: widget._controllerName,
                    errorMessage: "Nome inválido!"
                ),
                SizedBox(height: 15),
                _generateTextFormField(
                    label: "País",
                    controller: widget._controllerCountry,
                    errorMessage: "País inválido!"
                ),
                SizedBox(height: 15),
                _generateTextFormField(
                    label: "Estado",
                    controller: widget._controllerState,
                    errorMessage: "Estado inválido!"
                ),
                SizedBox(height: 15),
                _generateTextFormField(
                    label: "Cidade",
                    controller: widget._controllerCity,
                    errorMessage: "Cidade inválido!"
                ),
                SizedBox(height: 15),
                DropdownButtonFormField(
                    value: widget._category,
                    style: TextStyle(
                      color: AppColors.principal,
                    ),
                    isExpanded: true,
                    decoration: InputDecoration(
                        labelText: 'Categoria',
                        labelStyle: TextStyle(
                          color: AppColors.principal,
                        )
                    ),
                    items: _generateDropDownMenuItems(
                        categories: [
                          DestinationCategory.beaches,
                          DestinationCategory.mountains,
                          DestinationCategory.countrysides,
                          DestinationCategory.occidentals,
                          DestinationCategory.orientals,
                          DestinationCategory.historicals,
                        ]
                    ),
                    onChanged: (dynamic newCategorySelected) {
                      widget._category = newCategorySelected;
                    },
                    validator: (dynamic value) => value == null ? "Selecione uma categoria!": null
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.principal,
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          Provider.of<Destinations>(context, listen: false).add(
                              Destination(
                                name: widget._controllerName.text,
                                category: widget._category!,
                                country: widget._controllerCountry.text,
                                state: widget._controllerState.text,
                                city: widget._controllerCity.text,
                              )
                          );

                          final snackBar = SnackBar(content: Text("Destino salvo com sucesso!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          widget._controllerName.clear();
                          widget._controllerCity.clear();
                          widget._controllerState.clear();
                          widget._controllerCountry.clear();
                          widget._category = null;

                          Future.delayed(
                              Duration(seconds: 2),
                                  () => Navigator.pop(context)
                          );
                        }
                      },
                      child: Text("Salvar destino")
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _generateTextFormField({String? label, TextEditingController? controller, String? errorMessage}) {

    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.principal,
        ),
      ),
      controller: controller,
      validator: (value) => value!.length == 0 ? errorMessage: null,
    );
  }

  List<DropdownMenuItem> _generateDropDownMenuItems({required List<DestinationCategory> categories}) {
    List<DropdownMenuItem> menuItems = [];
    categories.forEach((DestinationCategory element) {
      menuItems.add(DropdownMenuItem(
        child: Text(element.name),
        value: element,
      ));
    });

    return menuItems;
  }
}