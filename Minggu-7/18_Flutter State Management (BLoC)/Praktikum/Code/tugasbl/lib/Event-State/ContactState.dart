import 'package:tugasbl/Model/Contact_Model.dart';

abstract class ContactState {}

class KeadaanAwal extends ContactState {}

class KeadaanEdit extends ContactState {
  final List<ContactModel> contacts;
  KeadaanEdit(this.contacts);
}

class KeadaanError extends ContactState {
  final String errorMessage;
  KeadaanError(this.errorMessage);
}
