import 'package:json_api/features/home/repository/posts_repository.dart';
import 'package:json_api/features/home/schema/posts.dart';

class MockPostsRepository implements PostsRepository {
  @override
  Future<List<Posts>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Posts(userId: 1, id: 1, title: "Test", body: "Test Body"),
      Posts(userId: 2, id: 2, title: "Test asklaskl aslkdasdkadklad asdkaskdldkdkadkasdkladks", body: "Test Body asdlaslkasklkkadklakdakd adakdalsdkas dalsd"),
      Posts(userId: 3, id: 3, title: "Test", body: "Test Body"),
    ];
  }
  
}