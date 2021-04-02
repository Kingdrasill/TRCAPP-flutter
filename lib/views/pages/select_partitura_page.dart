import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tcc_app/data/database/database.dart';
import 'package:tcc_app/data/models/partitura_model.dart';
import 'package:tcc_app/routes/app_routes.dart';
import 'package:tcc_app/views/pages/practice_page.dart';

class SelecionarPartitura extends StatefulWidget {
  @override
  _SelecionarPartituraState createState() => _SelecionarPartituraState();
}

class _SelecionarPartituraState extends State<SelecionarPartitura> {
  int quadros = 1;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        title: Text(
          'Lista de partituras',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed(AppRoutes.CREATE);
              setState(() {});
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildPartituraList(context)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "1 quadro",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "2 quadros",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "4 quadros",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "8 quadros",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0)
              quadros = 1;
            else if (index == 1)
              quadros = 2;
            else if (index == 2)
              quadros = 4;
            else if (index == 3) quadros = 8;
          });
        },
      ),
    );
  }

  StreamBuilder<List<Partitura>> _buildPartituraList(BuildContext context) {
    final dao = Provider.of<PartituraDao>(context);
    return StreamBuilder(
      stream: dao.watchPartiturasBySize(quadros),
      builder: (context, AsyncSnapshot<List<Partitura>> snapshot) {
        final partituras = snapshot.data ?? List();

        return ListView.separated(
          itemCount: partituras.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.grey[600],
          ),
          itemBuilder: (_, index) {
            final itemPartitura = partituras[index];
            return _buildListItem(itemPartitura, dao);
          },
        );
      },
    );
  }

  Widget _buildListItem(Partitura itemPartitura, PartituraDao dao) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: "Delete",
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => dao.deletePartitura(itemPartitura),
        ),
      ],
      child: ListTile(
        title: Text(
          itemPartitura.name,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          "Quadros: " + itemPartitura.size.toString(),
          style: TextStyle(fontSize: 16),
        ),
        onTap: () async {
          var item = new PartituraModel(
            id: itemPartitura.id,
            name: itemPartitura.name,
            size: itemPartitura.size,
            partitura: itemPartitura.partitura,
          );
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new PracticePage(
                        dadosIniciais: item,
                      )));
        },
      ),
    );
  }
}
