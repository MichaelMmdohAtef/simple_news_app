import 'package:flutter/material.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';

class SourceOfArticle extends StatelessWidget {
  Article article;
  SourceOfArticle(this.article);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Wrap(
        children: [
          Text(
            article.author!,
            textAlign: TextAlign.end,
          ),
          Text(
            ":المصدر  ",
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
