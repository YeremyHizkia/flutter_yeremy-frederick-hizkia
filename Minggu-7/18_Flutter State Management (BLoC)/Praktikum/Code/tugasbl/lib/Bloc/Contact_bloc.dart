import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugasbl/Event-State/ContactEvent.dart';
import 'package:tugasbl/Event-State/ContactState.dart';
import 'package:tugasbl/Model/Contact_Model.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final List<ContactModel> _contacts = [];

  ContactBloc() : super(KeadaanAwal()) {
    on<TambahKontak>((event, emit) {
      _contacts.add(event.contact);
      emit(KeadaanEdit(List.from(_contacts)));
    });

    on<EditKontak>((event, emit) {
      if (event.index >= 0 && event.index < _contacts.length) {
        _contacts[event.index] = event.updatedContact;
        emit(KeadaanEdit(List.from(_contacts)));
      }
    });

    on<HapusKontak>((event, emit) {
      if (event.index >= 0 && event.index < _contacts.length) {
        _contacts.removeAt(event.index);
        emit(KeadaanEdit(List.from(_contacts)));
      }
    });
  }

  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is TambahKontak) {
      _contacts.add(event.contact);
      yield KeadaanEdit(List.from(_contacts));
    } else if (event is EditKontak) {
      if (event.index >= 0 && event.index < _contacts.length) {
        _contacts[event.index] = event.updatedContact;
        yield KeadaanEdit(List.from(_contacts));
      }
    } else if (event is HapusKontak) {
      if (event.index >= 0 && event.index < _contacts.length) {
        _contacts.removeAt(event.index);
        yield KeadaanEdit(List.from(_contacts));
      }
    }
  }
}
