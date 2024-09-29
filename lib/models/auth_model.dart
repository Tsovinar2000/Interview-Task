import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class SignUpModel {
  final String? name;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? region;
  final String? cityVillage;
  final String? school;
  final List<String>? subject;
  final String? grade;
  final String? password;
  final String? confirmPassword;
  final String? verifyCode;
  final String? type;
  final String? id;

  SignUpModel({
    this.name,
    this.lastName,
    this.email,
    this.phone,
    this.region,
    this.cityVillage,
    this.school,
    this.subject,
    this.grade,
    this.password,
    this.confirmPassword,
    this.verifyCode,
    this.type,
    this.id,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpModel &&
        other.name == name &&
        other.lastName == lastName &&
        other.email == email &&
        other.phone == phone &&
        other.region == region &&
        other.cityVillage == cityVillage &&
        other.school == school &&
        listEquals(other.subject, subject) &&
        other.grade == grade &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.verifyCode == verifyCode &&
        other.type == type &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        region.hashCode ^
        cityVillage.hashCode ^
        school.hashCode ^
        subject.hashCode ^
        grade.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode ^
        verifyCode.hashCode ^
        type.hashCode ^
        id.hashCode;
  }

  SignUpModel copyWith({
    String? name,
    String? lastName,
    String? email,
    String? phone,
    String? region,
    String? cityVillage,
    String? school,
    List<String>? subject,
    String? grade,
    String? password,
    String? confirmPassword,
    String? verifyCode,
    String? type,
    String? id,
  }) {
    return SignUpModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      region: region ?? this.region,
      cityVillage: cityVillage ?? this.cityVillage,
      school: school ?? this.school,
      subject: subject ?? this.subject,
      grade: grade ?? this.grade,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      verifyCode: verifyCode ?? this.verifyCode,
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'SignUpModel(name: $name, lastName: $lastName, email: $email, phone: $phone, region: $region, cityVillage: $cityVillage, school: $school, subject: $subject, grade: $grade, password: $password, confirmPassword: $confirmPassword, verifyCode: $verifyCode, type: $type, id: $id)';
  }
}

@JsonSerializable()
class SignInModel {
  String? email;
  String? password;
  String? confirmPassword;
  String? verifyCode;

  SignInModel({
    this.email,
    this.confirmPassword,
    this.password,
    this.verifyCode,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
}
