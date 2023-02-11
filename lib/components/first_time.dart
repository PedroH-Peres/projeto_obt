import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/pages/auth_or_page.dart';

import '../core/auth/auth_service.dart';
import '../models/auth.dart';

class FirstTimePopup extends StatefulWidget {
  const FirstTimePopup({super.key});

  @override
  State<FirstTimePopup> createState() => _FirstTimePopupState();
}

class _FirstTimePopupState extends State<FirstTimePopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Seja bem-vindo, ${AuthService().currentUser!.name}!",
                    style: TextStyle(fontSize: 22),
                  ),
                  Divider(),
                  Text(
                    "Aqui será a página de apresentação...",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: (() {
                      Auth.firstTime = false;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => AuthOrPage())));
                    }),
                    child: Text("Prosseguir"),
                  )
                ],
              ),
            )));
  }
}
