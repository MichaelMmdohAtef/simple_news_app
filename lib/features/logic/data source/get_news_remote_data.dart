import 'package:dio/dio.dart';
import 'package:simple_news_app/core/networking/api_service.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';

class GetImagesRemoteDataSource {
  final ApiService _apiService;

  GetImagesRemoteDataSource(this._apiService);

  Future<NewsResponse> getNewsFromRemoteData(Map<String,dynamic> query) async {
    final response = await _apiService.getNews(query);
    return response;
  }
}
