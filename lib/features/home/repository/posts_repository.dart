import 'package:json_api/features/home/schema/posts.dart';

abstract class PostsRepository {
  Future<List<Posts>> getPosts();
}
