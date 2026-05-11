import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';

class ProviderFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  ListadoProvider provider;
  ProviderFormProvider(this.provider);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
