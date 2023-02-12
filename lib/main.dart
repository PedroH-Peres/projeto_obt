import 'package:flutter/material.dart';
import 'package:projeto_obt/pages/auth_or_page.dart';
import 'package:projeto_obt/pages/auth_page.dart';
import 'package:projeto_obt/pages/chat_page.dart';
import 'package:projeto_obt/pages/feed_page.dart';
import 'package:projeto_obt/pages/perfil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto OBT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthOrPage(),
      routes: {
        '/auth':(context) => AuthPage(),
        '/feed':(context) => FeedPage(),
        '/perfil': (context)=> PerfilPage(),
        '/chat':(context) => ChatPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

