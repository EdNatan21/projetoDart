import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        close(context, '');
      }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = [];
    if(query.isNotEmpty) {
      lista = ['Abacaxi', 'Adamantium', 'cachorro', 'dado', 'elefante',
        'foca', 'gato', 'Hipopotamo', 'iguana', 'jacare',].where(
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();
      return ListView.builder(itemBuilder: (context, index){
        return ListTile(
          onTap: (){
            close(context, lista[index]);
          },
          title: Text(lista[index]),
        );
      }, itemCount: lista.length);
    } else {
      return Center(
        child: Text('Nenhum resultado para a pesquisa'),
      );
    }


  }

}