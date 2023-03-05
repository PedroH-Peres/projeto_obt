import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/app_drawer.dart';
import 'package:projeto_obt/components/first_time.dart';
import 'package:projeto_obt/core/auth/auth_firebase_service.dart';
import 'package:projeto_obt/models/auth.dart';
import 'package:projeto_obt/pages/chat_page.dart';
import 'package:projeto_obt/pages/perfil_page.dart';
import 'package:projeto_obt/utils/approutes.dart';
import 'package:projeto_obt/utils/profissoes.dart';

import '../core/auth/auth_service.dart';
import '../core/models/app_user.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Auth.isFirstTime
        ? const FirstTimePopup()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Feed"),
              actions: [
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.chatPage),
                    icon: const Icon(Icons.chat)),
                IconButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.perfilPage),
                    icon: const Icon(Icons.person))
              ],
            ),
            drawer: AppDrawer(),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Navegar por profissões:"),
                    // Aqui vai uma listView com tópicos de principais profissões pra filtrar.
                    //Botão no final de "Outros cursos"
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "Engenharia",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "Medicina",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "Ciência da Computação",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                )),
          );
  }
}
