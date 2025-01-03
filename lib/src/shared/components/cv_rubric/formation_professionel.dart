import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/cv/models/formation.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class FormationProfessionel extends StatefulWidget {
  @override
  _FormationProfessionelState createState() => _FormationProfessionelState();
}

class _FormationProfessionelState extends State<FormationProfessionel> {
  final List<Formation> _formationList = [];

  final Map<String, TextEditingController> _controllers = {
    'Titre': TextEditingController(),
    'Etablissement': TextEditingController(),
    'Ville': TextEditingController(),
    'Date debut': TextEditingController(),
    'Date fin': TextEditingController(),
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
  // await prefs.remove('formationList');
  List<String>? savedFormations = prefs.getStringList('formationList');
  if (savedFormations != null) {
    setState(() {
      _formationList.addAll(
        savedFormations.map((e) => Formation.fromJson(jsonDecode(e))).toList(),
      );
    });
  }
}


  void _saveFormation() {
  final newFormation = Formation(
    titre: _controllers['Titre']!.text,
    etablissement: _controllers['Etablissement']!.text,
    ville: _controllers['Ville']!.text,
    dateDebut: _controllers['Date debut']!.text,
    dateFin: _controllers['Date fin']!.text,
    description: _controllers['Description']!.text,
  );

  setState(() {
    if (_editingIndex != null) {
      _formationList[_editingIndex!] = newFormation;
      _editingIndex = null;
    } else {
      _formationList.add(newFormation);
    }
    _showForm = false; // Cache le formulaire après soumission
  });

  _controllers.forEach((key, controller) => controller.clear());
  _saveToSharedPreferences();
}


 Future<void> _saveToSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(
    'formationList',
    _formationList.map((e) => jsonEncode(e.toJson())).toList(),
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

  void _editFormation(int index) {
  setState(() {
    _editingIndex = index;
    final formation = _formationList[index];
    _controllers['Titre']?.text = formation.titre;
    _controllers['Etablissement']?.text = formation.etablissement;
    _controllers['Ville']?.text = formation.ville;
    _controllers['Date debut']?.text = formation.dateDebut;
    _controllers['Date fin']?.text = formation.dateFin;
    _controllers['Description']?.text = formation.description;
    _showForm = true; // Affiche le formulaire lors de la modification
  });
}

  void _deleteFormation() {
  if (_editingIndex != null) {
    setState(() {
      _formationList.removeAt(_editingIndex!);
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
        // Display saved formations
       ..._formationList.asMap().entries.map((entry) {
          final index = entry.key;
          final formation = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: formation.titre,
              etablissement: formation.etablissement,
              ville: formation.ville,
              edit: () => _editFormation(index),
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
            label: Text("Ajouter une formation"),
          ),

        // Form fields
        if (_showForm) ...[
          ..._controllers.keys.map((key) {
            if (key == 'Date debut' || key == 'Date fin') {
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
                onTap:_deleteFormation,
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
            onPressed: _saveFormation,
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

