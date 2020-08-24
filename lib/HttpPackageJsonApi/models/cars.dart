// To parse this JSON data, do
//
//     final cars = carsFromJson(jsonString);

import 'dart:convert';

List<Cars> carsFromJson(String str) => List<Cars>.from(json.decode(str).map((x) => Cars.fromJson(x)));

String carsToJson(List<Cars> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cars {
  Cars({
    this.carName,
    this.country,
    this.foundedYear,
    this.model,
  });

  String carName;
  String country;
  int foundedYear;
  List<Model> model;

  factory Cars.fromJson(Map<String, dynamic> json) => Cars(
    carName: json["car_name"],
    country: json["country"],
    foundedYear: json["founded_year"],
    model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "car_name": carName,
    "country": country,
    "founded_year": foundedYear,
    "model": List<dynamic>.from(model.map((x) => x.toJson())),
  };
}

class Model {
  Model({
    this.modelName,
    this.price,
    this.gasolineDriven,
  });

  String modelName;
  double price;
  bool gasolineDriven;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    modelName: json["model_name"],
    price: json["Price"].toDouble(),
    gasolineDriven: json["gasoline_driven"],
  );

  Map<String, dynamic> toJson() => {
    "model_name": modelName,
    "Price": price,
    "gasoline_driven": gasolineDriven,
  };
}
