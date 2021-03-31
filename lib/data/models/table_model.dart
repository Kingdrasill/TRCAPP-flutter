import 'dart:convert';

class TableModel{
  List<dynamic> row1;
  List<dynamic> row2;
  List<dynamic> row3;
  List<dynamic> row4;

  TableModel({this.row1,this.row2,this.row3,this.row4});

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
    row1: jsonDecode(json['row1']),
    row2: jsonDecode(json['row2']),
    row3: jsonDecode(json['row3']),
    row4: jsonDecode(json['row4']),
  );
}