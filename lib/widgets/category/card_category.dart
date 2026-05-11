import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/category/detail_category.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

import '../../models/categorias.dart' show Listado, ListadoCategory;

class CardCategory extends StatelessWidget {
  final ListadoCategory category;
  const CardCategory({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        decoration: _cardDecoration(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [DetailCategory(categoryName: category.categoryName)],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),
  boxShadow: [
    BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
  ],
);
