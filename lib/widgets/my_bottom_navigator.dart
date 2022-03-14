import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedLabelStyle: Theme.of(context).textTheme.headline5,
      unselectedLabelStyle: Theme.of(context).textTheme.headline5,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:
              _selectedIndex == 0 ? SvgPicture.asset('') : SvgPicture.asset(''),
          label: 'My parcels',
        ),
        BottomNavigationBarItem(
          icon:
              _selectedIndex == 1 ? SvgPicture.asset('') : SvgPicture.asset(''),
          label: 'Send parcel',
        ),
        BottomNavigationBarItem(
          icon:
              _selectedIndex == 2 ? SvgPicture.asset('') : SvgPicture.asset(''),
          label: 'Parcel center',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}