import 'package:chat/chat_screen.dart';
import 'package:chat/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // // Esse comando esta garantindo inicialização correta antes do flutter iniciar
  WidgetsFlutterBinding.ensureInitialized();
  // // Esse comando iniciliza o servidor
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.blue,
          )),
      home: ChatScreen(),
    );
  }
}
