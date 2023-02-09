import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/models/auth.dart';
import 'package:projeto_obt/pages/feed_page.dart';

class AuthForm extends StatefulWidget {
  AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  final _formData = Auth();

  var dropDownValue = 'Aluno';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey("nome"),
                initialValue: _formData.name,
                onChanged: ((nome) => _formData.name = nome),
                decoration: const InputDecoration(labelText: "Nome"),
              ),
              TextFormField(
                key: const ValueKey("email"),
                initialValue: _formData.email,
                onChanged: ((email) => _formData.email = email),
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                key: const ValueKey("senha"),
                initialValue: _formData.password,
                onChanged: ((senha) => _formData.password = senha),
                decoration: const InputDecoration(labelText: "Senha"),
              ),
              Row(
                children: [
                  const Text("Tipo de conta: "),
                  const SizedBox(width: 8,),
                  DropdownButton<String>(
                    value: dropDownValue,
                    onChanged: (tipo) {
                      setState(() {
                        dropDownValue = tipo ?? 'Aluno';
                        _formData.tipoConta = tipo ?? 'Aluno';
                      });
                    },
                    items: const [
                      DropdownMenuItem(value: 'Aluno', child: Text("Aluno")),
                      DropdownMenuItem(value: 'Escola', child: Text("Escola")),
                      DropdownMenuItem(value: 'Profissional', child: Text("Profissional")),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => FeedPage())));
              }, child: const Text("Confirmar"))
            ],
          ),
        ),
      ),
    );
  }
}
