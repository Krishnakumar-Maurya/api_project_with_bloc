import 'dart:convert';

import 'package:assignment/data/models/post_model.dart';
import 'package:assignment/data/repositories/api.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Api api = Api();

  var baseUrl = "https://jsonplaceholder.typicode.com/";

  List<PostsModel> posts = [];

  
  Future<List<PostsModel>> fetchPosts() async {
    try {
      var response = await http.get(Uri.parse(baseUrl + "posts/"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (Map<String, dynamic> i in data) {
          posts.add(PostsModel.fromJson(i));
        }
        
      }
      return posts;
    } catch (ex) {
      throw ex;
    }
  }
}
