import 'package:competence_1/Screen/Form.dart';
import 'package:competence_1/Screen/Welcome.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hz-Diecast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Welcome(),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 5,
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Pendaftaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            FormFieldScreen(),
            SizedBox(height: 15),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Need to get in touch with us? Either fill out the form with your inquiry or find the department email you\'d like to contact below.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
