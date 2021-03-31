import 'package:flutter/material.dart';

class PratiqueContainer extends StatelessWidget {
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
                  'Pratique a Partitura',
                  softWrap: true,
                  style: TextStyle(fontSize: 36, color: Colors.green[600]),
                ),
                Divider(height: 30, color: Colors.black26, thickness: 1,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('assets/images/1.jpeg',)
                ),
                SizedBox(height: 7.0),
                Text(
                  'Exemplo1',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Faça as contagens lentamente de 1 até o 4 em voz alta ou em pensamento, observando a ordem de baixo para cima e o que cada número pede para o seu corpo fazer:',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Memorize a relação que foi criada entre os números e as ações do seu corpo.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Você está conduzindo seu cérebro a memorizar 4 movimentos usando falando os 4 números e criando uma pulsação.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'A velocidade das pulsações você é que vai definir de acordo com o seu nível de dificuldade da determinada partitura.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('assets/images/10.jpeg',)
                ),
                SizedBox(height: 7.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1 golpear com a mão direita',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '2 golpear com a mão esquerda',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '3 golpear com a mão direita',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '4 bater uma palma',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                  ],
                ),
                SizedBox(height: 15,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
