import 'dart:convert';

import 'package:news_app/model/Article_model.dart';
import 'package:http/http.dart'as http;

class News {
  List<ArticleModel> news=[];

      Future<void> getNews() async{
        String url="http://newsapi.org/v2/top-headlines?country=in&apiKey=5fbfea3fdc154a4788f3541f367f776d";
        var response=await http.get(url);
        var jsonData=jsonDecode(response.body);
        if(jsonData['status']=="ok"){
          jsonData['articles'].forEach((element){

            if(element["urlToImage"]!=null && element["description"]!=null){
                ArticleModel articleModel =ArticleModel(
                  title: element["title"],
                  author: element["author"],
                  description: element["description"],
                  url: element["url"],
                  urlToImage: element["urlToImage"],
                  content: element["context"]

                );
                news.add(articleModel);

            }

          });
        }

      }

}

class CategoryViewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {

    String url = "http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=5fbfea3fdc154a4788f3541f367f776d";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {

        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]

          );
          news.add(articleModel);
        }
      });
    }
  }
}