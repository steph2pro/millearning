import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/cv/models/activite.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class ActiviteExtraScolaire extends StatefulWidget {
  @override
  _ActiviteExtraScolaireState createState() => _ActiviteExtraScolaireState();
}

class _ActiviteExtraScolaireState extends State<ActiviteExtraScolaire> {
  final List<Activite> _activiteList = [];
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
    // await prefs.remove('activiteList');
    List<String>? savedactivites = prefs.getStringList('activiteList');
    if (savedactivites != null) {
      setState(() {
        _activiteList.addAll( 
          savedactivites.map((e) => Activite.fromJson(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _saveactivite() {
    final newactivite =  Activite(
      poste:  _controllers['Poste']!.text, 
      employeur: _controllers['Employeur']!.text,
       ville:_controllers['Ville']!.text, 
       dateDebut:  _controllers['Date de debut']!.text, 
       dateFin:  _controllers['Date de fin']!.text, 
       description: _controllers['Description']!.text
       );

    setState(() {
      if (_editingIndex != null) {
        _activiteList[_editingIndex!] = newactivite;
        _editingIndex = null;
      } else {
        _activiteList.add(newactivite);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    _controllers.forEach((key, controller) => controller.clear());
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'activiteList',
      _activiteList.map((e) => jsonEncode(e)).toList(),
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

  void _editactivite(int index) {
    setState(() {
      _editingIndex = index;
     final activite = _activiteList[index];
    _controllers['Poste']?.text = activite.poste;
    _controllers['Employeur']?.text = activite.employeur;
    _controllers['Ville']?.text = activite.ville;
    _controllers['Date debut']?.text = activite.dateDebut;
    _controllers['Date fin']?.text = activite.dateFin;
    _controllers['Description']?.text = activite.description;
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deleteactivite() {
  if (_editingIndex != null) {
    setState(() {
      _activiteList.removeAt(_editingIndex!);
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
        // Display saved activites
        ..._activiteList.asMap().entries.map((entry) {
          final index = entry.key;
          final activite = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: activite.poste,
              etablissement: activite.employeur,
              ville: activite.ville,
              edit: () => _editactivite(index),
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
            label: Text("Ajouter une activite extra-scolaire"),
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
                onTap:_deleteactivite,
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
            onPressed: _saveactivite,
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

