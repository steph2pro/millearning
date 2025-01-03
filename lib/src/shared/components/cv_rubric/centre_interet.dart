import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/cv/models/loisir.dart';
import 'package:millearnia/src/shared/components/cv_rubric/niveau_indicateur.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class CentreInteret extends StatefulWidget {
  @override
  _CentreInteretState createState() => _CentreInteretState();
}

class _CentreInteretState extends State<CentreInteret> {
  final List<Loisir> _centreInteretList = [];
  final TextEditingController _centreInteretControllers = TextEditingController();
  int? _editingIndex;
  bool _showForm = false;
  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  Future<void> _loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('centreInteretList');
    List<String>? savedcentreInterets = prefs.getStringList('centreInteretList');
    if (savedcentreInterets != null) {
      setState(() {
        _centreInteretList.addAll(
          savedcentreInterets.map((e) => Loisir.fromJson(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _savecentreInteret() {
    final newcentreInteret = Loisir(
      loisir: _centreInteretControllers.text,
    );

    setState(() {
      if (_editingIndex != null) {
        _centreInteretList[_editingIndex!] = newcentreInteret;
        _editingIndex = null;
      } else {
        _centreInteretList.add(newcentreInteret);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    // _controllers.forEach((key, controller) => controller.clear());
    _centreInteretControllers.clear();
    _saveToSharedPreferences();
  }

  Future<void> _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'centreInteretList',
      _centreInteretList.map((e) => jsonEncode(e)).toList(),
    );
  }

 

  void _editcentreInteret(int index) {
    setState(() {
      _editingIndex = index;
      _centreInteretControllers.text = _centreInteretList[index].loisir;
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deletecentreInteret() {
  if (_editingIndex != null) {
    setState(() {
      _centreInteretList.removeAt(_editingIndex!);
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
        // Display saved centreInterets
        ..._centreInteretList.asMap().entries.map((entry) {
          final index = entry.key;
          final centreInteret = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: centreInteret.loisir,
              edit: () => _editcentreInteret(index),
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
            label: Text("Ajouter un Centre d'interet"),
          ),
        // Form fields
     if (_showForm)...[
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'centre d\'interet',
            style: context.textTheme.bodySmall,
          ),
          gapH6,
          Input(
            controller: _centreInteretControllers,
            textInputAction: TextInputAction.next,
            maxLines: 2,
          ),
          gapH20,
         
        ],
      ),
          SizedBox(height: 10),
        
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _editingIndex != null 
            ?InkWell(
                onTap:_deletecentreInteret,
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
            onPressed: _savecentreInteret,
            icon: Icon(Icons.check),
            label: Text(_editingIndex != null ? 'Modifier' : 'Terminer'),
          ),
            ],
          )
        ]       
     ]);
  }

}

