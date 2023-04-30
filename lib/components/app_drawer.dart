import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/core/auth/auth_service.dart';
import 'package:projeto_obt/utils/approutes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 18,),
          const Text("Projeto  OBT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          const Divider(color: Colors.black,),
          const SizedBox(height: 5,),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.feedPage),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(children: const [
                  Icon(Icons.home),
                  SizedBox(width: 20,),
                  Text("Página Inicial"),
                ]),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.perfilPage),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(children: const [
                  Icon(Icons.person_sharp),
                  SizedBox(width: 20,),
                  Text("Meu perfil"),
                ]),
            ),
          ),
          const Divider(),
          Expanded(child: Container()),
          const Divider(),
          TextButton(onPressed: (){
            AuthService().logout();
          }, child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
            Icon(Icons.exit_to_app),
            SizedBox(width: 5,),
            Text("Sair")
          ],))
        ],
      ),
    ));
  }
}
