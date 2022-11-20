import 'package:flutter/material.dart';
import '../cat_list.dart';
import '../second_page.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomTabState();
  }
}

class _BottomTabState extends State<BottomTab> {
  int _currentIndex = 0;
  final _pageWidgets = [const CatList(), const SecondPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.import_contacts_outlined,
              ),
              label: ('お薬手帳')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active_outlined,
              ),
              label: ('お薬アラーム')),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}
