import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:tcc_app/data/models/partitura_model.dart';
import 'package:tcc_app/data/models/table_model.dart';

// ignore: must_be_immutable
class PracticePage extends StatefulWidget {
  PartituraModel dadosIniciais;

  PracticePage({this.dadosIniciais});

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  static AudioCache player = new AudioCache();
  static const alarmAudioPath = "audio/batida.mp3";

  final _scrollController = ScrollController();

  // ignore: unused_field
  Timer _timer;

  List<TableModel> partitura = [];
  List<bool> rowsColor = List.generate(4, (_) => false);
  List<bool> _selections = [true, false, false];
  List<bool> row = [false, false, false, false, false];
  List<int> _speeds = [1000, 750, 500];
  List<MaterialColor> _cores = [Colors.green, Colors.orange, Colors.red];

  MaterialColor _selectedColor = Colors.green;
  bool _isPlaying = false;
  bool _buttonIcon = true;
  bool _switch1 = true;
  bool _switch2 = true;

  int _currentSpeed = 1000;
  int size;
  int id;

  double _imageHeight = 90;
  double _imageWidth = 70;

  String name;

  @override
  void initState() {
    super.initState();
    iniciarDados();
  }

  void iniciarDados() {
    if (widget.dadosIniciais == null) {
      setState(() {
        for (int i = 0; i < 4; i++)
          partitura.add(TableModel(
            row1: row,
            row2: row,
            row3: row,
            row4: row,
          ));
      });
      return;
    }
    setState(() {
      this.id = widget.dadosIniciais.id;
      this.name = widget.dadosIniciais.name;
      this.size = widget.dadosIniciais.size;

      print(widget.dadosIniciais.partitura);
      List<dynamic> json = jsonDecode(widget.dadosIniciais.partitura);
      for (var item in json) {
        this.partitura.add(TableModel.fromJson(item['tabela']));
      }

      rowsColor.clear();
      rowsColor = List.generate(this.size * 4, (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(this.name),
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                color: Colors.black,
                onPressed: () => _onPressedSettings(),
              ),
            ],
            elevation: 2,
            backgroundColor: Color.fromARGB(255, 243, 243, 243),
          ),
          backgroundColor: Color.fromARGB(255, 243, 243, 243),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                for (int i = 0; i < rowsColor.length; i++) {
                  rowsColor[i] = false;
                }
                _isPlaying = !_isPlaying;
                _buttonIcon = !_buttonIcon;
              });
              if (_isPlaying) {
                startStop();
              }
            },
            backgroundColor: Colors.red[400],
            child: Icon(
              _buttonIcon ? Icons.play_arrow : Icons.stop,
              color: Colors.white,
              size: 24,
            ),
          ),
          body: Align(alignment: Alignment.topCenter, child: _buildPartitura()),
        );
      },
    );
  }

  void startStop() {
    _animateToIndex(0);
    player.clearCache();
    int counter = 0;
    _timer =
        Timer.periodic(Duration(milliseconds: _currentSpeed), (timer) async {
      if (_isPlaying) {
        counter = counter + 1;
        if (counter % 4 == 0 && counter < rowsColor.length)
          _animateToIndex((counter * 2 / 4) - 1);
        if (counter > rowsColor.length) {
          timer.cancel();
          counter = null;
          await reset();
          await _animateToIndex(0);
          startStop();
        } else if (_switch1 == true) player.play(alarmAudioPath);
        if (_switch2 == true)
          setState(() {
            rowsColor[counter - 1] = true;
          });
      } else if (!_isPlaying) {
        timer.cancel();
        counter = null;
        return;
      }
    });
  }

  _animateToIndex(index) {
    _scrollController.animateTo((_imageHeight - 40) * 4 * index,
        duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn);
  }

  reset() {
    sleep(const Duration(milliseconds: 300));
    for (int i = 0; i < rowsColor.length; i++) {
      setState(() {
        setState(() {
          rowsColor[i] = false;
        });
      });
    }
  }

  StatefulBuilder _buildBottomNavigationMenu() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Sound:',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  inactiveTrackColor: Colors.red[500],
                  activeTrackColor: Colors.green[700],
                  value: _switch1,
                  onChanged: (val) {
                    stateSetter(() => _switch1 = val);
                  },
                ),
              ],
            ),
            Divider(
              height: 5,
              thickness: 0,
              color: Color.fromARGB(255, 243, 243, 243),
            ),
            Row(
              children: [
                Text(
                  'Piscar:',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  inactiveTrackColor: Colors.red[500],
                  activeTrackColor: Colors.green[700],
                  value: _switch2,
                  onChanged: (val) {
                    stateSetter(() => _switch2 = val);
                  },
                ),
              ],
            ),
            Divider(
              height: 5,
              thickness: 0,
              color: Color.fromARGB(255, 243, 243, 243),
            ),
            Row(
              children: [
                Text(
                  'Velocidade:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: ToggleButtons(
                      fillColor: _selectedColor,
                      color: Colors.black,
                      selectedColor: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Easy'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Medium'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Hard'),
                        )
                      ],
                      isSelected: _selections,
                      onPressed: (int index) {
                        stateSetter(() {
                          for (int i = 0; i < _selections.length; i++) {
                            if (i == index) {
                              _selections[i] = true;
                              _currentSpeed = _speeds[i];
                            } else
                              _selections[i] = false;
                          }
                          _selectedColor = _cores[index];
                        });
                      }),
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  void _onPressedSettings() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 180,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  Padding _buildPartitura() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          reverse: true,
          itemCount: this.size,
          itemBuilder: (_, index) {
            final itemTable = partitura[index];
            return _buildTable(itemTable, index);
          },
        ));
  }

  Padding _buildTable(TableModel itemTable, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Table(
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children: [
          TableRow(
            children: [
              TableCell(
                  child: Image.asset(
                itemTable.row1[0] ? "assets/images/pee.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row1[1] ? "assets/images/maoe.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row1[2] ? "assets/images/palma.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row1[3] ? "assets/images/maod.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row1[4] ? "assets/images/ped.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
            ],
            decoration: BoxDecoration(
              color:
                  rowsColor[(index * 4) + 3] ? Colors.white : Colors.grey[400],
            ),
          ),
          TableRow(
            children: [
              TableCell(
                  child: Image.asset(
                itemTable.row2[0] ? "assets/images/pee.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row2[1] ? "assets/images/maoe.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row2[2] ? "assets/images/palma.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row2[3] ? "assets/images/maod.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row2[4] ? "assets/images/ped.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
            ],
            decoration: BoxDecoration(
              color:
                  rowsColor[(index * 4) + 2] ? Colors.white : Colors.grey[400],
            ),
          ),
          TableRow(
            children: [
              TableCell(
                  child: Image.asset(
                itemTable.row3[0] ? "assets/images/pee.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row3[1] ? "assets/images/maoe.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row3[2] ? "assets/images/palma.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row3[3] ? "assets/images/maod.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row3[4] ? "assets/images/ped.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
            ],
            decoration: BoxDecoration(
              color:
                  rowsColor[(index * 4) + 1] ? Colors.white : Colors.grey[400],
            ),
          ),
          TableRow(
            children: [
              TableCell(
                  child: Image.asset(
                itemTable.row4[0] ? "assets/images/pee.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row4[1] ? "assets/images/maoe.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row4[2] ? "assets/images/palma.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row4[3] ? "assets/images/maod.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
              TableCell(
                  child: Image.asset(
                itemTable.row4[4] ? "assets/images/ped.png" : "",
                width: _imageWidth,
                height: _imageHeight,
              )),
            ],
            decoration: BoxDecoration(
              color: rowsColor[(index * 4)] ? Colors.white : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
