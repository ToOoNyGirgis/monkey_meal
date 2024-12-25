class UserModel {

  final DataEntity? data;
  final String? message;
  final bool? status;

  UserModel({
    this.data,
    this.message,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      data: json['data'] == null ? null : DataEntity.fromJson(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'data': data?.toJson(),
        'message': message,
        'status': status,
      };
}

class DataEntity {

  final String? image;
  final String? phone;
  final String? name;
  final num? id;
  final String? email;
  final String? token;

  DataEntity({
    this.image,
    this.phone,
    this.name,
    this.id,
    this.email,
    this.token,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    return DataEntity(
      image: json['image'],
      phone: json['phone'],
      name: json['name'],
      id: json['id'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'image': image,
        'phone': phone,
        'name': name,
        'id': id,
        'email': email,
        'token': token,
      };
}