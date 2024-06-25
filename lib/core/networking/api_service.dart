import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:simple_news_app/core/networking/api_constants.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET(ApiConstants.getNews)
  Future<NewsResponse> getNews(
      @Queries() Map<String,dynamic> query);
}
