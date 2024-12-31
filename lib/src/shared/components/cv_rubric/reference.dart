import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class Reference extends StatefulWidget {
  @override
  _ReferenceState createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
  final List<Map<String, String>> _referenceList = [];
  final Map<String, TextEditingController> _controllers = {
    'Nom': TextEditingController(),
    'Entreprise': TextEditingController(),
    'Ville': TextEditingController(),
    'Numéro de téléphonet': TextEditingController(),
    'Adresse e-mail': TextEditingController(),
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
    List<String>? savedreferences = prefs.getStringList('referenceList');
    if (savedreferences != null) {
      setState(() {
        _referenceList.addAll(
          savedreferences.map((e) => Map<String, String>.from(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _savereference() {
    final newreference = {
      'Nom': _controllers['Nom']!.text,
      'Entreprise': _controllers['Entreprise']!.text,
      'Ville': _controllers['Ville']!.text,
      'Numéro de téléphonet': _controllers['Numero de téléphonet']!.text,
      'Adresse e-mail': _controllers['Adresse e-mail']!.text,
    };

    setState(() {
      if (_editingIndex != null) {
        _referenceList[_editingIndex!] = newreference;
        _editingIndex = null;
      } else {
        _referenceList.add(newreference);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    _controllers.forEach((key, controller) => controller.clear());
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'referenceList',
      _referenceList.map((e) => jsonEncode(e)).toList(),
    );
  }

  
  void _editreference(int index) {
    setState(() {
      _editingIndex = index;
      _referenceList[index].forEach((key, value) {
        _controllers[key]?.text = value;
      });
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deletereference() {
  if (_editingIndex != null) {
    setState(() {
      _referenceList.removeAt(_editingIndex!);
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
        // Display saved references
        ..._referenceList.asMap().entries.map((entry) {
          final index = entry.key;
          final reference = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: reference['Nom'] ?? '',
              etablissement: reference['Entreprise'] ?? '',
              ville: reference['Ville'] ?? '',
              edit: () => _editreference(index),
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
            label: Text("Ajouter une reference"),
          ),

        // Form fields
        if (_showForm) ...[
          ..._controllers.keys.map((key) {
            
            return _buildInputField(
              context,
              label: key,
              hint: key,
              controller: _controllers[key]!,
            );
          }),
          SizedBox(height: 10),

          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _editingIndex != null 
            ?InkWell(
                onTap:_deletereference,
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
            onPressed: _savereference,
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

