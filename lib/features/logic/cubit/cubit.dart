import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app/core/di/dependency_injection.dart';
import 'package:simple_news_app/core/helpers/cach_helper.dart';
import 'package:simple_news_app/core/networking/api_service.dart';
import 'package:simple_news_app/core/networking/dio_factory.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';
import 'package:simple_news_app/features/data/repos/home_repo.dart';
import 'package:simple_news_app/features/logic/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  final HomeRepo _homeRepo;
  NewsCubit(this._homeRepo) : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);


  NewsResponse? businessArticles;

   getBusinessData() async{
     emit(GetNewsBusinessLoadingStates());
     dynamic query={
       "country": "eg",
       "category": "business",
       "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
     };
      final result =await _homeRepo.getNews(query: query);
      result.when(success: (data) {
        businessArticles=data;
        emit(GetNewsBusinessSuccessStates());
      }, failure: (errorHandler) {
        emit(GetNewsBusinessErrorStates(errorHandler.apiErrorModel.message!));
      },);


  }


  bool isDark=false;

   changeThemeMode({bool? darkModeFromShared}) async{
    if(darkModeFromShared!=null){
      isDark=darkModeFromShared;
      emit(OnChangeThemeMode());
    }else{
      isDark=!isDark;
    await  CachHelper.putData(key: "isDark", value: isDark.toString())
        .then((value){
      emit(OnChangeThemeMode());
    });
    }

  }
}
