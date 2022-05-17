import 'package:flutter/material.dart';
import 'package:vacxpass_front/Screens/authScreen.dart';
import 'package:vacxpass_front/Screens/navigate/add_new_vaccination.dart';
import 'package:vacxpass_front/Screens/navigate/homeScreen.dart';
import 'package:vacxpass_front/Screens/navigate/certificate_info.dart';
import 'package:vacxpass_front/Screens/register/compProfileScreen.dart';
// import 'package:vacxpass_front/Services/database.dart';

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({Key? key}) : super(key: key);

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  // final DatabaseService _databaseService =
  // DatabaseService(uid: loggedUser!.uid);
  int _selectedIndex = 2;
  static final List<Widget?> _widgetOptions = [
    const CertificateInfo(),
    null,
    const HomeScreen(),
  ];

  void _onItemTapped(int index) {
    loggedUser?.name = 'Elong Husk';
    loggedUser?.dob = '1969-4-20';
    loggedUser?.nic = '6942069420';
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('');
    print('> Navigate Screen');
    print('');
    // _databaseService.getUserData();
    if (loggedUser!.name == null) {
      _widgetOptions[1] = CompProfileScreen();
    } else {
      _widgetOptions[1] = const AddNewVaccine();
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.description_outlined,
                size: 35,
              ),
              // icon: ImageIcon(
              //   AssetImage('assets/images/certicon.png'),
              // ),
              label: 'Certificate',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_outlined,
                size: 40,
              ),
              // icon: ImageIcon(
              //   AssetImage('assets/images/addicon.png'),
              // ),
              label: 'Add New',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 35,
              ),
              // icon: ImageIcon(
              //   AssetImage('assets/images/homeicon.png'),
              // ),
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
