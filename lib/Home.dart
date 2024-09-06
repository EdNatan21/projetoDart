import 'package:flutter/material.dart';
import 'package:projeto_youtube/telas/Biblioteca.dart';
import 'package:projeto_youtube/telas/EmAlta.dart';
import 'package:projeto_youtube/telas/Inicio.dart';
import 'package:projeto_youtube/telas/Inscricao.dart';

import 'CustomSearch.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _iAtual = 0;
  String _resultado = '';

  @override
  Widget build(BuildContext context) {

    List telas = [
      Inicio(_resultado),
      EmAlta(''),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),
        title: Image.asset(
            'imagens/youtube.png',
          width: 120,
          height: 22,
        ),
        actions: [
          IconButton(onPressed: () async {
            String? res = await showSearch(context: context, delegate: CustomSearch());
            setState(() {
              _resultado = res!;
            });
          }, icon: const Icon(Icons.search)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.black,
        child: telas[_iAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          // Utilizar o shifting ao usar mais de 3 botão de navegadores
          currentIndex: _iAtual,
          // onTap configura o (i) como clica fazendo a função de mudar.
          onTap: (i){
            setState(() {
              _iAtual = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.redAccent,
          items: const [
            BottomNavigationBarItem(
                label: ('Início'),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                label: ('Em Alta'),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                label: ('Inscrições'),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
                label: ('Biblioteca'),
                icon: Icon(Icons.folder_copy)
            )
      ]),
    );
  }
}
