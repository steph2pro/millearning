import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/forms/input.dart';
import 'package:millearnia/src/shared/components/validator/input_validator.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_card.dart';

class Certificat extends StatefulWidget {
  @override
  _CertificatState createState() => _CertificatState();
}

class _CertificatState extends State<Certificat> {
  final List<Map<String, String>> _certificatList = [];
  final Map<String, TextEditingController> _controllers = {
    'Certificat': TextEditingController(),
    'Période': TextEditingController(),
    'Description': TextEditingController(),
  };
  int? _editingIndex;
  bool _showForm = false;



  @override
  void initState() {
    super.initState();
    _loadFromSharedPcertificats();
  }

  Future<void> _loadFromSharedPcertificats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedcertificats = prefs.getStringList('certificatList');
    if (savedcertificats != null) {
      setState(() {
        _certificatList.addAll(
          savedcertificats.map((e) => Map<String, String>.from(jsonDecode(e))).toList(),
        );
      });
    }
  }

  void _savecertificat() {
    final newcertificat = {
      'Certificat': _controllers['Certificat']!.text,
      'Période': _controllers['Période']!.text,
      'Description': _controllers['Description']!.text,
    };

    setState(() {
      if (_editingIndex != null) {
        _certificatList[_editingIndex!] = newcertificat;
        _editingIndex = null;
      } else {
        _certificatList.add(newcertificat);
      }
      _showForm = false; // Cache le formulaire après soumission
    });

    _controllers.forEach((key, controller) => controller.clear());
    _saveToSharedPcertificats();
  }

  Future<void> _saveToSharedPcertificats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'certificatList',
      _certificatList.map((e) => jsonEncode(e)).toList(),
    );
  }

  
  void _editcertificat(int index) {
    setState(() {
      _editingIndex = index;
      _certificatList[index].forEach((key, value) {
        _controllers[key]?.text = value;
      });
      _showForm = true; // Affiche le formulaire lors de la modification
    });
  }
  void _deletecertificat() {
  if (_editingIndex != null) {
    setState(() {
      _certificatList.removeAt(_editingIndex!);
      _editingIndex = null;
    });
    _saveToSharedPcertificats();
      _showForm = false;

  }
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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display saved certificats
        ..._certificatList.asMap().entries.map((entry) {
          final index = entry.key;
          final certificat = entry.value;
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: FormationCard(
              title: certificat['Certificat'] ?? '',
              edit: () => _editcertificat(index),
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
            label: Text("Ajouter un certificat"),
          ),

        // Form fields
        if (_showForm) ...[
          ..._controllers.keys.map((key) {
             if (key == 'Période') {
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
             ? InkWell(
                onTap:_deletecertificat,
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
            onPressed: _savecertificat,
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

