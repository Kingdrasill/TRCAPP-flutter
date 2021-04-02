import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Table;
import 'package:provider/provider.dart';
import 'package:tcc_app/data/database/database.dart';
import 'package:tcc_app/data/models/partitura_model.dart';
import 'package:tcc_app/data/models/table_model.dart';
import 'package:tcc_app/views/components/celula_tabela/index.dart';
import 'package:tcc_app/views/components/dialog_box/index.dart';

// ignore: must_be_immutable
class CreatePartituraPage extends StatefulWidget {
  PartituraModel dadosIniciais;

  CreatePartituraPage({this.dadosIniciais});

  @override
  _CreatePartituraPageState createState() => _CreatePartituraPageState();
}

class _CreatePartituraPageState extends State<CreatePartituraPage> {
  final _scrollController = ScrollController();

  List<TableModel> _partitura = [];

  String nome;
  int size;

  List<Map<String, List<CelulaTabela>>> celulas = [];

  int variavel = 0;

  List<bool> row = [false, false, false, false, false];

  double _imageHeight = 90;
  double _imageWidth = 70;

  @override
  void initState() {
    super.initState();
    iniciarDados();
  }

  void iniciarDados() {
    if (widget.dadosIniciais == null) return;
    setState(() {
      this.nome = widget.dadosIniciais.name;
      this.size = widget.dadosIniciais.size;

      for (int i = 0; i < size; i++) {
        _partitura.add(TableModel(row1: row, row2: row, row3: row, row4: row));
      }

      for (int i = 0; i < _partitura.length; i++) {
        celulas.add({
          'row1': [
            new CelulaTabela(
              valor: _partitura[i].row1[0],
              imagem: "assets/images/pee.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row1[1],
              imagem: "assets/images/maoe.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row1[2],
              imagem: "assets/images/palma.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row1[3],
              imagem: "assets/images/maod.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row1[4],
              imagem: "assets/images/ped.png",
              width: _imageWidth,
              height: _imageHeight,
            )
          ],
          'row2': [
            new CelulaTabela(
              valor: _partitura[i].row2[0],
              imagem: "assets/images/pee.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row2[1],
              imagem: "assets/images/maoe.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row2[2],
              imagem: "assets/images/palma.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row2[3],
              imagem: "assets/images/maod.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row2[4],
              imagem: "assets/images/ped.png",
              width: _imageWidth,
              height: _imageHeight,
            )
          ],
          'row3': [
            new CelulaTabela(
              valor: _partitura[i].row3[0],
              imagem: "assets/images/pee.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row3[1],
              imagem: "assets/images/maoe.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row3[2],
              imagem: "assets/images/palma.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row3[3],
              imagem: "assets/images/maod.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row3[4],
              imagem: "assets/images/ped.png",
              width: _imageWidth,
              height: _imageHeight,
            )
          ],
          'row4': [
            new CelulaTabela(
              valor: _partitura[i].row4[0],
              imagem: "assets/images/pee.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row4[1],
              imagem: "assets/images/maoe.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row4[2],
              imagem: "assets/images/palma.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row4[3],
              imagem: "assets/images/maod.png",
              width: _imageWidth,
              height: _imageHeight,
            ),
            new CelulaTabela(
              valor: _partitura[i].row4[4],
              imagem: "assets/images/ped.png",
              width: _imageWidth,
              height: _imageHeight,
            )
          ],
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              this.nome,
              style: TextStyle(fontSize: 22),
            ),
            elevation: 2,
            backgroundColor: Color.fromARGB(255, 243, 243, 243),
            actions: [
              InkWell(
                onTap: () {
                  bool response = _checkPartitura();
                  if (response) {
                    var lista = _preencherPartitura();
                    _salvarPartitura(lista);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.save,
                      ),
                      Text(
                        "Salvar",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Color.fromARGB(255, 243, 243, 243),
          body: Align(alignment: Alignment.topCenter, child: _buildPartitura()),
        );
      },
    );
  }

  Padding _buildPartitura() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          reverse: true,
          itemCount: this.size,
          itemBuilder: (_, index) {
            return _buildTable(index);
          },
        ));
  }

  Padding _buildTable(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Table(
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(decoration: BoxDecoration(color: Colors.white), children: [
              celulas[index]['row1'][0],
              celulas[index]['row1'][1],
              celulas[index]['row1'][2],
              celulas[index]['row1'][3],
              celulas[index]['row1'][4],
            ]),
            TableRow(decoration: BoxDecoration(color: Colors.white), children: [
              celulas[index]['row2'][0],
              celulas[index]['row2'][1],
              celulas[index]['row2'][2],
              celulas[index]['row2'][3],
              celulas[index]['row2'][4],
            ]),
            TableRow(decoration: BoxDecoration(color: Colors.white), children: [
              celulas[index]['row3'][0],
              celulas[index]['row3'][1],
              celulas[index]['row3'][2],
              celulas[index]['row3'][3],
              celulas[index]['row3'][4],
            ]),
            TableRow(decoration: BoxDecoration(color: Colors.white), children: [
              celulas[index]['row4'][0],
              celulas[index]['row4'][1],
              celulas[index]['row4'][2],
              celulas[index]['row4'][3],
              celulas[index]['row4'][4],
            ]),
          ]),
    );
  }

  _animateToIndex(index) {
    _scrollController.animateTo(_imageHeight * 4 * index,
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
  }

  void _salvarPartitura(List<TableModel> lista) async {
    final dao = Provider.of<PartituraDao>(context);
    List<dynamic> partituraJson = [];
    for (int i = 0; i < lista.length; i++) {
      print(lista[i]);
      partituraJson.add({
        "tabela": {
          "row1": "${lista[i].row1}",
          "row2": "${lista[i].row2}",
          "row3": "${lista[i].row3}",
          "row4": "${lista[i].row4}",
        }
      });
    }
    print(partituraJson);
    final partituraTable = PartiturasCompanion(
        name: Value(nome),
        size: Value(size),
        partitura: Value(jsonEncode(partituraJson)));
    await dao.insertPartitura(partituraTable);
    Navigator.pop(context);
  }

  bool _checkPartitura() {
    int palma = 0;
    int mao = 0;
    for (int i = 0; i < celulas.length; i++) {
      for (int j = 0; j < celulas[i]['row1'].length; j++) {
        if (j == 1 && celulas[i]['row1'][j].valor == true)
          mao++;
        else if (j == 2 && celulas[i]['row1'][j].valor == true)
          palma++;
        else if (j == 3 && celulas[i]['row1'][j].valor == true) mao++;

        if (palma > 0 && mao > 0) {
          var dialog = new DialogBox();
          _animateToIndex(i);
          dialog.showWarning(context,
              titulo: "ATENÇÃO",
              texto: "Não pode haver palma e mão ao mesmo tempo!");
          return false;
        }
      }
      palma = 0;
      mao = 0;
      for (int j = 0; j < celulas[i]['row2'].length; j++) {
        if (j == 1) {
          if (celulas[i]['row2'][j].valor == true) mao++;
        } else if (j == 2) {
          if (celulas[i]['row2'][j].valor == true) palma++;
        } else if (j == 3 && celulas[i]['row2'][j].valor == true) mao++;

        if (palma > 0 && mao > 0) {
          var dialog = new DialogBox();
          _animateToIndex(i);
          dialog.showWarning(context,
              titulo: "ATENÇÃO",
              texto: "Não pode haver palma e mão ao mesmo tempo!");
          return false;
        }
      }
      palma = 0;
      mao = 0;
      for (int j = 0; j < celulas[i]['row3'].length; j++) {
        if (j == 1 && celulas[i]['row3'][j].valor == true)
          mao++;
        else if (j == 2 && celulas[i]['row3'][j].valor == true)
          palma++;
        else if (j == 3 && celulas[i]['row3'][j].valor == true) mao++;

        if (palma > 0 && mao > 0) {
          var dialog = new DialogBox();
          _animateToIndex(i);
          dialog.showWarning(context,
              titulo: "ATENÇÃO",
              texto: "Não pode haver palma e mão ao mesmo tempo!");
          return false;
        }
      }
      palma = 0;
      mao = 0;
      for (int j = 0; j < celulas[i]['row4'].length; j++) {
        if (j == 1 && celulas[i]['row4'][j].valor == true)
          mao++;
        else if (j == 2 && celulas[i]['row4'][j].valor == true)
          palma++;
        else if (j == 3 && celulas[i]['row4'][j].valor == true) mao++;

        if (palma > 0 && mao > 0) {
          var dialog = new DialogBox();
          _animateToIndex(i);
          dialog.showWarning(context,
              titulo: "ATENÇÃO",
              texto: "Não pode haver palma e mão ao mesmo tempo!");
          return false;
        }
      }
    }
    return true;
  }

  List<TableModel> _preencherPartitura() {
    List<TableModel> lista = [];

    for (int i = 0; i < celulas.length; i++) {
      lista.add(TableModel(
        row1: [
          celulas[i]['row1'][0].valor,
          celulas[i]['row1'][1].valor,
          celulas[i]['row1'][2].valor,
          celulas[i]['row1'][3].valor,
          celulas[i]['row1'][4].valor
        ],
        row2: [
          celulas[i]['row2'][0].valor,
          celulas[i]['row2'][1].valor,
          celulas[i]['row2'][2].valor,
          celulas[i]['row2'][3].valor,
          celulas[i]['row2'][4].valor
        ],
        row3: [
          celulas[i]['row3'][0].valor,
          celulas[i]['row3'][1].valor,
          celulas[i]['row3'][2].valor,
          celulas[i]['row3'][3].valor,
          celulas[i]['row3'][4].valor
        ],
        row4: [
          celulas[i]['row4'][0].valor,
          celulas[i]['row4'][1].valor,
          celulas[i]['row4'][2].valor,
          celulas[i]['row4'][3].valor,
          celulas[i]['row4'][4].valor
        ],
      ));
    }
    return lista;
  }
}
