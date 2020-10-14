// To parse this JSON data, do
//
//     final contactModel = contactModelFromMap(jsonString);

import 'dart:convert';

ContactModel contactModelFromMap(String str) => ContactModel.fromMap(json.decode(str));

String contactModelToMap(ContactModel data) => json.encode(data.toMap());

class ContactModel {
    ContactModel({
        this.id,
        this.name,
        this.phone,
    });

    final int id;
    final String name;
    final String phone;

    ContactModel copyWith({
        int id,
        String name,
        String phone,
    }) => 
        ContactModel(
            id: id ?? this.id,
            name: name ?? this.name,
            phone: phone ?? this.phone,
        );

    factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phone": phone,
    };
}
