import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktober9/controller/dataController.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    dataController dc = Get.put(dataController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            child: Center(
                child: Obx(() => dc.isloading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: dc.datas.value.length,
                        itemBuilder: (context, index) {
                          final posts = dc.datas.value[index];
                          return ListTile(
                            onTap: (){
                              dc.getPost(index);
                              Get.toNamed('/postview');
                            },
                              leading: CircleAvatar(
                                child: Text(
                                    '${dc.datas.value[index].firstname}'),
                              ),
                              title: Text(
                                  '${dc.datas.value[index].createdAt}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  if (posts.posts != null)
                                    for (var post in posts.posts!)
                                      RichText(
                                        text: TextSpan(
                                          text: post.title,
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                        ),
                                      )
                                ],
                              ));
                        })))));
  }
}
