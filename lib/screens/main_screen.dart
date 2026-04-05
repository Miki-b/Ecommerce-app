import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:skillbridge_ecommerce_project/controllers/cart_provider.dart';
import 'package:skillbridge_ecommerce_project/screens/add_product_screen.dart';
import 'package:skillbridge_ecommerce_project/screens/product_detail_screen.dart';
import 'package:skillbridge_ecommerce_project/screens/cart_screen.dart';
import 'package:skillbridge_ecommerce_project/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainScreen()));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavWrapper(),
    );
  }
}

class BottomNavWrapper extends ConsumerStatefulWidget {
  const BottomNavWrapper({super.key});

  @override
  ConsumerState<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends ConsumerState<BottomNavWrapper> {
  int _selectedIndex = 0;

  final Color primaryColor = const Color(0xFF5AA5D4);

  final List<Widget> _screens = const [
    HomeScreen(),
    AddProductScreen(),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch cart to get item count for badge
    final cartItems = ref.watch(cartProvider);
    final cartCount = cartItems.fold(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      backgroundColor: const Color(0xFFECF3F4),
      appBar: AppBar(
        title: Text(
          "E‑commerce",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          // Cart icon with badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
              if (cartCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      cartCount > 99 ? '99+' : cartCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
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
                const SizedBox(width: 60), // Space for middle button
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
                        offset: const Offset(0, 3),
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