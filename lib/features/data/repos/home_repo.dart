import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:simple_news_app/core/networking/api_error_handler.dart';
import 'package:simple_news_app/core/networking/api_result.dart';
import 'package:simple_news_app/core/networking/api_service.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';
import 'package:simple_news_app/features/logic/data%20source/get_news_local_data.dart';
import 'package:simple_news_app/features/logic/data%20source/get_news_remote_data.dart';

class HomeRepo {
  final GetImagesLocalDataSource _localData;
  final GetImagesRemoteDataSource _remoteData;

  HomeRepo(this._localData, this._remoteData);



  Future<ApiResult<NewsResponse>> getNews({dynamic query}) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      try {
        final response = await _remoteData.getNewsFromRemoteData(query);
        await _localData.cacheNews(imagesToCach: response);
        return ApiResult.success(response);
      } on DioException catch (errro) {
        return ApiResult.failure(ErrorHandler.handle(errro));
      }
    } else {
      try {
        final response = await _localData.getNewsFromLocalData();
        if (response.toString().isNotEmpty) {
          return ApiResult.success(response!);
        } else {
                  return ApiResult.failure(
              ErrorHandler.handle("cache exception is empty"));
        }
      } catch (e) {
        return ApiResult.failure(
            ErrorHandler.handle("cache exception is empty"));
      }
    }
  }
}
