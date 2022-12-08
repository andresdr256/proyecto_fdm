import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelappui/routes/routes.dart';
import 'package:travelappui/main.dart';

class HellnHeaven extends StatefulWidget {
  @override
  _HellnHeavenState createState() => _HellnHeavenState();
}

class _HellnHeavenState extends State<HellnHeaven> {
  final evento = "Hell & Heaven";
  var cantidadBoletos = 0;
  List<int> boletosUsuario;

  eliminaBoleto() {
    setState(() {
      cantidadBoletos--;
      cantidadBoletos = max(cantidadBoletos, 0);
    });
  }

  agregaBoleto() {
    setState(() {
      cantidadBoletos++;
      cantidadBoletos = min(cantidadBoletos, 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de concierto
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: size.height * 0.7,
              color: Colors.grey,
              child: Image(
                image: AssetImage('assets/image/pic1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 26, left: 20, right: 20),
                height: size.height * 0.54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hell & Heaven Metal Fest",
                        style: appTheme.textTheme.headline2),
                    SizedBox(height: 4),
                    Row(children: [
                      Icon(
                        Icons.location_pin,
                        size: 14,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Foro Pegaso, Edo. Mex",
                        style: appTheme.textTheme.caption,
                      )
                    ]),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: appTheme.accentColor,
                            ),
                            splashColor: appTheme.accentColor,
                            onPressed: () {
                              eliminaBoleto();
                            }),
                        Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            cantidadBoletos.toString(),
                            style: appTheme.textTheme.caption,
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              agregaBoleto();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Descripción",
                      style: appTheme.textTheme.headline3
                          .merge(TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "El festival más importante de América Latina, vuelve en 2022",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "\$1,300.00",
                                style: TextStyle(
                                    color: appTheme.accentColor,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "MXN",
                                style: TextStyle(
                                    color: appTheme.accentColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: appTheme.accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 0,
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'PlayFair',
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              if (credencialesOK) {
                                ObtenerBoletos();
                                AgregaBoletos(cantidadBoletos);
                              } else
                                Navigator.pushNamed(
                                    context, AppRoutes.ROUTE_Login);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Reservar",
                                style: appTheme.textTheme.headline3,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

Future ObtenerBoletos() async {
  List<int> CantidadBoletos = [];
  Map<String, dynamic> snapshotData;

  DocumentReference docRef =
      FirebaseFirestore.instance.collection('Usuarios').doc('1');

  await docRef.get().then((snapshot) {
    snapshotData = snapshot.data() as Map<String, dynamic>;
    print("Cantidad Boletos: ${snapshotData['CantidadBoletos']}");
  });

  return snapshotData['CantidadBoletos'];
}

Future AgregaBoletos(cantidadBoletos) async {
  FirebaseFirestore.instance.collection('Usuarios').doc('1').set({
    'CantidadBoletos': FieldValue.arrayUnion([cantidadBoletos]),
    'Eventos': FieldValue.arrayUnion(
        ["Hell & Heaven"]),
    'Correo': usrCorreo,
    'Contrasena': usrPass
  });
}

Future EliminaBoletos() async {
  FirebaseFirestore.instance.collection('Usuarios').doc('1').update({
    'CantidadBoletos': FieldValue.arrayRemove([0])
  }).whenComplete(() {
    print('Field Deleted');
  });
}
