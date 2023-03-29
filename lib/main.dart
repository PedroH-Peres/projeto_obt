import 'package:flutter/material.dart';
import 'package:projeto_obt/pages/auth_or_page.dart';
import 'package:projeto_obt/pages/auth_page.dart';
import 'package:projeto_obt/pages/chat_page.dart';
import 'package:projeto_obt/pages/edit_page.dart';
import 'package:projeto_obt/pages/feed_page.dart';
import 'package:projeto_obt/pages/perfil_page.dart';

void main() {
  runApp(const SupernovaApp());
}

class SupernovaApp extends StatelessWidget {
  const SupernovaApp({super.key});

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
        '/auth':(context) => const AuthPage(),
        '/feed':(context) => const FeedPage(),
        '/perfil': (context)=> PerfilPage(),
        '/chat':(context) => const ChatPage(),
        '/edit': ((context) => const EditPage())
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

