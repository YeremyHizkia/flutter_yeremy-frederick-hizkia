import 'dart:ui';
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String name;
  final String phoneNumber;
  final DateTime date;
  final Color color;
  final String fileName;

  ContactModel(
    this.name,
    this.phoneNumber,
    this.date,
    this.color,
    this.fileName,
  );

  @override
  List<Object?> get props => [name, phoneNumber, date, color, fileName];
}
