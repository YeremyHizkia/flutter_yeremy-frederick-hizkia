import 'package:competence_2/Screen/Widget/daftar.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pendaftaran'),
        ),
        body: const FormFieldScreen());
  }
}
