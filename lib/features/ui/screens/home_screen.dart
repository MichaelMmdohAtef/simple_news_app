import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news_app/core/helpers/extensions.dart';
import 'package:simple_news_app/core/theming/theme_style.dart';
import 'package:simple_news_app/features/data/models/news_response.dart';
import 'package:simple_news_app/features/logic/cubit/cubit.dart';
import 'package:simple_news_app/features/logic/cubit/states.dart';
import 'package:simple_news_app/features/ui/widgets/container_of_article.dart';
import 'package:simple_news_app/features/ui/widgets/devider_for_articles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){

      },
      builder:(context,state){
        var cubit=NewsCubit.get(context);
        // NewsResponse list = NewsCubit.get(context).businessArticles??null;
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            actions: [
              IconButton(
                icon:const Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  cubit.changeThemeMode();
                },
              ),
            ],
            title:const Text("News App"),
          ),
          body: ConditionalBuilder(
            condition: cubit.businessArticles!=null,
            builder:(context)=>ListView.separated(
              physics:const BouncingScrollPhysics(),
              itemBuilder:(context,index)=>ContainerOfArticle(index),
              separatorBuilder:(context,index)=>const defaultDevider(),
              itemCount: cubit.businessArticles!.articles!.length,),
            fallback:(context)=>const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
