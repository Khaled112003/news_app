



import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/newsmodel.dart';





class newsservice {
  Dio dio = Dio();

  Future<List<newsmodel>> getnews() async {
    try {
      Response response = await dio.get
      ('https://gnews.io/api/v4/search?q=example&apikey=74ac66773eebd1742bf3b76f580a2cf7&category=sports&country=en');
      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data['articles'];
      List<newsmodel> listNews = [];

      for (var element in articles) {
        newsmodel news = newsmodel.fromjson(element);
        listNews.add(news);
      }

      return listNews;
    } catch (e) {
      print('Error fetching news: $e');
      throw e; // Rethrow the exception to handle it elsewhere if necessary
    }
  }
}
