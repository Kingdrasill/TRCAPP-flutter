import 'package:flutter/material.dart';

class PraticarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Como Praticar?',
                  softWrap: true,
                  style: TextStyle(fontSize: 36, color: Colors.green[600]),
                ),
                Divider(height: 30, color: Colors.black26, thickness: 1,),
                Text(
                  'Escolha uma posição confortável: sentado ou de pé.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Palmas: bata as palmas confortavelmente da sua maneira ou desenvolva a sua própria técnica sonora para este estudo. ',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Mãos: bata as mãos livremente onde desejar: no peito, na barriga, nas pernas, na mesa, usando um instrumento musical ou nas palmas das mãos de outra pessoa.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Pés: bata os pés no chão confortavelmente da sua maneira: parado ou em ação para dançar ou criar performances.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Você possui três técnicas para golpear o chão com seus pés: ',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1. usando só o calcanhar com a planta apoiada',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      '2. usando só a planta com o calcanhar apoiado',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      '3. usando os dois ao mesmo tempo.',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
