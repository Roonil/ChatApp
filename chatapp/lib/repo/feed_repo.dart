import 'dart:convert';
import 'package:chatapp/models/post.dart';
import 'package:flutter/services.dart' show rootBundle;

class FeedRepo {
  static Future<List<Post?>> getFutureListOfPostFromJson() async {
    final String storyJsonString =
        await rootBundle.loadString('assets/json/posts.json');
    final List<dynamic> storiesMap =
        jsonDecode(storyJsonString)['posts'] as List;
    final List<Post?> listOfPost =
        storiesMap.map((post) => Post.fromMap(post)).toList();
    return listOfPost;
  }
}
