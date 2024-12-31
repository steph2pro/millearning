import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
@RoutePage()
class ChoixModelScreen extends StatefulWidget {
  const ChoixModelScreen({super.key});

  @override
  State<ChoixModelScreen> createState() => _ChoixModelScreenState();

}

class _ChoixModelScreenState extends State<ChoixModelScreen> {
  
  Future<void> _saveChoiseModel(int model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('[SaveModelChoise]: Model choisis $model');
    await prefs.setInt(
      'model',
      model,
    );
  }
  final List<String> images = [
    'assets/images/model_cv1.png',
    'assets/images/model_cv2.png',
    'assets/images/model_cv3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choix du model de CV',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: context.colorScheme.onPrimary,
      ),
      
        // backgroundColor: context.colorScheme.scrim,
      body:ListView.builder(
        itemCount: images.length, // Nombre d'images dans le tableau
        itemBuilder: (context, index) {
          return Column(
            children: [
              // Conteneur pour afficher chaque image
              Container(
                width: double.infinity, // Occupe toute la largeur de l'écran
                height: 400, // Hauteur fixe pour l'image
                child: Image.asset(
                  images[index], // Chemin de l'image depuis le tableau
                  // fit: BoxFit.cover, // Ajuste l'image pour couvrir tout l'espace
                ),
              ),
             gapH10, // Espacement entre l'image et le bouton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    _saveChoiseModel(index+1);
                    // Action du bouton
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Image ${index + 1} choisie')),
                    );
                    context.pushRoute(CvBuilderRoute());
                  },
                  icon: Icon(Icons.check),
                  label: Text('Choisir'),
                ),
              ),
              SizedBox(height: 16), // Espacement entre les éléments
            ],
          );
        },
      ),
    );
        
  }
}



