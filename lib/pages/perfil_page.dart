import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/app_drawer.dart';
import 'package:projeto_obt/components/edit_perfil.dart';
import 'package:projeto_obt/core/auth/auth_firebase_service.dart';
import 'package:projeto_obt/pages/edit_page.dart';

import '../core/auth/auth_service.dart';
import '../core/models/app_user.dart';

class PerfilPage extends StatefulWidget {

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Meu Perfil"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => EditPage())));
              },
              icon: Icon(isEditMode ? Icons.check_circle_outline: Icons.border_color_outlined, size: 30,))
        ],
      ),
      body: 
      Column(
        children: [
          Card(
            elevation: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: const CircleAvatar(
                      maxRadius: 62,
                      minRadius: 40,
                      child: Icon(
                        Icons.person,
                        size: 85,
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome: ${AuthService().currentUser!.name}',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Tipo de conta: ${AuthService().currentUser!.tipoConta}',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
          const Text("Informações:"),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text("Email: ${AuthService().currentUser!.email}"),
                  Text("...")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
