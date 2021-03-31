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
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image.asset("assets/images/daniel.jfif"),
                ),
                SizedBox(width: 10,),
                Text(
                  'Daniel Penido',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Musico, multi-instrumentista e professor de percussão.',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
            SizedBox(height: 7,),
            Text(
              'Baterista e percussionista, atua com aulas, shows, gravações, espetáculos e oficinas de musicalização e percepção rítmica para alunos, educadores, idosos e trabalhos corporativos.',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
            SizedBox(height: 12,),
            Text(
              'Autor do livro:',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 22, color: Colors.grey[800]),
            ),
            SizedBox(height: 7,),
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
            InkWell(
              child: Text(
                'palmape.com',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18
                ),
              ),
              onTap: () => launch('http://www.palmape.com'),
            ),
            SizedBox(height: 4,),
            InkWell(
              child: Text(
                'instagram.com/palmaperitmo',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18
                ),
              ),
              onTap: () => launch('http://instagram.com/palmaperitmo'),
            ),
            SizedBox(height: 4,),
            InkWell(
              child: Text(
                'Instagram.com/danielpenidooficial',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18
                ),
              ),
              onTap: () => launch('http://instagram.com/danielpenidooficial'),
            ),
            SizedBox(height: 4,),
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
      ),
    );
  }
}
