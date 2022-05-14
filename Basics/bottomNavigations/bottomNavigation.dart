import 'package:basics2/bottomNavigations/screens/screen1.dart';
import 'package:basics2/bottomNavigations/screens/screen2.dart';
import 'package:basics2/bottomNavigations/screens/screen3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNavigations(),
  ));
}

class BottomNavigations extends StatefulWidget {
  const BottomNavigations({Key? key}) : super(key: key);

  @override
  State<BottomNavigations> createState() => _BottomNavigationsState();
}

class _BottomNavigationsState extends State<BottomNavigations> {
  int _selectedIndex = 0;

  final List<Widget> _widgetscreen = <Widget>[
    const Screen1(),
    const Screen2(),
    const Screen3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation'),
      ),
      body: Center(
        child: _widgetscreen.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          navIcons(
            labelText: 'Home',
            icons: Icons.home,
          ),
          navIcons(labelText: 'Business', icons: Icons.business),
          navIcons(labelText: 'School', icons: Icons.school),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  BottomNavigationBarItem navIcons({icons, labelText}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icons,
        color: Colors.blueAccent,
        size: 35,
      ),
      label: labelText,
    );
  }

}

