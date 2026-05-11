import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderServices extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<ListadoProvider> providers = [];
  ListadoProvider? SelectProvider;
  bool isLoading = true;
  bool isEditCreate = true;

  ProviderServices() {
    loadProviders();
  }

  Future loadProviders() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'ejemplos/provider_list_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    print(response.body);
    final providerMap = Providers.fromJson(response.body);
    providers = providerMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProviers(ListadoProvider provider) async {
    isEditCreate = true;
    notifyListeners();
    if (provider.providerid == 0) {
      await this.createProvider(provider);
    } else {
      await this.updateProvider(provider);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future updateProvider(ListadoProvider provider) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_edit_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));

    final response = await http.post(
      url,
      body: json.encode({
        "provider_id": provider.providerid,
        "provider_name": provider.provider_name,
        "provider_last_name": provider.provider_last_name,
        "provider_mail": provider.provider_mail,
        "provider_state": provider.provider_state,
      }),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    final decodeResponse = response.body;
    print(decodeResponse);

    final index = providers.indexWhere(
      (element) => element.providerid == provider.providerid,
    );

    providers[index] = provider;

    notifyListeners();

    return '';
  }

  Future createProvider(ListadoProvider provider) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_add_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(
      url,
      body: provider.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final decodeResponse = response.body;
    print(decodeResponse);
    //agregar al listado
    this.providers.add(provider);
    return '';
  }

  Future deleteProvider(ListadoProvider provider, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/provider_del_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));

    final response = await http.post(
      url,
      body: json.encode({"provider_id": provider.providerid}),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    await loadProviders();

    Navigator.of(context).pop();

    return "";
  }
}
