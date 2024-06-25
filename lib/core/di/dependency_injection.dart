import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_news_app/core/networking/api_constants.dart';
import 'package:simple_news_app/core/networking/api_service.dart';
import 'package:simple_news_app/core/networking/dio_factory.dart';
import 'package:simple_news_app/features/data/repos/home_repo.dart';
import 'package:simple_news_app/features/logic/cubit/cubit.dart';
import 'package:simple_news_app/features/logic/data%20source/get_news_local_data.dart';
import 'package:simple_news_app/features/logic/data%20source/get_news_remote_data.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  GetImagesLocalDataSource getImagesLocalDataSource =
      GetImagesLocalDataSource();
  getIt.registerFactory<ApiService>(
      () => ApiService(dio, baseUrl: ApiConstants.apiBaseUrl));

  // home
  getIt.registerLazySingleton<GetImagesRemoteDataSource>(
      () => GetImagesRemoteDataSource(getIt<ApiService>()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(
      getImagesLocalDataSource, getIt<GetImagesRemoteDataSource>()));
  getIt.registerFactory<NewsCubit>(() => NewsCubit(getIt()));
}
