import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
      ),
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Card(
              elevation: 0,
              color: Color.fromARGB(255, 243, 243, 243),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 40,
                    child: Image.asset("assets/images/daniel.jfif"),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daniel Penido',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          'Musico, multi-instrumentista e professor de percussão.',
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Baterista e percussionista, atua com aulas, shows, gravações, espetáculos e oficinas de musicalização e percepção rítmica para alunos, educadores, idosos e trabalhos corporativos.',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
            SizedBox(height: 7,),
            Text(
              'Autor do livro:',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 22, color: Colors.grey[800]),
            ),
            SizedBox(height: 5,),
            RichText(
              textAlign: TextAlign.start,
              text: new TextSpan(
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: 'PALMAPÉ - ENSINO RÍTMICO E CONSCIÊNCIA CORPORAL',
                    style: new TextStyle(fontWeight: FontWeight.w700,)
                  ),
                  new TextSpan(
                    text: ' que apresenta um novo conceito em estudo da rítmica, usada para criação de conteúdos e atividades que usam o próprio corpo como instrumento de estudo, pesquisa e descobertas.',
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black,),
            Text(
              'Links',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 26, color: Colors.grey[800]),
            ),
            SizedBox(height: 7,),
            Row(
              children: [
                Text(
                  "Youtube - ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                InkWell(
                  child: Text(
                    'bit.ly/31k1N9i',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18
                    ),
                  ),
                  onTap: () => launch('https://bit.ly/31k1N9i'),
                ),
              ],
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Text(
                  "Telegram - ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                InkWell(
                  child: Text(
                    't.me/palmape',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18
                    ),
                  ),
                  onTap: () => launch('https://t.me/palmape'),
                ),
              ],
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Text(
                  "Instagram - ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                InkWell(
                  child: Text(
                    'bit.ly/2PqI6Kc',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18
                    ),
                  ),
                  onTap: () => launch('https://bit.ly/2PqI6Kc'),
                ),
              ],
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Text(
                  "Hotmart - ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),
                ),
                InkWell(
                  child: Text(
                    'go.hotmart.com/K37968771M',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18
                    ),
                  ),
                  onTap: () => launch('https://go.hotmart.com/K37968771M'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
