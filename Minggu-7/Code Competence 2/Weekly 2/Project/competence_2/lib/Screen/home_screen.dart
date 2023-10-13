import 'package:competence_2/Screen/Information/about_us.dart';
import 'package:competence_2/Screen/Information/kartu_kontak.dart';
import 'package:competence_2/Screen/Regist_Screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Competence 2',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: const Text('Tampilkan Sidebar'),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'About Us', 'icon': Icons.info},
    {'title': 'Registration', 'icon': Icons.person_add},
    {'title': 'Contact Us', 'icon': Icons.contact_mail},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Your Name'),
            accountEmail: Text('your.email@example.com'),
          ),
          for (int index = 0; index < menuItems.length; index++)
            ListTile(
              title: Row(
                children: [
                  Icon(menuItems[index]['icon']),
                  const SizedBox(width: 16),
                  Text(
                    menuItems[index]['title'],
                    style: TextStyle(
                      fontWeight: _selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color:
                          _selectedIndex == index ? Colors.blue : Colors.black,
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                Navigator.pop(context);

                if (_selectedIndex == 0) {
                } else if (_selectedIndex == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsPage(),
                    ),
                  );
                } else if (_selectedIndex == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                  );
                } else if (_selectedIndex == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUsPage(),
                    ),
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}
