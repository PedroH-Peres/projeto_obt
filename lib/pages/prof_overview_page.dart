import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfOverviewPage extends StatelessWidget {
  const ProfOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
      ),
      body: Container(
        child: Column(
          children: [
            Card(),
            Text("Hello world")
          ],
        ),
      ),
    );
  }
}