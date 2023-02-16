import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/core/auth/auth_service.dart';
import 'package:projeto_obt/models/auth.dart';
import 'package:projeto_obt/pages/feed_page.dart';

class AuthForm extends StatefulWidget {
  final void Function(Auth) onSubmit;
  AuthForm({super.key, required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  final _formData = Auth();

  var dropDownValue = 'Aluno';

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (!_formData.isLogin)
                TextFormField(
                  key: const ValueKey("nome"),
                  initialValue: _formData.name,
                  onChanged: ((nome) => _formData.name = nome),
                  validator: ((value) {
                    if (value!.length <= 3) {
                      return "O nome deve conter pelo menos 4 caracteres.";
                    }
                    return null;
                  }),
                  decoration: const InputDecoration(labelText: "Nome", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 5,),
              TextFormField(
                key: const ValueKey("email"),
                initialValue: _formData.email,
                onChanged: ((email) => _formData.email = email),
                decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                validator: ((value) {
                  if(!value!.contains('@') && value.length <= 10){
                    return "E-mail inválido.";
                  }
                  return null;
                }),
              ),
              const SizedBox(height: 5,),
              TextFormField(
                key: const ValueKey("senha"),
                initialValue: _formData.password,
                obscureText: true,
                onChanged: ((senha) => _formData.password = senha),
                validator: ((value) {
                  if(value!.length <= 7){
                    return "A senha deve conter ao menos 8 caracteres.";
                  }
                  return null;
                }),
                decoration: const InputDecoration(labelText: "Senha", border: OutlineInputBorder()),
              ),
              if (!_formData.isLogin)
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    const Text("Tipo de conta: "),
                    const SizedBox(
                      width: 12,
                    ),
                    DropdownButton<String>(
                      value: dropDownValue,
                      elevation: 12,
                      underline: Container(height: 2, color: Colors.black,),
                      onChanged: (tipo) {
                        setState(() {
                          dropDownValue = tipo ?? 'Aluno';
                          _formData.tipoConta = tipo ?? 'Aluno';
                        });
                      },
                      items: const [
                        DropdownMenuItem(value: 'Aluno', child: Text("Aluno")),
                        DropdownMenuItem(
                            value: 'Escola', child: Text("Escola")),
                        DropdownMenuItem(
                            value: 'Profissional', child: Text("Profissional")),
                      ],
                    ),
                  ],
                ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _formData.toggleAuthMode();
                      });
                    },
                    child: Text(_formData.isLogin
                        ? "Não possui conta?"
                        : "Já tem conta?"),
                  ),
                  ElevatedButton(
                      onPressed: _submit, child: const Text("Confirmar")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
