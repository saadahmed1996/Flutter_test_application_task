import 'package:flutter/material.dart';
import 'package:flutter_test_application/routes/router_helper.dart';
import 'helper/dependencies.dart' as dependencies;
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Here we are injecting dependencies with this init function.
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouterHelper.getSplashPage(),
      getPages: RouterHelper.routes,
    );
  }
}
