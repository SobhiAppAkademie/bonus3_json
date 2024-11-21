
import 'package:flutter/material.dart';
import 'package:json_api/features/home/repository/posts_repository.dart';
import 'package:json_api/features/home/screens/start_screen.dart';

class App extends StatelessWidget {
  final PostsRepository postsRepository;
  const App({super.key, required this.postsRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      initialRoute: "start",
      onGenerateRoute: (RouteSettings route) {
        switch (route.name) {
          default:
            return MaterialPageRoute(builder: (context) =>  StartScreen(postsRepository: postsRepository,));
        }
      },
    );
  }
}
