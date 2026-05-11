import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/caterogy_form_provider.dart';
import 'package:provider/provider.dart';
import '../../ui/input_decorations.dart';

class FormCategory extends StatelessWidget {
  const FormCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CaterogyFormProvider>(context);
    final category = categoryForm.category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: categoryForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: category.categoryName,
                onChanged: (value) => category.categoryName = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre de la categoria',
                  labelText: 'Categoria',
                ),
              ),
              TextFormField(
                initialValue: category.categoryState,
                onChanged: (value) => category.categoryState = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El estado es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Agregue un estado',
                  labelText: 'Estado',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration _createDecoration() => const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
  boxShadow: [
    BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
  ],
);
