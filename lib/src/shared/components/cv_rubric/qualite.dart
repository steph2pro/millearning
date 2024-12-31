import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class Qualite extends StatefulWidget {
  @override
  _QualiteState createState() => _QualiteState();
}

class _QualiteState extends State<Qualite> {
  final List<Map<String, String>> _qualiteList = [];
  final TextEditingController _qualiteControllers = TextEditingController();
  int? _editingIndex;
  bool _showForm = false;
  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  Future<void> _loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedqualites = prefs.getStringList('qualiteList');
    if (savedqualites != null) {
      setState(() {
        _qualiteList.addAll(
          savedqualites.map((e) => Map<String, String>.from(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _savequalite() {
    final newqualite = {
      'qualite': _qualiteControllers.text,
    };

    setState(() {
      if (_editingIndex != null) {
        _qualiteList[_editingIndex!] = newqualite;
        _editingIndex = null;
      } else {
        _qualiteList.add(newqualite);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    // _controllers.forEach((key, controller) => controller.clear());
    _qualiteControllers.clear();
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'qualiteList',
      _qualiteList.map((e) => jsonEncode(e)).toList(),
    );
  }

 

  void _editqualite(int index) {
    setState(() {
      _editingIndex = index;
      _qualiteControllers.text = _qualiteList[index]['qualite'] ?? '';
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deletequalite() {
  if (_editingIndex != null) {
    setState(() {
      _qualiteList.removeAt(_editingIndex!);
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
        // Display saved qualites
        ..._qualiteList.asMap().entries.map((entry) {
          final index = entry.key;
          final qualite = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: qualite['qualite'] ?? '',
              edit: () => _editqualite(index),
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
            label: Text("Ajouter une qualité"),
          ),
        // Form fields
     if (_showForm)...[
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Qualité',
            style: context.textTheme.bodySmall,
          ),
          gapH6,
          Input(
            controller: _qualiteControllers,
            textInputAction: TextInputAction.next,
            maxLines: 2,
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
                onTap:_deletequalite,
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
            onPressed: _savequalite,
            icon: Icon(Icons.check),
            label: Text(_editingIndex != null ? 'Modifier' : 'Terminer'),
          ),
            ],
          )
        ]       
     ]);
  }

}

