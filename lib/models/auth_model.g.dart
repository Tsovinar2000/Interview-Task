// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      region: json['region'] as String?,
      cityVillage: json['cityVillage'] as String?,
      school: json['school'] as String?,
      subject:
          (json['subject'] as List<dynamic>?)?.map((e) => e as String).toList(),
      grade: json['grade'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      verifyCode: json['verifyCode'] as String?,
      type: json['type'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'region': instance.region,
      'cityVillage': instance.cityVillage,
      'school': instance.school,
      'subject': instance.subject,
      'grade': instance.grade,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'verifyCode': instance.verifyCode,
      'type': instance.type,
      'id': instance.id,
    };

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      email: json['email'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      password: json['password'] as String?,
      verifyCode: json['verifyCode'] as String?,
    );

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'verifyCode': instance.verifyCode,
    };
