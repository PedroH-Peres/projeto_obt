import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/core/auth/auth_firebase_service.dart';
import 'package:projeto_obt/core/auth/auth_service.dart';

class EditPerfil extends StatelessWidget {


  const EditPerfil({super.key});


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          const Text(
            "Editar Perfil",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: const ValueKey('name'),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      label: Text("Nome")
                    ),
                    initialValue: AuthService().currentUser!.name,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    key: const ValueKey('bio'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    maxLength: 230,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Bio"),
                    ),
                    initialValue: AuthService().currentUser!.bio,
                  ),
                  
                ],
              ),
            ),
          )
          
        ],
      ),
    );
  }
}
