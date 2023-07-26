import 'package:intl/intl.dart';

import 'user_entity.dart';

class PauseEntity {
  final UserEntity user;
  final DateTime from;
  final DateTime to;
  final String reason;
  final String description;
  final String status;

  PauseEntity({
    required this.user,
    required this.from,
    required this.to,
    required this.reason,
    required this.description,
    required this.status,
  });

  factory PauseEntity.fromJson(Map<String, dynamic> json)
    => PauseEntity(
        user: UserEntity.fromJson(json['user']),
        from: DateFormat('d MMMM yyyy', 'fr_FR').parse(json['from']),
        to: DateFormat('d MMMM yyyy', 'fr_FR').parse(json['to']),
        reason: json['reason'],
        description: json['description'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "from": DateFormat('d MMMM yyyy', 'fr_FR').format(from),
    "to": DateFormat('d MMMM yyyy', 'fr_FR').format(to),
    "reason": reason,
    "description": description,
    "status": status,
  };
}