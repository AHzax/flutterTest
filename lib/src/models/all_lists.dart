// To parse this JSON data, do
//
//     final allpro = allproFromJson(jsonString);

import 'dart:convert';

List<Allpro> allproFromJson(String str) =>
    List<Allpro>.from(json.decode(str).map((x) => Allpro.fromJson(x)));

String allproToJson(List<Allpro> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Allpro {
  String? name;

  Allpro({
    this.name,
  });

  factory Allpro.fromJson(Map<String, dynamic> json) => Allpro(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
