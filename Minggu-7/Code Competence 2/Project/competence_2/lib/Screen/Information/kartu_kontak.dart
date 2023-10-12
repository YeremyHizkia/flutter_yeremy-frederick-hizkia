import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            color: Colors.white,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.contact_mail,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text(
                      ' Hubungi Kami',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blue,
                  thickness: 2,
                  height: 20,
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text(
                      ' Alamat Perusahaan:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text('Jl. Kenangan Mantan No.10'),
                Text('Kota Medan'),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text(
                      ' Email:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text('HzDiecast@gmail.com'),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text(
                      ' Telepon:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text('+628 9212 9212'),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.schedule,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text(
                      ' Jam Operasional:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text('Setiap Hari: 09.00 - 14.00'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
