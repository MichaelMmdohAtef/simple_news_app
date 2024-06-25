import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_news_app/core/di/dependency_injection.dart';
import 'package:simple_news_app/core/helpers/cach_helper.dart';
import 'package:simple_news_app/core/networking/dio_factory.dart';
import 'package:simple_news_app/core/routing/app_router.dart';
import 'package:simple_news_app/core/routing/routes.dart';
import 'package:simple_news_app/core/theming/theme_style.dart';
import 'package:simple_news_app/features/data/repos/home_repo.dart';
import 'package:simple_news_app/features/logic/cubit/cubit.dart';
import 'package:simple_news_app/features/logic/cubit/states.dart';
import 'package:simple_news_app/features/ui/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  DioFactory.getDio();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  CachHelper.box = await Hive.openBox('news_app');

  setupGetIt();
  bool? isDark = bool.tryParse(await CachHelper.getData(key:"isDark")??"false");
  isDark==null?isDark=false:isDark=isDark;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool isDark;
  AppRouter appRouter=AppRouter();
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(428, 926),
      minTextAdapt: true,
      child: BlocProvider(
        create:(context)=>NewsCubit(getIt<HomeRepo>())..getBusinessData()
          ..changeThemeMode(darkModeFromShared: isDark),
        child: BlocConsumer<NewsCubit,NewsStates>(
          listener:(context,state){} ,
          builder: (context, state) {
            var cubit=NewsCubit.get(context);
            return MaterialApp(
              title: 'News App',
              debugShowCheckedModeBanner: false,
              theme: ThemeStyle.lightTheme,
              darkTheme: ThemeStyle.darkTheme,
              initialRoute: Routes.homeScreen,
              onGenerateRoute: appRouter.generateRoute,
              themeMode: cubit.isDark?ThemeMode.dark:ThemeMode.light,
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
