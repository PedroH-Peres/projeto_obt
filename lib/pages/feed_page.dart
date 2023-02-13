import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/app_drawer.dart';
import 'package:projeto_obt/components/first_time.dart';
import 'package:projeto_obt/models/auth.dart';
import 'package:projeto_obt/pages/chat_page.dart';
import 'package:projeto_obt/pages/perfil_page.dart';
import 'package:projeto_obt/utils/approutes.dart';

import '../core/auth/auth_service.dart';
import '../core/models/app_user.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Auth.isFirstTime
        ? FirstTimePopup()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Feed"),
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.chatPage),
                    icon: const Icon(Icons.chat)),
                IconButton(
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.perfilPage),
                    icon: const Icon(Icons.person))
              ],
            ),
            drawer: AppDrawer(),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              child: Column(children: [
                Text("Navegar por profissões:"),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(leading: Text("teste"),),
                      ListTile(leading: Text("teste"),)
                    ],
                  ),
                )
              ],)
            ),
          );
  }
}
