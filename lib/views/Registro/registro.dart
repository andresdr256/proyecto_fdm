import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelappui/routes/routes.dart';
import 'package:travelappui/main.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final controllerCorreo = TextEditingController();
  final controllerContrasena = TextEditingController();
  final List<String> listaEventos = ["Hell & Heaven"];
  final List<int> cantidadBoletos = [0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/image/logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 40, bottom: 0),
              child: TextField(
                controller: controllerCorreo,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Correo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 80),
              child: TextField(
                controller: controllerContrasena,
                style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Contraseña'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  final correo = controllerCorreo.text;
                  final contrasena = controllerContrasena.text;
                  CreateUser(
                      correo: correo,
                      contrasena: contrasena,
                      listaEventos: listaEventos,
                      cantidadBoletos: cantidadBoletos);
                  Navigator.pushNamed(context, AppRoutes.ROUTE_Login);
                },
                child: Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.ROUTE_Login);
              },
              child: Text(
                'Acceso de usuario',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future CreateUser(
      {String correo,
      String contrasena,
      List<String> listaEventos,
      List<int> cantidadBoletos}) async {
    usrCorreo = correo;
    usrPass = contrasena;

    final docUser = FirebaseFirestore.instance.collection('Usuarios').doc('1');

    final json = {
      'Correo': correo,
      'Contraseña': contrasena,
      'Eventos': listaEventos,
      'CantidadBoletos': cantidadBoletos,
    };

    await docUser.set(json);
  }
}
