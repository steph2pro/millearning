import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/cv/models/experience.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class ExperienceProfessionel extends StatefulWidget {
  @override
  _ExperienceProfessionelState createState() => _ExperienceProfessionelState();
}

class _ExperienceProfessionelState extends State<ExperienceProfessionel> {
  final List<Experience> _experienceList = [];
  final Map<String, TextEditingController> _controllers = {
    'Poste': TextEditingController(),
    'Employeur': TextEditingController(),
    'Ville': TextEditingController(),
    'Date de debut': TextEditingController(),
    'Date de fin': TextEditingController(),
    'Description': TextEditingController(),
  };
  int? _editingIndex;
  bool _showForm = false;

  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  Future<void> _loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('experienceList');
    List<String>? savedExperiences = prefs.getStringList('experienceList');
    if (savedExperiences != null) {
      setState(() {
        _experienceList.addAll(
          savedExperiences.map((e) => Experience.fromJson(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _saveexperience() {
    final newexperience = Experience(
      poste:  _controllers['Poste']!.text, 
      employeur: _controllers['Employeur']!.text,
       ville:_controllers['Ville']!.text, 
       dateDebut:  _controllers['Date de debut']!.text, 
       dateFin:  _controllers['Date de fin']!.text, 
       description: _controllers['Description']!.text
       );

    setState(() {
      if (_editingIndex != null) {
        _experienceList[_editingIndex!] = newexperience;
        _editingIndex = null;
      } else {
        _experienceList.add(newexperience);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    _controllers.forEach((key, controller) => controller.clear());
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'experienceList',
      _experienceList.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  Future<void> _pickDate(String fieldKey) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _controllers[fieldKey]!.text = pickedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  void _editexperience(int index) {
    setState(() {
      _editingIndex = index;
    final experience = _experienceList[index];
    _controllers['Poste']?.text = experience.poste;
    _controllers['Employeur']?.text = experience.employeur;
    _controllers['Ville']?.text = experience.ville;
    _controllers['Date debut']?.text = experience.dateDebut;
    _controllers['Date fin']?.text = experience.dateFin;
    _controllers['Description']?.text = experience.description;
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deleteexperience() {
  if (_editingIndex != null) {
    setState(() {
      _experienceList.removeAt(_editingIndex!);
      _editingIndex = null;
    });
    _saveToSharedPreferences();
      _showForm = false;

  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display saved experiences
        ..._experienceList.asMap().entries.map((entry) {
          final index = entry.key;
          final experience = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: experience.poste,
              etablissement: experience.employeur,
              ville: experience.ville,
              edit: () => _editexperience(index),
            ),
          );
        }).toList(),
        SizedBox(height: 20),

        // Toggle button for showing/hiding the form
        if (!_showForm)
          OutlinedButton.icon(
            onPressed: () {
              setState(() {
                _showForm = true;
              });
            },
            icon: Icon(Icons.add),
            label: Text("Ajouter une experience Professionelle"),
          ),

        // Form fields
        if (_showForm) ...[
          ..._controllers.keys.map((key) {
            if (key == 'Date de debut' || key == 'Date de fin') {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key,
                    style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
                  ),
                  gapH6,
                  TextField(
                    controller: _controllers[key],
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: key,
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () => _pickDate(key),
                  ),
                  gapH20,
                ],
              );
            }
            return _buildInputField(
              context,
              label: key,
              hint: key,
              controller: _controllers[key]!,
              maxLines: key == 'Description' ? 6 : 1
            );
          }),
          SizedBox(height: 10),

          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _editingIndex != null 
            ?InkWell(
                onTap:_deleteexperience,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  color: context.colorScheme.onError,
                  border: Border.all(
                    color: context.colorScheme.error, // Couleur noire pour les bordures
                    width: 2, // Épaisseur de la bordure
                  ),
                  borderRadius: BorderRadius.circular(10), // Coins arrondis à 10
                ),
                child: Icon(Icons.delete, size: 25,color: context.colorScheme.error,),
                ),
              )
            :Container(),
            gapW12,
          ElevatedButton.icon(
            onPressed: _saveexperience,
            icon: Icon(Icons.check),
            label: Text(_editingIndex != null ? 'Modifier' : 'Terminer'),
          ),
            ],
          )
        ],
      ],
    );
  }

  Widget _buildInputField(
    BuildContext context, {
    required String label,
    required String hint,
    int? maxLines,
    required TextEditingController controller,
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
          maxLines: maxLines,
        ),
        gapH20,
      ],
    );
  }
}

