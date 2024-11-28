import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/app_provider.dart';
import 'package:food_delivery_app/view/category_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
   ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MyApp(),
    ),

    /*MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child:  MyApp(),
    ),*/
   /* MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()..loadCategories()),
      ],
      child: MyApp(),
    ),*/

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryView(),
    );
  }
}



