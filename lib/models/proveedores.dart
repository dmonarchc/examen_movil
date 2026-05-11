import 'dart:convert';

class Providers {
  Providers({required this.listado});

  List<ListadoProvider> listado;

  factory Providers.fromJson(String str) => Providers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Providers.fromMap(Map<String, dynamic> json) => Providers(
    listado: List<ListadoProvider>.from(
      json["Proveedores Listado"].map((x) => ListadoProvider.fromMap(x)),
    ),
  );

  Map<String, dynamic> toMap() => {
    "Proveedores Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class ListadoProvider {
  ListadoProvider({
    required this.providerid,
    required this.provider_name,
    required this.provider_last_name,
    required this.provider_mail,
    required this.provider_state,
  });

  int providerid;
  String provider_name;
  String provider_last_name;
  String provider_mail;
  String provider_state;

  factory ListadoProvider.fromJson(String str) =>
      ListadoProvider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListadoProvider.fromMap(Map<String, dynamic> json) => ListadoProvider(
    providerid: json["providerid"],
    provider_name: json["provider_name"],
    provider_last_name: json["provider_last_name"],
    provider_mail: json["provider_mail"],
    provider_state: json["provider_state"],
  );

  Map<String, dynamic> toMap() => {
    "providerid": providerid,
    "provider_name": provider_name,
    "provider_last_name": provider_last_name,
    "provider_mail": provider_mail,
    "provider_state": provider_state,
  };

  ListadoProvider copy() => ListadoProvider(
    providerid: providerid,
    provider_name: provider_name,
    provider_last_name: provider_last_name,
    provider_mail: provider_mail,
    provider_state: provider_state,
  );
}
