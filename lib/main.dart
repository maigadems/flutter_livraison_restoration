import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();  // Executer une fois que l'application est lancee
  await Firebase.initializeApp(); // Connecter notre code au fichier de configuration de google services
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.ode Zen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:Accueil(),
    );
  }
}
