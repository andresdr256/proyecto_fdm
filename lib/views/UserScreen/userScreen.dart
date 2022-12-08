import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelappui/routes/routes.dart';
import 'package:travelappui/main.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

List<dynamic> evento;
List<dynamic> boletosEvento;
CollectionReference usuarios =
    FirebaseFirestore.instance.collection('Usuarios');

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mis Boletos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                    width: 170,
                    height: 120,
                    child: Image.asset('assets/image/logo.png')),
              ),
            ),

            SizedBox(
              height: 50,
            ),

            FutureBuilder(
              future: usuarios.get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  evento = snapshot.data.docs[0].data()['Eventos'];
                  boletosEvento =
                      snapshot.data.docs[0].data()['CantidadBoletos'];
                  return Text("");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),

            Container(
              child: ListTile(
                title: Text("Evento: $evento"),
                subtitle: Text("Cantidad de boletos: $boletosEvento"),
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              color: Colors.purple,
            ),

            SizedBox(
              height: 150,
            ),

            // Botones (Volver | Cerrar Sesión)
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.ROUTE_Home);
                    },
                    child: Text(
                      'Volver',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.ROUTE_Home);
                      setCredencialesStatus(false);
                    },
                    child: Text(
                      'Cerrar sesión',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
