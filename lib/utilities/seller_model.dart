import 'dart:convert';


class SellerModel {
    final String name_;
    final String shopName_;
    final String address_;
    final int mobile_;
    final String licence_;
    final String email_;
    final String password_;
    final String cPassword_;
    final String latitude_;
    final String longitude_;
    String placeId_;
  SellerModel({
    required this.name_,
    required this.shopName_,
    required this.address_,
    required this.mobile_,
    required this.licence_,
    required this.email_,
    required this.password_,
    required this.cPassword_,
    required this.latitude_,
    required this.longitude_,
    required this.placeId_,
  });

  Map<String, dynamic> toMap() {
    return {
      'name_': name_,
      'shopName_': shopName_,
      'address_': address_,
      'mobile_': mobile_,
      'licence_': licence_,
      'email_': email_,
      'password_': password_,
      'cPassword_': cPassword_,
      'latitude_': latitude_,
      'longitude_': longitude_,
      'placeId_': placeId_,
    };
  }

  factory SellerModel.fromMap(Map<String, dynamic> map) {
    return SellerModel(
      name_: map['name_'] ?? '',
      shopName_: map['shopName_'] ?? '',
      address_: map['address_'] ?? '',
      mobile_: map['mobile_'] ?? 1234567890,
      licence_: map['licence_'] ?? '',
      email_: map['email_'] ?? '',
      password_: map['password_'] ?? '',
      cPassword_: map['cPassword_'] ?? '',
      latitude_: map['latitude_'] ?? '',
      longitude_: map['longitude_'] ?? '',
      placeId_: map['placeId_'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SellerModel.fromJson(String source) => SellerModel.fromMap(json.decode(source));

  SellerModel copyWith({
    String? name_,
    String? shopName_,
    String? address_,
    int? mobile_,
    String? licence_,
    String? email_,
    String? password_,
    String? cPassword_,
    String? latitude_,
    String? longitude_,
    String? placeId_,
  }) {
    return SellerModel(
      name_: name_ ?? this.name_,
      shopName_: shopName_ ?? this.shopName_,
      address_: address_ ?? this.address_,
      mobile_: mobile_ ?? this.mobile_,
      licence_: licence_ ?? this.licence_,
      email_: email_ ?? this.email_,
      password_: password_ ?? this.password_,
      cPassword_: cPassword_ ?? this.cPassword_,
      latitude_: latitude_ ?? this.latitude_,
      longitude_: longitude_ ?? this.longitude_,
      placeId_: placeId_ ?? this.placeId_,
    );
  
  }
}
