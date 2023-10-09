import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktober9/controller/dataController.dart';

class postView extends StatelessWidget {
  const postView({super.key});

  @override
  Widget build(BuildContext context) {
    dataController dc = Get.find();
    final id = dc.id.value;
    final posts = dc.datas.value[id];
    return Scaffold(
      appBar: AppBar(
        title: Text('Post View'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (posts.posts != null)
              for (var post in posts.posts!)
                Text('${post.createdAt} : ${post.content}\n'),
          ],
        ),
      )
    );
  }
}
