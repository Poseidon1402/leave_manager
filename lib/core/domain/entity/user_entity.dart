import 'department_entity.dart';

class UserEntity {
  final String email;
  final String fullName;
  final String phone;
  final String role;
  final int? quota;
  final DepartmentEntity department;

  UserEntity({
    required this.email,
    required this.fullName,
    required this.phone,
    required this.role,
    this.quota,
    required this.department,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json)
    => UserEntity(
        fullName: json['name'],
        email: json['email'],
        quota: json['quota'],
        phone: json['tel'],
        role: json['role'],
        department: DepartmentEntity.fromJson(json['department']),
      );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "phone": phone,
    "role": role,
    "department": department.toJson(),
  };
}