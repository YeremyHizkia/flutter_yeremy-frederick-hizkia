import 'package:flutter/material.dart';

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        title: Text('JSON ListView in Flutter',
            style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 61, 61, 61),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "L",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Leanne Graham"),
            subtitle: Text("1-770-736-8031 x56442"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "E",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Ervin Howell"),
            subtitle: Text("010-692-6593 x09125"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "C",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Clementine Bauch"),
            subtitle: Text("1-463-123-4447"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "P",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Patricia Lebsack"),
            subtitle: Text("493-170-9623 x156"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "C",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Chelsey Dietrich"),
            subtitle: Text("(247)954-1289"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "M",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Mrs. Dennis Schulist"),
            subtitle: Text("1-477-935-8478 x6430"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "K",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Kurtis Weissnat"),
            subtitle: Text("210.067.6132"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 43, 43, 43),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
