// details_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:simple_news_app/core/helpers/spacing.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';
import 'package:simple_news_app/features/ui/widgets/cach_images.dart';
import 'package:simple_news_app/features/ui/widgets/source_of_article.dart';

class DetailsScreen extends StatelessWidget {
  final Article article;

  const DetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {
    String date = convertDate(article.publishedAt!);
    return Scaffold(
      appBar: AppBar(title:const Text('Article Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title!,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(8),
            SourceOfArticle(article),
            verticalSpace(16),
            if (article.urlToImage!=null)
            CachImages(image: article.urlToImage!),
            verticalSpace(8),
            Text(date),
            verticalSpace(16),
            if (article.content!=null)
            Text(article.content!),
          ],
        ),
      ),
    );
  }

  String convertDate(String date){
    DateTime publicationDate = DateTime.parse(date);

    // Formatting the date
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(publicationDate);
    return formattedDate;
  }
}
