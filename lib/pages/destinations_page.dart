import 'destinations_list_page.dart';
import 'package:flutter/material.dart';
import 'package:list_provider_challenge/components/grid_image.dart';
import 'package:list_provider_challenge/core/app_colors.dart';
import 'package:list_provider_challenge/core/app_images.dart';
import 'package:list_provider_challenge/models/destination_category_model.dart';
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
            _generateGridWidget(
              image: AppImages.beach,
              category: DestinationCategory.beaches,
              context: context
            ),
            _generateGridWidget(
                image: AppImages.cow,
                category: DestinationCategory.countrysides,
                context: context
            ),
            _generateGridWidget(
                image: AppImages.egypt,
                category: DestinationCategory.historicals,
                context: context
            ),
            _generateGridWidget(
                image: AppImages.mountain,
                category: DestinationCategory.mountains,
                context: context
            ),
            _generateGridWidget(
                image: AppImages.orient,
                category: DestinationCategory.orientals,
                context: context
            ),
            _generateGridWidget(
                image: AppImages.usa,
                category: DestinationCategory.occidentals,
                context: context
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

  GestureDetector _generateGridWidget({
    String image,
    DestinationCategory category,
    BuildContext context}) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DestinationsListPage(category: category))
        );
      },
      child: GridImage(
        image: image,
        description: category.name,
      ),
    );
  }
}
