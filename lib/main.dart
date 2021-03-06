import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/bloc/calendar_bloc.dart';
import 'package:ibilling/pages/add_constract.dart';
import 'package:ibilling/pages/home_page.dart';
import 'package:ibilling/pages/upload_page.dart';
   void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU'), Locale('uz', 'UZ')],
        path: 'assets/translations', // <-- change patch to your
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  CalendarBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        ),
        home: HomePage(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: {
          AddConstractPage.id: (context) => AddConstractPage(),
          UploadPage.id: (context) => UploadPage(),
        },

      ),
    );
  }
}




