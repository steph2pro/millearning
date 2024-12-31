import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class Realisation extends StatefulWidget {
  @override
  _RealisationState createState() => _RealisationState();
}

class _RealisationState extends State<Realisation> {
  final List<Map<String, String>> _realisationList = [];
  final TextEditingController _realisationControllers = TextEditingController();
  int? _editingIndex;
  bool _showForm = false;
  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  Future<void> _loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedrealisations = prefs.getStringList('realisationList');
    if (savedrealisations != null) {
      setState(() {
        _realisationList.addAll(
          savedrealisations.map((e) => Map<String, String>.from(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _saverealisation() {
    final newrealisation = {
      'realisation': _realisationControllers.text,
    };

    setState(() {
      if (_editingIndex != null) {
        _realisationList[_editingIndex!] = newrealisation;
        _editingIndex = null;
      } else {
        _realisationList.add(newrealisation);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    // _controllers.forEach((key, controller) => controller.clear());
    _realisationControllers.clear();
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'realisationList',
      _realisationList.map((e) => jsonEncode(e)).toList(),
    );
  }

 

  void _editrealisation(int index) {
    setState(() {
      _editingIndex = index;
      _realisationControllers.text = _realisationList[index]['realisation'] ?? '';
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deleterealisation() {
  if (_editingIndex != null) {
    setState(() {
      _realisationList.removeAt(_editingIndex!);
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
        // Display saved realisations
        ..._realisationList.asMap().entries.map((entry) {
          final index = entry.key;
          final realisation = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: realisation['realisation'] ?? '',
              edit: () => _editrealisation(index),
            ),
          );
        }).toList(),
        gapH20,

          // Toggle button for showing/hiding the form
        if (!_showForm)
          OutlinedButton.icon(
            onPressed: () {
              setState(() {
                _showForm = true;
              });
            },
            icon: Icon(Icons.add),
            label: Text("Ajouter une realisation"),
          ),
        // Form fields
     if (_showForm)...[
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: context.textTheme.bodySmall,
          ),
          gapH6,
          Input(
            controller: _realisationControllers,
            textInputAction: TextInputAction.next,
            maxLines: 6,
          ),
          gapH20,
         
        ],
      ),
          gapH10,
        
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _editingIndex != null 
            ?InkWell(
                onTap:_deleterealisation,
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
            onPressed: _saverealisation,
            icon: Icon(Icons.check),
            label: Text(_editingIndex != null ? 'Modifier' : 'Terminer'),
          ),
            ],
          )
        ]       
     ]);
  }

}

