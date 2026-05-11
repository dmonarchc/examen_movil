import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryServices extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<ListadoCategory> categories = [];
  ListadoCategory? SelectCategory;
  bool isLoading = true;
  bool isEditCreate = true;

  CategoryServices() {
    loadCategory();
  }

  Future loadCategory() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/category_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    print(response.body);
    final categoryMap = Category.fromJson(response.body);
    categories = categoryMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateCategories(ListadoCategory category) async {
    isEditCreate = true;
    notifyListeners();
    if (category.categoryId == 0) {
      await this.createCategory(category);
    } else {
      await this.updateCategory(category);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future updateCategory(ListadoCategory category) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_edit_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResponse = response.body;
    print(decodeResponse);
    //actualizar el listado
    final index = categories.indexWhere(
      (element) => element.categoryId == category.categoryId,
    );
    categories[index] = category;
    return '';
  }

  Future createCategory(ListadoCategory category) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_add_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResponse = response.body;
    print(decodeResponse);
    //agregar al listado
    this.categories.add(category);
    return '';
  }

  Future deleteCategory(ListadoCategory category, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/category_del_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));

    final response = await http.post(
      url,
      body: category.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    await loadCategory();

    Navigator.of(context).pop();

    return "";
  }
}
