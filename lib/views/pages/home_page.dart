import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_app/data/database/database.dart';
import 'package:tcc_app/data/models/partitura_model.dart';
import 'package:tcc_app/routes/app_routes.dart';
import 'package:tcc_app/views/components/buttons/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PartituraModel> _partituras = [];

  @override
  void initState() {
    super.initState();
    _initializedatabase();
  }

  Future<bool> _getBoolFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final generated = prefs.getBool('generated');
    if (generated == null) {
      return false;
    }
    return generated;
  }

  Future<void> _initializedatabase() async {
    final prefs = await SharedPreferences.getInstance();

    bool isGenerated = await _getBoolFromSharedPref();

    if(isGenerated == false) {
      prefs.setBool('generated', true);


      final responseData = await rootBundle.loadString('assets/data_json/partituras_iniciais.json');
      final data = json.decode(responseData);
      for(Map i in data){
        _partituras.add(PartituraModel.fromJson(i));
      }
      final dao = Provider.of<PartituraDao>(context);
      for(int i=0; i<_partituras.length; i++){
        final partitura = PartiturasCompanion(
          name: Value(_partituras[i].name),
          size: Value(_partituras[i].size),
          partitura: Value(json.encode(_partituras[i].partitura)),
        );
        dao.insertPartitura(partitura);
      }
      print("Finished creating!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',),
            SizedBox(height: 10.0),
            BotaoLiso(
              texto: "Aprenda o método",
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.LEARN);
              },
            ),
            SizedBox(height: 10.0),
            BotaoLiso(
              texto: "Praticar",
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.SELECT);
              },
            ),
            SizedBox(height: 10.0),
            BotaoLiso(
              texto: "Criar partitura",
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CREATE);
              },
            ),
            SizedBox(height: 10.0),
            BotaoLiso(
              texto: "Sobre o criador",
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.ABOUT);
              },
            ),
          ],
        ),
      ),
    );
  }
}
