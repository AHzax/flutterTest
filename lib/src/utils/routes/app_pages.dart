import 'package:docapp/src/ui/views/pdfView.dart';
import 'package:get/get.dart';

// bindings
import 'package:docapp/src/bindings/settings_bindings.dart';

// routes
import '../../bindings/NewDocumentBinding.dart';
import '../../bindings/home_bindings.dart';
import '../../bindings/login_bindings.dart';
import '../../bindings/signaturepagebinding.dart';
import '../../middlewares/auth.dart';
import '../../ui/views/docListPage.dart';
import '../../ui/views/homepage.dart';
import '../../ui/views/loginPage.dart';
import '../../ui/views/newdocument.dart';
import '../../ui/views/signUpPage.dart';
import '../../ui/views/signaturepage.dart';
import './app_routes.dart';

// views
import 'package:docapp/src/ui/views/error.dart';
import 'package:docapp/src/ui/views/settings.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const String INITIAL = Routes.homeRoute;
  static final List<GetPage<dynamic>> routes = [
    // login and registrations
    // GetPage(
    //   name: Routes.splashRoute,
    //   page: () => const SampleItemListView(),
    // ),
    GetPage(
      name: Routes.homeRoute,
      binding: HomeBinding(),
      page: () => HomePage(),
      middlewares: [
          AuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.signUpRoute,
      page: () => SignUpPage(),
      binding: LoginBindings(),
    ),

     GetPage(
      name: Routes.docListPage,
      page: () => DocListPage(),
      binding: NewDocumentBinding(),
    ),

     GetPage(
      name: Routes.docListPage,
      page: () => DocListPage(),
      binding: NewDocumentBinding(),
    ),

       GetPage(
      name: Routes.signatureRoute,
      page: () => SignaturePage(),
      binding: SignaturePageBinding(),
    ),

      GetPage(
      name: Routes.newDocument,
      page: () => NewDocument(),
      binding: NewDocumentBinding(),
    ),

    GetPage(
      name: Routes.loginRoute,
      binding: LoginBindings(),
      page: () => LoginPage(),
      // middlewares: [

      // ],
    ),
    GetPage(
      name: Routes.settingsRoute,
      page: () => SettingsView(),
      binding: SettingsBindings(),
      // children: [
      // GetPage(
      //   name: 'page1/',
      //   page: () => const SampleItemListView(),
      // ),
      // GetPage(
      //   name: 'page2/',
      //   page: () => const SampleItemListView(),
      // ),
      // ]
    ),
    GetPage(
      name: Routes.errorRoute,
      page: () => ErrorView(),
    ),
  ];
}
