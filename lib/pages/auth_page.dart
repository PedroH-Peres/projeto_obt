import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/auth_form.dart';
import 'package:projeto_obt/core/auth/auth_service.dart';

import '../models/auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;
  void _handleSubmit(Auth data) async {
    try {
      setState(() => _isLoading = true);
      if (data.isLogin) {
        await AuthService().login(data.email, data.password);
      } else {
        Auth.setFirstTime();
        print(Auth.isFirstTime);
        await AuthService().signup(
          data.name,
          data.email,
          data.password,
          data.tipoConta,
        );
        
      }
    } catch (error) {
      print(error);
    }finally {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Projeto OBT",
              style: TextStyle(
                  fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
                child: AuthForm(
              onSubmit: _handleSubmit,
            )),
            Text("Equipe Supernova",style: TextStyle(fontSize: 13, color: Colors.white))
          ],
        ),
        if(_isLoading)
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ]),
    );
  }
}
