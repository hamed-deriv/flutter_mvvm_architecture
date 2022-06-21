import 'dart:convert';

import 'package:flutter_mvvm_architecture/users/models/address_model.dart';
import 'package:flutter_mvvm_architecture/users/models/company_model.dart';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  AddressModel? address;
  String? phone;
  String? website;
  CompanyModel? company;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: AddressModel.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: CompanyModel.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
      };

  List<UserModel> userFromJson(String data) =>
      List<UserModel>.from(json.decode(data).map(UserModel.fromJson));

  String userToJson(List<UserModel> data) =>
      json.encode(List<dynamic>.from(data.map((item) => item.toJson())));
}
