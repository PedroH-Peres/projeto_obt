import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_obt/utils/profissoes.dart';

class AreaNav extends StatefulWidget {
  const AreaNav({super.key});

  @override
  State<AreaNav> createState() => _AreaNavState();
}

class _AreaNavState extends State<AreaNav> {
  @override
  Widget build(BuildContext context) {
    List<String?> loadAreas() {
      List<String?> _areas = [];
      for (int i = 0; i < Profissoes().profissoes.length; i++) {
        if (!_areas.contains(Profissoes().profissoes[i]['area'])) {
          _areas.add(Profissoes().profissoes[i]['area']);
        }
      }
      return _areas;
    }

    List<String?> areas = loadAreas();

    return Scaffold(
      appBar: AppBar(title: Text("Navegar por área")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: GridView.builder(
              itemCount: areas.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: ((context, index) => GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.blueAccent, border: Border.all(color: Colors.black, width: 3)),
                      child: Text(areas[index]!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),
                  )),
            ),
          ),
      ),
    );
  }
}
