import 'package:flutter/material.dart';
import 'package:list_provider_challenge/core/app_colors.dart';
import 'package:list_provider_challenge/models/destination_category_model.dart';
import 'package:list_provider_challenge/models/destination_model.dart';
import 'package:list_provider_challenge/models/destinations_model.dart';
import 'package:provider/provider.dart';

class DestinationFormPage extends StatelessWidget {
  const DestinationFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final TextEditingController _controllerName = TextEditingController();
    final TextEditingController _controllerCountry = TextEditingController();
    final TextEditingController _controllerState = TextEditingController();
    final TextEditingController _controllerCity = TextEditingController();
    final TextEditingController _controllerCategory = TextEditingController();

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
                    _generateTextFormField(
                      label: "Nome do destino",
                      controller: _controllerName,
                      errorMessage: "Nome inválido!"
                    ),
                    SizedBox(height: 15),
                    _generateTextFormField(
                        label: "País",
                        controller: _controllerCountry,
                        errorMessage: "País inválido!"
                    ),
                    SizedBox(height: 15),
                    _generateTextFormField(
                        label: "Estado",
                        controller: _controllerState,
                        errorMessage: "Estado inválido!"
                    ),
                    SizedBox(height: 15),
                    _generateTextFormField(
                        label: "Cidade",
                        controller: _controllerCity,
                        errorMessage: "Cidade inválido!"
                    ),
                    SizedBox(height: 15),
                    DropdownButtonFormField(
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
                      onChanged: (newCategorySelected) {
                        _controllerCategory.text = newCategorySelected.name;
                      },
                      validator: (value) => value == null ? "Selecione uma categoria!": null
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.principal,
                        ),
                        onPressed: (){
                         // if(_formKey.currentState.validate()){
                          //  Provider.of<Destinations>(context).add(
                           //   Destination(
                            //    name: _controllerName.text,
                             //   category: _controllerCategory.text,
                             // )
                           // );
                        },
                        child: Text("Salvar destino")
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _generateTextFormField({String label, TextEditingController controller, String errorMessage}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.principal,
        ),
      ),
      controller: controller,
      validator: (value) => value.length == 0 ? errorMessage: null,
    );
  }

 List<DropdownMenuItem> _generateDropDownMenuItems({List<DestinationCategory> categories}) {
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
