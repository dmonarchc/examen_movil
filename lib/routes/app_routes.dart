import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/categories/edit_category_screen.dart';
import 'package:flutter_application_1/screens/categories/list_category_screen.dart';
import 'package:flutter_application_1/screens/providers/edit_provider_screen.dart';
import 'package:flutter_application_1/screens/providers/list_provider_screen.dart';
import '../screens/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
    'home': (BuildContext context) => const HomeScreen(),
    'list_product': (BuildContext context) => const ListProductScreen(),
    'edit_product': (BuildContext context) => const EditProductScreen(),
    'list_provider': (BuildContext context) => const ListProviderScreen(),
    'edit_provider': (BuildContext context) => const EditProviderScreen(),
    'list_category': (BuildContext context) => const ListCategoryScreen(),
    'edit_category': (BuildContext context) => const EditCategoryScreen(),
    'error': (BuildContext context) => const ErrorScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
