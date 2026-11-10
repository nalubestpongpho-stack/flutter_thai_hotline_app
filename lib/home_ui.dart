import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'about_ui.dart';
import 'bank_ui.dart';
import 'emg_ui.dart';
import 'pub_ui.dart';
import 'travel_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  static const _pages = [TravelUI(), EmgUI(), BankUI(), PubUI()];

  Future<void> _openAbout() async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const AboutUI()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายด่วน THAILAND'),
        actions: [
          IconButton(
            tooltip: 'เกี่ยวกับแอป',
            onPressed: _openAbout,
            icon: const FaIcon(FontAwesomeIcons.circleInfo, size: 19),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.directions_transit_outlined),
            selectedIcon: Icon(Icons.directions_transit),
            label: 'การเดินทาง',
          ),
          NavigationDestination(
            icon: Icon(Icons.emergency_outlined),
            selectedIcon: Icon(Icons.emergency),
            label: 'ฉุกเฉิน',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_outlined),
            selectedIcon: Icon(Icons.account_balance),
            label: 'ธนาคาร',
          ),
          NavigationDestination(
            icon: Icon(Icons.electrical_services_outlined),
            selectedIcon: Icon(Icons.electrical_services),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}
