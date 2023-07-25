class DepartmentEntity {
  final String name;

  DepartmentEntity({
    required this.name,
  });

  factory DepartmentEntity.fromJson(Map<String, dynamic> json) => DepartmentEntity(name: json['name']);

  Map<String, String> toJson() => {
    name: name,
  };
}