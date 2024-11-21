
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_api/features/home/repository/posts_repository.dart';

class StartScreen extends StatelessWidget {
  final PostsRepository postsRepository;
  const StartScreen({super.key, required this.postsRepository});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: FutureBuilder(future: postsRepository.getPosts(), builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Error: ${snapshot.error}", style: const TextStyle(color: Colors.red)
            ));
          } else if(snapshot.connectionState != ConnectionState.done && !snapshot.hasData){
            return const Center(child: const CupertinoActivityIndicator());
          } else if(snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.separated(
                separatorBuilder: (context,_) => const Divider(),
                itemCount: posts.length,
                itemBuilder: (context,index){
                    final post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body,style: const TextStyle(fontSize: 14,color: Colors.grey),),
                      trailing: Text("User-ID: ${post.userId} • ID: ${post.id}",style: const TextStyle(fontSize: 12,color: Colors.grey),),
                    );
                }
            );
          }

          return Container();
        })
      )
    );
  }
}
