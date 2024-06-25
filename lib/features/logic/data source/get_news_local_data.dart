import 'dart:convert';

import 'package:simple_news_app/core/helpers/cach_helper.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';



const cachedImage = 'Cach_news';

class GetImagesLocalDataSource {
  CachHelper cachHelper = CachHelper();

  Future<NewsResponse?> getNewsFromLocalData() async {
    final jsonString = await CachHelper.getData(key: cachedImage);

    if (jsonString != null) {
      return Future.value(NewsResponse.fromJson(json.decode(jsonString)));
    }
    return null;
  }

  Future<void> cacheNews({required NewsResponse imagesToCach}) async {
    return await CachHelper.putData(
      key: cachedImage,
      value: json.encode(
        imagesToCach.toJson(),
      ),
    );
  }
}
