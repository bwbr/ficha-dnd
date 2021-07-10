import 'package:fichadnd/listHero.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final ficha = FichaDND();
  print("teste $ficha");
  runApp(ficha);
}

class FichaDND extends StatefulWidget {
  @override
  FichaDNDState createState() {
    return FichaDNDState();
  }
}

class FichaDNDState extends State<FichaDND> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    //Evita rotacionar tela
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.hasError);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.connectionState);
          return Container();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          theme: ThemeData(
            accentColor: Colors.black,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.black,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          home: ListHero(),
        );
      },
    );
  }
}
