import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/dialogs/dialog_builder.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_professionel.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController(
    text: "Fort d'une solide compréhension théorique et pratique, je m'efforce d'apporter une perspective unique et innovante à tout projet auquel je participe. Mon engagement à l'excellence m'a permis de développer des solutions créatives et applicables dans des environnements dynamiques.",
  );

  

  @override
  Widget build(BuildContext context) {

  Future<void> _saveProfile() async {
     if (_descriptionController.text.trim().isEmpty) {
      LoadingDialog.hide(context: context);
      showErrorModal('Le champ $key ne peut pas être vide.');
      return; 
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileDescription', _descriptionController.text);
  }
    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
          'Description',
          style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        gapH6,
        Input(
          controller: _descriptionController,
          textInputAction: TextInputAction.next,
          validator:(value) => InputValidator.simpleValidator(context, value),
          maxLines: 10,
        ),
           
            SizedBox(height: 20),
            
            ElevatedButton.icon(
              icon: Icon(Icons.check),
              onPressed: () async {
                await _saveProfile();
              
              },
              label: Text('terminer'),
            ),
            
          ],
        );
  }
}
