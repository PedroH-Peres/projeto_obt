import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/components/app_drawer.dart';
import 'package:projeto_obt/pages/chat_page.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
        actions: [
          IconButton(onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ChatPage()))), icon: Icon(Icons.chat))
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: const Center(child: Text("Feed page"),),
      ),
    );
  }
}