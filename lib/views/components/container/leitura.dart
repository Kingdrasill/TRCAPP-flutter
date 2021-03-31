import 'package:flutter/material.dart';

class LeituraContainer extends StatelessWidget {
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
                  'Leitura Palmapé',
                  softWrap: true,
                  style: TextStyle(fontSize: 36, color: Colors.green[600]),
                ),
                Divider(height: 30, color: Colors.black26, thickness: 1,),
                Text(
                  'Repare que a plataforma possui 3 linhas horizontais e 4 linhas verticais que se cruzam, formando um painel quadriculado contendo colunas verticais e horizontais, veja as figuras:',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('assets/images/1.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  '4 colunas horizontais que são lidas na partitura na ordem crescente de baixo para cima. Faça contagens de 1 até 4 repetidas vezes, observando as setas e os números:.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('assets/images/2.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  '5 colunas verticais que representam na partitura as 5 maneiras de percurtir um som usando o corpo:',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('assets/images/3.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  'Pé direito é representado na coluna da extremidade direita. ',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset('assets/images/4.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  'Pé esquerdo é representado na coluna da extremidade esquerda.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset('assets/images/5.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  'Palma é representada na coluna central da partitura.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset('assets/images/6.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  'Mão direita é representada entre as colunas da palma e do pé direito.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset('assets/images/7.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  'Mão esquerda é representada entre as colunas da palma e do pé esquerdo.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset('assets/images/8.jpeg',)
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
