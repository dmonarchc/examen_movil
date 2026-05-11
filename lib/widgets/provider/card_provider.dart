import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/provider/detail_provider.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

import '../../models/proveedores.dart' show Listado, ListadoProvider;

class CardProvider extends StatelessWidget {
  final ListadoProvider provider;
  const CardProvider({super.key, required this.provider});
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
          children: [DetailProvider(providerName: provider.provider_name)],
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
