import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cleanitapp/pages/Info.dart';
import 'package:cleanitapp/pages/Maps.dart';
import 'package:cleanitapp/pages/SignUp.dart';
import 'package:cleanitapp/services/auth.dart';
import 'package:cleanitapp/services/Instruction_obj.dart';
import 'package:cleanitapp/pages/UploadPage.dart';
import 'package:cleanitapp/pages/HomeScreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
  initialRoute: '/',
  routes:<String, WidgetBuilder> {
    '/':(BuildContext context) => HomeScreen(),
    '/SignUp':(BuildContext context) => SignUp(),
    '/Maps':(BuildContext context) => Maps(),
    '/UploadPage':(BuildContext context) => UploadPage(),
  },
    onUnknownRoute: (RouteSettings settings) {
  return MaterialPageRoute<void>(
  settings: settings,
  builder: (BuildContext context) =>
  Scaffold(body: Center(child: Text('Not Found'))),
  );
  },
));
}

