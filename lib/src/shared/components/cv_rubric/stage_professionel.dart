import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/cv/models/stage.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class StageProfessionel extends StatefulWidget {
  @override
  _StageProfessionelState createState() => _StageProfessionelState();
}
 
class _StageProfessionelState extends State<StageProfessionel> {
  final List<Stage> _stageList = [];
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
    // await prefs.remove('stageList');
    List<String>? savedstages = prefs.getStringList('stageList');
    if (savedstages != null) {
      setState(() {
        _stageList.addAll(
          savedstages.map((e) =>  Stage.fromJson(jsonDecode(e))).toList()
        );
      });
    }
  }

  void _savestage() {
    final newstage = Stage(
      poste:  _controllers['Poste']!.text, 
      employeur: _controllers['Employeur']!.text,
       ville:_controllers['Ville']!.text, 
       dateDebut:  _controllers['Date de debut']!.text, 
       dateFin:  _controllers['Date de fin']!.text, 
       description: _controllers['Description']!.text
       );

    setState(() {
      if (_editingIndex != null) {
        _stageList[_editingIndex!] = newstage;
        _editingIndex = null;
      } else {
        _stageList.add(newstage);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    _controllers.forEach((key, controller) => controller.clear());
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'stageList',
      _stageList.map((e) => jsonEncode(e)).toList(),
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

  void _editstage(int index) {
    setState(() {
      _editingIndex = index;
    final stage = _stageList[index];
    _controllers['Poste']?.text = stage.poste;
    _controllers['Employeur']?.text = stage.employeur;
    _controllers['Ville']?.text = stage.ville;
    _controllers['Date debut']?.text = stage.dateDebut;
    _controllers['Date fin']?.text = stage.dateFin;
    _controllers['Description']?.text = stage.description;
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deletestage() {
  if (_editingIndex != null) {
    setState(() {
      _stageList.removeAt(_editingIndex!);
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
        // Display saved stages
        ..._stageList.asMap().entries.map((entry) {
          final index = entry.key;
          final stage = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: stage.poste,
              etablissement: stage.employeur,
              ville: stage.ville,
              edit: () => _editstage(index),
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
            label: Text("Ajouter un stage"),
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
                onTap:_deletestage,
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
            onPressed: _savestage,
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

