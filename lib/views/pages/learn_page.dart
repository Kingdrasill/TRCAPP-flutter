import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:tcc_app/views/components/container/introducao.dart';
import 'package:tcc_app/views/components/container/leitura.dart';
import 'package:tcc_app/views/components/container/plataforma.dart';
import 'package:tcc_app/views/components/container/praticar.dart';
import 'package:tcc_app/views/components/container/pratique.dart';
import 'package:tcc_app/views/components/container/pulsacao.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  final _items = [
    IntroducaoContainer(),
    PulsacaoContainer(),
    PlataformaContainer(),
    LeituraContainer(),
    PraticarContainer(),
    PratiqueContainer(),
  ];
  final _pageController = PageController();
  final _currentPageNotifier =ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 243,243,243),
      ),
      backgroundColor: Color.fromARGB(255, 243,243,243),
      body: Stack(
        children: <Widget>[
          _buildPageView(),
          _buildCircleIndicator(),
        ],
      ),
    );
  }

  _buildPageView() {
    return Container(
      child: PageView.builder(
        itemCount: _items.length,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: _items[index],
          );
        },
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        },
      ),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          dotColor: Colors.grey[500],
          selectedDotColor: Colors.green[600],
          size:6.0,
          selectedSize: 11.0,
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

}
