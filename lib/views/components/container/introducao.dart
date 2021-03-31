import 'package:flutter/material.dart';

class IntroducaoContainer extends StatelessWidget {
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
                  'Introdução',
                  softWrap: true,
                  style: TextStyle(fontSize: 36, color: Colors.green[600]),
                ),
                Divider(height: 30, color: Colors.black26, thickness: 1,),
                Text(
                  'Há milhares de anos atrás os históricos rituais tribais indígenas de todas as culturas e de todos os povos já emanavam cores, crenças e expressões corporais, rítmicas e musicais de culto e fé.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'A música e o ritmo sempre se fundiram ao corpo, mente e movimento e ambos terão sempre o poder de transcender sentimentos, emoções e transformações.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'O prazer de dançar vem das pulsações que se repetem e nos permitem organizar ações, performances e combinar sequencias e movimentos usando os braços e as pernas, harmonizando todo o corpo e todo um contexto de emoções.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Este material introduz um método revolucionário criado pelo educador musical Daniel Penido que a mais de 20 anos vem conduzindo trabalhos de musicalização e oficinas de ritmo, desenvolvendo técnicas e formas para musicalizar e lecionar com atividades que usam o próprio corpo como ferramenta e instrumento de pesquisa e consciência corporal.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'O método usa figuras, partituras e se constrói com práticas e exercícios que estimulam o cérebro, trabalhando a memória e associando-a com as ações do corpo e as pulsações.',
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
