import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/cv_rubric/profil.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationPersonel extends StatefulWidget {
  @override
  _InformationPersonelState createState() => _InformationPersonelState();
}

class _InformationPersonelState extends State<InformationPersonel> {
  final Map<String, TextEditingController> _controllers = {
    'Nom complet': TextEditingController(),
    'titre': TextEditingController(),
    'email': TextEditingController(),
    'telephone': TextEditingController(),
    'address': TextEditingController(),
    'ville': TextEditingController(),
  };

  final List<String> _optionalFields = [
    'Lieu de naissance',
    'Permis de conduire',
    'Sexe',
    'nationalite',
    'Etat civil',
    'Site inernet',
    'linkedin',
    'Champ personalise',
  ];
  final Map<String, bool> _optionalFieldsVisible = {};

  File? _profileImage;

  @override
  void initState() {
    super.initState();
    for (var field in _optionalFields) {
      _optionalFieldsVisible[field] = false;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save text fields
    _controllers.forEach((key, controller) {
      prefs.setString(key, controller.text);
    });
    print('[Info Perso] :enregistrement des champ');

    // Save optional fields
    for (var field in _optionalFields) {
      prefs.setString(field, _optionalFieldsVisible[field] == true
          ? _controllers[field]?.text ?? ''
          : '');
    }
    print('[Info Perso] :enregistrement des champ optionel');


    // Save profile image as base64
    if (_profileImage != null) {
      final imageBytes = await _profileImage!.readAsBytes();
      final imageBase64 = base64Encode(imageBytes);
      prefs.setString('profileImage', imageBase64);
    }
     final img= await prefs.getString('profileImage');
    print('[Info Perso] :enregistrement de l\'image : $img');

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: context.colorScheme.surface,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : null,
                child: _profileImage == null
                    ? Icon(Icons.person, size: 50, color: context.colorScheme.tertiary)
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SafeArea(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text('Prendre une photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.camera);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.photo),
                                title: Text('Choisir depuis la galerie'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.gallery);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: context.colorScheme.primary,
                    child: Icon(
                      _profileImage == null ? Icons.add : Icons.check,
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        gapH16,
        ..._controllers.keys.map((key) {
          return _buildInputField(
            context,
            label: key,
            hint: key,
            controller: _controllers[key]!,
            validator: (value) => key != 'email'
                ? InputValidator.simpleValidator(context, value)
                : InputValidator.emailValidator(context, value),
          );
        }),
        ..._optionalFields.map((field) {
          if (_optionalFieldsVisible[field]!) {
            return _buildInputField(
            context,
            label: field,
            hint: field,
            controller: _controllers[field] = TextEditingController(),
            validator: (value) =>  InputValidator.simpleValidator(context, value),
          );
           
          }
          return SizedBox();
        }),
        Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 10,
          children: _optionalFields
              .where((field) => !_optionalFieldsVisible[field]!)
              .map((field) => OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _optionalFieldsVisible[field] = true;
                      });
                    },
                    icon: Icon(Icons.add),
                    label: Text(field,style: TextStyle(fontSize: 12),),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    
                  )
              ).toList(),
        ),
        gapH25,
       SizedBox(
        width: double.infinity,
        child:  ElevatedButton.icon(
          icon: Icon(Icons.check),
          onPressed: () async {
            await _saveInfo();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfilePage()),
            // );
          },
          label: Text('terminer'),
        ),
       ),
        gapH32,
      ],
    )
    );
  }

  Widget _buildInputField(
    BuildContext context, {
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
        gapH6,
        Input(
          controller: controller,
          hintText: hint,
          textInputAction: TextInputAction.next,
          validator: validator,
        ),
        gapH20,
      ],
    );
  }
}
