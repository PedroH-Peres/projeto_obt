import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/app_drawer.dart';
import 'package:projeto_obt/components/first_time.dart';
import 'package:projeto_obt/core/auth/auth_firebase_service.dart';
import 'package:projeto_obt/models/auth.dart';
import 'package:projeto_obt/pages/area_nav.dart';
import 'package:projeto_obt/pages/chat_page.dart';
import 'package:projeto_obt/pages/perfil_page.dart';
import 'package:projeto_obt/pages/prof_overview_page.dart';
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
              title: const Text("Página Inicial"),
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
                      height: 18,
                    ),
                    const Text("Navegar por profissões:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Container(
                    child: Text("Aqui vai as filtragens"),),
                    // Aqui vai uma listView com tópicos de principais profissões pra filtrar.
                    //Botão no final de "Outros cursos"
                    const SizedBox(
                      height: 18,
                    ),
                    Divider(),
                    Expanded(
                        child: ListView(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: ((context) => ProfOverviewPage(name: "Engenharia",)))),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              "Engenharia",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: ((context) => ProfOverviewPage(name: "Medicina",)))),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              "Medicina",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: ((context) => ProfOverviewPage(name: "Ciência da Computação",)))),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              "Ciencia da computação",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => AreaNav())));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              "Navegar por áreas",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
