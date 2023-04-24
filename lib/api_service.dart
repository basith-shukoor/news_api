import 'dart:convert';
import 'article_model.dart';
import 'package:http/http.dart'as http;


class ApiService
{
  Future<List<Article>>getArticle()async {
    final url='https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a9d5b58ce3e9447fbdfd0f59255a40c8';
    var response =await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      var body = json.decode(response.body);
      // print(body);
      List<Article>_data = List<Article>.from(
          body['articles'].map((e) => Article.fromJson(e)).toList());
      print(_data);
      return _data;
    }
    else{
      List<Article> _data=[];
      return _data;
    }
  }
}