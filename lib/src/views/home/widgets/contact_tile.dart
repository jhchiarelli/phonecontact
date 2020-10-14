import 'package:flutter/material.dart';
import 'package:phonecontact/src/core/models/contact_model.dart';

class ContactTile extends StatelessWidget {
  final ContactModel _data;

  const ContactTile(this._data);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(4.0),
        title: Text('${_data.name}'),
        subtitle: Text('${_data.phone}'),
      ),
    );
  }
}