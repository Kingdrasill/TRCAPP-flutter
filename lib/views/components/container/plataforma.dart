import 'package:flutter/material.dart';

class PlataformaContainer extends StatelessWidget {
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
                  'Plataforma Palmapé',
                  softWrap: true,
                  style: TextStyle(fontSize: 36, color: Colors.green[600]),
                ),
                Divider(height: 30, color: Colors.black26, thickness: 1,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset('assets/images/9.jpeg',)
                ),
                SizedBox(height: 10.0),
                Text(
                  'Foi desenvolvida para ser compreendida por qualquer tipo de pessoa, de qualquer idade ou nível físico e intelectual, pela simplicidade, conforto e facilidade visual.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'É um TABULEIRO QUADRADO usado para compor combinações para servir de PARTITURA, podendo ser manuseado: desenhando, pintando, ou usando marcadores, objetos, bolinhas de pano ou de papel para criar as partituras.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Essas combinações que viram partituras são as ações das palmas, das mãos e dos pés, que se tornam um desafio para ser memorizado.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Este desenho quadrado em formato de um tabuleiro, pode ser um objeto físico como um instrumento de trabalho, sendo usado como um quadro ou uma tela. Nesse caso, usaria marcadores improvisando com objetos: bolinhas de imã, velcro, papelão, etc.… para compor as partituras.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'Pode ser também uma pintura no muro ou um desenho feito no chão, cavando a terra ou a areia. Nesse caso, usaria marcadores improvisando com pedras plásticos, garrafas, etc.… para compor as partituras.',
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                SizedBox(height: 7.0),
                Text(
                  'A coleção PALMAPÉ fornece as partituras em arquivo PDF formato A4, podendo ser impressa numa folha de papel A4, permitindo que você monte e organize a sua pasta ou crie seu próprio método de estudo e trabalho, usando as folhas das partituras PALMAPÉ.',
                  softWrap: true,
                  textAlign: TextAlign.justify,
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
