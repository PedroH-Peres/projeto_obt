import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/app_drawer.dart';
import 'package:projeto_obt/components/edit_perfil.dart';
import 'package:projeto_obt/core/auth/auth_firebase_service.dart';
import 'package:projeto_obt/pages/edit_page.dart';
import 'package:projeto_obt/utils/approutes.dart';

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
                Navigator.of(context).pushNamed(AppRoutes.editPage);
              },
              icon: Icon(
                isEditMode
                    ? Icons.check_circle_outline
                    : Icons.border_color_outlined,
                size: 30,
              ))
        ],
      ),
      body: Column(
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nome: ${AuthService().currentUser!.name}',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Tipo de conta: ${AuthService().currentUser!.tipoConta}',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                        AuthService().currentUser!.tipoConta == "Profissional"
                            ? AuthService().currentUser!.profissao ??
                                "Profissão não registrada"
                            : "",
                        style: TextStyle(
                            color: AuthService().currentUser!.profissao == null
                                ? Colors.red
                                : Color.fromRGBO(0, 150, 0, 1),
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          const Text(
            "Informações:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(190, 68, 137, 255),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Text("Curso desejado", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                      Text("{Aqui vai o curso}"),
                    ],),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
