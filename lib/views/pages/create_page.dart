import 'package:flutter/material.dart';
import 'package:tcc_app/data/models/partitura_model.dart';
import 'package:tcc_app/views/components/dialog_box/index.dart';
import 'package:tcc_app/views/components/flat_button_ext/index.dart';
import 'package:tcc_app/views/components/text_form_field_ext/index.dart';
import 'package:tcc_app/views/pages/create_partitura_page.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final _nameController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _currentSelectedValue;
  String nome;
  int size;

  var _tamanhos = ['Selecione o tamanho da partitura','1','2','4','8'];

  @override
  void initState() {
    super.initState();
    _currentSelectedValue = _tamanhos[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dados da partitura', style: TextStyle(fontSize: 22),),
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 243,243,243),
      ),
      backgroundColor: Color.fromARGB(255, 243,243,243),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormFieldExt(
                  labelText: 'Nome',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.edit),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                      isEmpty: _currentSelectedValue == "",
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          style: TextStyle(color: Colors.grey[700]),
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _tamanhos.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: FlatButtonExt(
                  text: 'Continuar',
                  onPressed: () async {
                    var dialogo = new DialogBox();
                    if (_nameController.text.trim().length == 0) {
                      dialogo.showWarning(context,
                          titulo: 'ATENÇÃO', texto: 'Nome não informado');
                      return;
                    }
                    if (_currentSelectedValue == null || _currentSelectedValue == 'Selecione o tamanho da partitura') {
                      dialogo.showWarning(context,
                          titulo: 'ATENÇÃO', texto: 'Tamanho não informado');
                      return;
                    }
                    var item = new PartituraModel(
                      name: _nameController.text,
                      size: int.parse(_currentSelectedValue),
                    );
                    await Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => new CreatePartituraPage(
                              dadosIniciais: item,
                            )
                        )
                    );
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
