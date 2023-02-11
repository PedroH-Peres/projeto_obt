import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../core/auth/auth_service.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
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
                    crossAxisAlignment: CrossAxisAlignment.start
                    ,children: [
                    Text('Nome: ${AuthService().currentUser!.name}', style: TextStyle(fontSize: 15),),
                    SizedBox(height: 14,),
                    Text('Tipo de conta: ${AuthService().currentUser!.tipoConta}', style: TextStyle(fontSize: 15),)
                  ],)
              ],
            ),
          ),
          Center(child: Text("Informações:"))
        ],
      ),
    );
  }
}
