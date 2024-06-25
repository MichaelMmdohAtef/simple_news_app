import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_news_app/core/helpers/extensions.dart';
import 'package:simple_news_app/features/logic/cubit/cubit.dart';
import 'package:simple_news_app/features/ui/screens/details_screen.dart';
import 'package:simple_news_app/features/ui/widgets/cach_images.dart';

class ContainerOfArticle extends StatelessWidget {
  int index;
  ContainerOfArticle(this.index);

  @override
  Widget build(BuildContext context) {
    var cubit=NewsCubit.get(context);
    return InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) {
          return DetailsScreen(cubit.businessArticles!.articles![index]);
        },));
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          leading: cubit.businessArticles!.articles![index].urlToImage != null
              ? CachImages(image: cubit.businessArticles!.articles![index].urlToImage!)
              : null,
          title: Text(cubit.businessArticles!.articles![index].title!,style:Theme.of(context).textTheme.bodyText1,),
          subtitle: Text("المصدر:  "+cubit.businessArticles!.articles![index].author!,style:Theme.of(context).textTheme.bodyText2,),
        ),
      ),
    );
  }
}
