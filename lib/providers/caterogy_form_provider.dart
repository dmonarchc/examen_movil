import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';

class CaterogyFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  ListadoCategory category;
  CaterogyFormProvider(this.category);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
