import 'dart:convert';
import 'dart:io';

import '../app/constant.dart';
import '../business_logic/model/unsplash.dart';

class UnsplashImageProvider {
  static Future<List<UnsplashImage>> loadImages(
      {int page = 1, int perPage = 100}) async {
    String url = 'https://api.unsplash.com/photos?page=$page&per_page=$perPage';
    var data = await _getImageData(url);
    List<UnsplashImage> images =
        List<UnsplashImage>.generate(data.length, (index) {
      return UnsplashImage(data[index]);
    });
    return images;
  }

  static Future<List> loadImagesWithKeyword(String keyword,
      {int page = 1, int perPage = 10}) async {
    String url =
        'https://api.unsplash.com/search/photos?query=$keyword&page=$page&per_page=$perPage&order_by=popular';
    var data = await _getImageData(url);
    List<UnsplashImage> images =
        List<UnsplashImage>.generate(data['results'].length, (index) {
      return UnsplashImage(data['results'][index]);
    });
    int totalPages = data['total_pages'];
    return [totalPages, images];
  }

  static dynamic _getImageData(String url) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers
        .add('Authorization', 'Client-ID ${Constant.UNSPLASH_API_CLIENT_ID}');

    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String json = await response.transform(utf8.decoder).join();
      return jsonDecode(json);
    } else {
      print("Http error: ${response.statusCode}");
      return [];
    }
  }
}
