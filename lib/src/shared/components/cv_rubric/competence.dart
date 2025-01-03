import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/cv/models/competences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/niveau_indicateur.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class Competence extends StatefulWidget {
  @override
  _CompetenceState createState() => _CompetenceState();
}

class _CompetenceState extends State<Competence> {
  final List<Competences> _competenceList = [];
  final TextEditingController _competenceControllers = TextEditingController();
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
    // await prefs.remove('competenceList');

    List<String>? savedcompetences = prefs.getStringList('competenceList');
    if (savedcompetences != null) {
      setState(() {
        _competenceList.addAll(
          savedcompetences.map((e) => Competences.fromJson(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _savecompetence() {
    final newcompetence = Competences(
      competence: _competenceControllers.text, 
      niveau: _selectedNiveau);
    

    setState(() {
      if (_editingIndex != null) {
        _competenceList[_editingIndex!] = newcompetence;
        _editingIndex = null;
      } else {
        _competenceList.add(newcompetence);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    // _controllers.forEach((key, controller) => controller.clear());
    _competenceControllers.clear();
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'competenceList',
      _competenceList.map((e) => jsonEncode(e)).toList(),
    );
  }

 

  void _editcompetence(int index) {
    setState(() {
      _editingIndex = index;
    final competence = _competenceList[index];
      _competenceControllers.text = competence.competence;
      _selectedNiveau = competence.niveau;
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deletecompetence() {
  if (_editingIndex != null) {
    setState(() {
      _competenceList.removeAt(_editingIndex!);
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
        // Display saved competences
        ..._competenceList.asMap().entries.map((entry) {
          final index = entry.key;
          final competence = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: competence.competence,
              etablissement:  competence.niveau,
              edit: () => _editcompetence(index),
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
            label: Text("Ajouter une Competence"),
          ),

        // Form fields
     if (_showForm)...[
     
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Competence',
            style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
          ),
          gapH6,
          Input(
            controller: _competenceControllers,
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

          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _editingIndex != null 
            ?InkWell(
                onTap:_deletecompetence,
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
            onPressed: _savecompetence,
            icon: Icon(Icons.check),
            label: Text(_editingIndex != null ? 'Modifier' : 'Terminer'),
          ),
            ],
          )
           
     ]
    ]);
  }

}

