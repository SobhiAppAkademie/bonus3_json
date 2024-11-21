import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_api/features/home/repository/posts_repository.dart';
import 'package:json_api/features/home/schema/posts.dart';
import 'package:http/http.dart' as http;

// Package nötig: http
class ApiPostsRepository implements PostsRepository {


  @override
  Future<List<Posts>> getPosts() async {

    try {

      /// URL vorbereiten
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");


      /// Anfrage senden und Antwort erhalten (deshalb async)
      final response = await http.get(url);

      /// Platzhalter für unsere Posts
      List<Posts> posts = [];

      /// Wenn unsere Anfrage erfolgreich war(200 = OK)
      if (response.statusCode == 200) {
        String body = response.body;

        /// JSON-String zur Map-List
        final dataList = jsonDecode(body);

        /// Ziehen uns jede einzelne Map in der Liste, konvertieren und
        /// fügen es zur Posts-Liste hinzu
        for (Map<String, dynamic> map in dataList) {
          final int userId = map["userId"];
          final int id = map["id"];
          final String title = map["title"];
          final String body = map["body"];

          /// Klasse zur Liste hinzufügen
          posts.add(Posts(userId: userId, id: id, title: title, body: body));
        }

        /// returnen unsere Posts-Liste
        return posts;
      } else {

        /// Wenn unsere Anfrage nicht erfolgreich war
        throw Exception(response.body);
      }

      /// Wenn Server nicht erreichbar ist
    } on ClientException catch (e,s){
      throw Exception("API ist nicht erreichbar");
    } on Exception catch(e,s){
      throw Exception("API hat einen Fehler: ${e.toString()}");
    }
  }

}