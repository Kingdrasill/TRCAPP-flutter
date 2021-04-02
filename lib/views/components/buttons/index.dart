import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoLiso extends StatelessWidget {
  String texto;
  Function onPressed;

  BotaoLiso({this.texto, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.95,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 214, 214, 214),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          onPressed: onPressed,
          child: Text(
            texto,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Oswald',
            ),
          ),
        ),
      ),
    );
  }
}
