import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CelulaTabela extends StatefulWidget {
  bool valor;
  String imagem;
  double width;
  double height;

  CelulaTabela({this.valor, this.imagem, this.width, this.height});

  @override
  _CelulaTabelaState createState() => _CelulaTabelaState();
}

class _CelulaTabelaState extends State<CelulaTabela> {
  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: InkWell(
        onTap: () {
          mudarImagem();
        },
        child: Image.asset(
          widget.valor ? widget.imagem : "",
          height: widget.height,
          width: widget.width,
        ),
      ),
    );
  }

  void mudarImagem() {
    setState(() {
      widget.valor = !widget.valor;
    });
  }
}
