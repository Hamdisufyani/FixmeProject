
import 'package:fixme/view/screen/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/initialbinding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      title: 'Flutter Demo',
      locale: controller.language,
      theme:controller.appTheme,
      debugShowCheckedModeBanner: false,

      //home: const Test(),
     //  home: const ItemsPage(),
     initialBinding: InitialBinding(),
      // routes: routes,
      getPages: routes,
    );
  }
}
