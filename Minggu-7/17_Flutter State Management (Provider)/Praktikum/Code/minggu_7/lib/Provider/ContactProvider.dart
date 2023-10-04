import 'package:flutter/material.dart';
import 'package:minggu_7/Model/Contact_Model.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => [..._contacts];

  void addContact(ContactModel contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(int index, ContactModel updatedContact) {
    if (index >= 0 && index < _contacts.length) {
      _contacts[index] = updatedContact;
      notifyListeners();
    }
  }

  void deleteContact(int index) {
    if (index >= 0 && index < _contacts.length) {
      _contacts.removeAt(index);
      notifyListeners();
    }
  }
}
