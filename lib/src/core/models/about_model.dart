// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromMap(jsonString);

import 'dart:convert';

AboutModel aboutModelFromMap(String str) => AboutModel.fromMap(json.decode(str));

String aboutModelToMap(AboutModel data) => json.encode(data.toMap());

class AboutModel {
    AboutModel({
        this.id,
        this.appname,
        this.appversion,
        this.appphone,
        this.appmail,
        this.apppoweredby,
    });

    final int id;
    final String appname;
    final String appversion;
    final String appphone;
    final String appmail;
    final String apppoweredby;

    AboutModel copyWith({
        int id,
        String appname,
        String appversion,
        String appphone,
        String appmail,
        String apppoweredby,
    }) => 
        AboutModel(
            id: id ?? this.id,
            appname: appname ?? this.appname,
            appversion: appversion ?? this.appversion,
            appphone: appphone ?? this.appphone,
            appmail: appmail ?? this.appmail,
            apppoweredby: apppoweredby ?? this.apppoweredby,
        );

    factory AboutModel.fromMap(Map<String, dynamic> json) => AboutModel(
        id: json["id"],
        appname: json["appname"],
        appversion: json["appversion"],
        appphone: json["appphone"],
        appmail: json["appmail"],
        apppoweredby: json["apppoweredby"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "appname": appname,
        "appversion": appversion,
        "appphone": appphone,
        "appmail": appmail,
        "apppoweredby": apppoweredby,
    };
}
