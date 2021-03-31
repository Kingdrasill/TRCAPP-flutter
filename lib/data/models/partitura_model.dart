import 'dart:convert';

class PartituraModel{
  final int id;
  final String name;
  final int size;
  final dynamic partitura;

  PartituraModel({this.id,this.name,this.size,this.partitura});

  factory PartituraModel.fromJson(Map<String, dynamic> json) => PartituraModel(
    name: json['name'],
    size: json['size'],
    partitura: json['partitura'],
  );
}