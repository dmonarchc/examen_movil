import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/provider_services.dart';
import 'package:flutter_application_1/widgets/provider/form_provider.dart';
import 'package:provider/provider.dart';

class EditProviderScreen extends StatelessWidget {
  const EditProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderServices>(context);

    return ChangeNotifierProvider(
      create: (_) => ProviderFormProvider(providerService.SelectProvider!),
      child: _ProviderScreenBody(providerService: providerService),
    );
  }
}

class _ProviderScreenBody extends StatelessWidget {
  final ProviderServices providerService;

  const _ProviderScreenBody({required this.providerService});

  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedor'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16), child: FormProvider()),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'deleteProvider',
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!providerForm.isValidForm()) return;

              await providerService.deleteProvider(
                providerForm.provider,
                context,
              );
            },
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: 'saveProvider',
            child: const Icon(Icons.save),
            onPressed: () async {
              if (!providerForm.isValidForm()) return;

              await providerService.editOrCreateProviers(providerForm.provider);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
