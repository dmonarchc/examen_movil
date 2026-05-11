import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/provider_form_provider.dart';
import 'package:provider/provider.dart';
import '../../ui/input_decorations.dart';

class FormProvider extends StatelessWidget {
  const FormProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);
    final provider = providerForm.provider;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: providerForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: provider.provider_name,
                onChanged: (value) => provider.provider_name = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre del proveedor',
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                initialValue: provider.provider_last_name,
                onChanged: (value) => provider.provider_last_name = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El apellido es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Apellido del proveedor',
                  labelText: 'Apellido',
                ),
              ),
              TextFormField(
                initialValue: provider.provider_mail,
                onChanged: (value) => provider.provider_mail = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El email es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Email del proveedor',
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                initialValue: provider.provider_state,
                onChanged: (value) => provider.provider_state = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El estado es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Estado del proveedor',
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
