import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loadinng_screen.dart';
import 'package:flutter_application_1/services/provider_services.dart';
import 'package:flutter_application_1/widgets/provider/card_provider.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/proveedores.dart';

class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderServices>(context);
    if (providerService.isLoading) return LoadinngScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de proveedores'),
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
        itemCount: providerService.providers.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            providerService.SelectProvider = providerService.providers[index]
                .copy();
            Navigator.pushNamed(context, 'edit_provider');
          },
          child: CardProvider(provider: providerService.providers[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          providerService.SelectProvider = ListadoProvider(
            providerid: 0,
            provider_name: '',
            provider_last_name: '',
            provider_mail: '',
            provider_state: '',
          );
          Navigator.pushNamed(context, 'edit_provider');
        },
      ),
    );
  }
}
