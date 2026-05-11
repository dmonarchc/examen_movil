import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loadinng_screen.dart';
import 'package:flutter_application_1/services/category_services.dart';
import 'package:flutter_application_1/widgets/category/card_category.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/categorias.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryServices>(context);
    if (categoryService.isLoading) return LoadinngScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de categorias'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categoryService.categories.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.SelectCategory = categoryService.categories[index]
                .copy();
            Navigator.pushNamed(context, 'edit_category');
          },
          child: CardCategory(category: categoryService.categories[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          categoryService.SelectCategory = ListadoCategory(
            categoryId: 0,
            categoryName: '',
            categoryState: '',
          );
          Navigator.pushNamed(context, 'edit_category');
        },
      ),
    );
  }
}
