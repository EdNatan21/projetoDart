import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const API_KEY = 'AIzaSyAQFFoyyIZr42G-aDtEw0r1G12kzYx0Jas';
const ID_CANAL = 'UCIak6JLVOjqhStxrL1Lcytw';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {
    final uri = Uri.parse(
      '${URL_BASE}search?part=snippet&type=video&maxResults=20&order=viewCount&key=$API_KEY&q=$pesquisa',
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> dadosJson = json.decode(response.body);

        List<Video> videos = (dadosJson['items'] as List).map<Video>((map) {
          return Video.fromJson(map);
        }).toList();

        return videos;
      } else {
        throw Exception('Erro ao buscar vídeos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }
}