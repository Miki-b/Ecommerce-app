import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:skillbridge_ecommerce_project/screens/add_product_screen.dart';
import 'package:skillbridge_ecommerce_project/screens/home_screen.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavWrapper(),
    );
  }
}

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({super.key});

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int _selectedIndex = 0;

  final Color primaryColor = const Color(0xFF5AA5D4);

  final List<Widget> _screens = const [
    HomeScreen(),
    AddProductScreen(),
    Center(child: Text('profile'))
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF3F4),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Left icon - Home
                IconButton(
                  onPressed: () => _onItemTapped(0),
                  icon: Icon(
                    Icons.home,
                    color: _selectedIndex == 0 ? primaryColor : Colors.grey,
                    size: 38,
                  ),
                ),

                SizedBox(width: 60), // Space for middle button

                // Right icon - Profile
                IconButton(
                  onPressed: () => _onItemTapped(2),
                  icon: Icon(
                    Icons.account_circle,
                    color: _selectedIndex == 2 ? primaryColor : Colors.grey,
                    size: 38,
                  ),
                ),
              ],
            ),
          ),

          // Middle Circular Add Button
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => _onItemTapped(1),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
