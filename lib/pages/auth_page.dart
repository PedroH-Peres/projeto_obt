import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Projeto OBT", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          SingleChildScrollView(child: AuthForm()),
          Text("by: Pedro H. Peres", style:  TextStyle(fontSize: 13, color: Colors.white),)
        ],
      ),
    );
  }
}
