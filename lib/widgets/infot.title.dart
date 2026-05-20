import 'package:flutter/material.dart';

/// ======================
/// INFO TILE
/// ======================

class infoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const infoTile(
    this.icon,
    this.label,
    this.value,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}