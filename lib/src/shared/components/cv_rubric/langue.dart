import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/cv/models/langues.dart';
import 'package:millearnia/src/shared/components/cv_rubric/niveau_indicateur.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class Langue extends StatefulWidget {
  @override
  _LangueState createState() => _LangueState();
}

class _LangueState extends State<Langue> {
  final List<Langues> _langueList = [];
  final TextEditingController _langueControllers = TextEditingController();
  int? _editingIndex;
  bool _showForm = false;
 String _selectedNiveau = "Intermédiaire";
  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  Future<void> _loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('langueList');
    List<String>? savedlangues = prefs.getStringList('langueList');
    if (savedlangues != null) {
      setState(() {
        _langueList.addAll(
          savedlangues.map((e) => Langues.fromJson(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _savelangue() {
    final newlangue = Langues(
      langue: _langueControllers.text,
      niveau: _selectedNiveau);
    

    setState(() {
      if (_editingIndex != null) {
        _langueList[_editingIndex!] = newlangue;
        _editingIndex = null;
      } else {
        _langueList.add(newlangue);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    // _controllers.forEach((key, controller) => controller.clear());
    _langueControllers.clear();
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'langueList',
      _langueList.map((e) => jsonEncode(e)).toList(),
    );
  }

 

  void _editlangue(int index) {
    setState(() {
      _editingIndex = index;
      final langue  = _langueList[index];
      _langueControllers.text =langue.langue;
      _selectedNiveau = langue.niveau;
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deletelangue() {
  if (_editingIndex != null) {
    setState(() {
      _langueList.removeAt(_editingIndex!);
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
        // Display saved langues
        ..._langueList.asMap().entries.map((entry) {
          final index = entry.key;
          final langue = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: langue.langue,
              etablissement:  langue.niveau,
              edit: () => _editlangue(index),
            ),
          );
        }).toList(),
        SizedBox(height: 20),
        
          if (!_showForm)
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  _showForm = true;
                });
              },
              icon: Icon(Icons.add),
              label: Text("Ajouter une langue"),
            ),
          

        // Form fields
     if (_showForm)...[
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'langue',
            style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
          ),
          gapH6,
          Input(
            controller: _langueControllers,
            textInputAction: TextInputAction.next,
            maxLines: 2,
          ),
          gapH20,
          NiveauIndicateur(
                onNiveauChanged: (niveau) {
                  setState(() {
                    _selectedNiveau = niveau; // Mettre à jour le niveau sélectionné
                  });
                },
              ),
        ],
      ),
          SizedBox(height: 10),
           // Toggle button for showing/hiding the form
        
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _editingIndex != null 
              ?InkWell(
                  onTap:_deletelangue,
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
              onPressed: _savelangue,
              icon: Icon(Icons.check),
              label: Text(_editingIndex != null ? 'Modifier' : 'Terminer'),
            ),
            ],
            )
          ]
        ],
    );
  }

}

