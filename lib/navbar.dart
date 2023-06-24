import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}



class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                ),
              BottomNavigationBarItem(icon: Icon(Icons.data_array),label: 'data'),
              BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: 'Account'),
            ],
          currentIndex: currentIndex,
            onTap: (int touchIndex) {
              setState(() {
                currentIndex = touchIndex;
              });
            });
  }
}

// class DataViewRoutes extends StatefulWidget {
//   const DataViewRoutes({super.key});

//   @override
//   State<DataViewRoutes> createState() => _DataViewRoutesState();
// }

// class _DataViewRoutesState extends State<DataViewRoutes> {
//   @override
//   Widget build(BuildContext context) {
//     return const ;
//   }
// }