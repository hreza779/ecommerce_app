import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  var widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,

    );
  }
}


