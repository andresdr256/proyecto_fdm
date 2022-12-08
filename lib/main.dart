import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelappui/routes/routes.dart';
import 'package:travelappui/views/HomePage/state/homepageStateProvider.dart';
import 'package:travelappui/views/SplashScreen/splashscreen.dart';
import './constants/constants.dart';
import 'package:your_splash/your_splash.dart';
import './views/HomePage/homepage.dart';
import './theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool credencialesOK;
String usrCorreo;
String usrPass;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  credencialesOK = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext csontext) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageStateProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kHomePageTitle,
        theme: kAppTheme,
        initialRoute: AppRoutes.ROUTE_Initial,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}

setCredencialesStatus(bool status) {
  credencialesOK = status;
}

bool getCredencialesStatus() {
  return credencialesOK;
}
