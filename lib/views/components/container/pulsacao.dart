import 'package:flutter/material.dart';

class PulsacaoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pulsação Rítmica',
                  softWrap: true,
                  style: TextStyle(fontSize: 36, color: Colors.green[600]),
                ),
                Divider(height: 30, color: Colors.black26, thickness: 1,),
                Text(
                  'Quando ouvimos os tick tacks de um relógio ou quando sentimos o nosso coração bater, observamos que acontecem sons ou pulsações constantes e regulares.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Essas constâncias de sons que se repetem quando sentimos ou ouvimos, chamamos de pulsações.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Essas pulsações podem acontecer mais rápidas ou mais lentas, mas seguem sempre uma mesma regularidade constante.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Isso nos permite fazer uma medição de quantas pulsações ou batidas acontecem por minuto.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Temos então que as pulsações ou os andamentos rítmicos são medidos em bpm (batidas por minuto), podendo acontecer mais rápidas ou mais lentas.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Já percebeu que quando ouvimos um som ou um timbre agradável que se mantém em uma constante cadência rítmica, temos uma sensação de hipnose ou prazer e que de certa forma nos faz prender nossa atenção?',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
