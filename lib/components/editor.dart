import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Editor extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icone;
  final TextEditingController controlador;

  Editor({this.label, this.hint, this.icone, this.controlador});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: this.controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: this.label,
          hintText: this.hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}