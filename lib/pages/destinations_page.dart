import 'package:flutter/material.dart';
import 'package:list_provider_challenge/components/grid_image.dart';
import 'package:list_provider_challenge/core/app_colors.dart';
import 'package:list_provider_challenge/core/app_images.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            // TODO: implementar o esquema de gesture detector aqui para navegar para a tela com a lista de destinos cadastrados
            GridImage(
              image: AppImages.beach,
              description: "Praias",
            ),
            GridImage(
              image: AppImages.cow,
              description: "Campos",
            ),
            GridImage(
              image: AppImages.egypt,
              description: "Históricos",
            ),
            GridImage(
              image: AppImages.mountain,
              description: "Montanhas",
            ),
            GridImage(
              image: AppImages.orient,
              description: "Orientais",
            ),
            GridImage(
              image: AppImages.usa,
              description: "Ocidentais",
            ),
          ],
        ),
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
