import 'package:flutter/material.dart';
import 'package:travelappui/constants/colors.dart';
import 'package:travelappui/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(children: [
        Container(
          height: size.height * 0.55,
          color: Colors.black,
            child: Image(
              image: AssetImage('assets/image/FondoSplashScreen.jpg'),
              fit: BoxFit.cover,
            ),
        ),
        Container(
          color: Colors.black,
          height: size.height * 0.45,
          padding: EdgeInsets.all(32),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              SizedBox(height: 30),
              Flexible(
                  child: Text(
                    "¡Adquiere tus boletos!",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  )
              ),
              SizedBox(height: 50),
              Text(
                "Vive la mejor experiencia con tus artistas favoritos, reserva aquí tus entradas para los mejores eventos.",
                maxLines: 4,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.ROUTE_Home);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'PlayFair',
                          fontWeight: FontWeight.bold)),
                  child: Center(
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.black87,),
                    ),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
