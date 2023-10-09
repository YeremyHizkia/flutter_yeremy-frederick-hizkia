import 'package:tugasbl/Model/Contact_Model.dart';

abstract class ContactEvent {}

class TambahKontak extends ContactEvent {
  final ContactModel contact;
  TambahKontak(this.contact);
}

class EditKontak extends ContactEvent {
  final int index;
  final ContactModel updatedContact;
  EditKontak(this.index, this.updatedContact);
}

class HapusKontak extends ContactEvent {
  final int index;
  HapusKontak(this.index);
}
