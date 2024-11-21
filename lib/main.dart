
import 'package:flutter/material.dart';
import 'package:json_api/app.dart';
import 'package:json_api/features/home/repository/api_posts_repository.dart';
import 'package:json_api/features/home/repository/mock_posts_repository.dart';
import 'package:json_api/features/home/repository/posts_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Wir definieren das Repository ganz oben in der Struktur unserer App,
  /// damit wir leichter zwischen ApiPostsRepository und MockPostsRepository wechseln können
  ///
  final PostsRepository postsRepository = ApiPostsRepository(); //MockPostsRepository();

  runApp(App(postsRepository: postsRepository));
}
