import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbridge_ecommerce_project/Repostitory/auth_repository.dart';
import 'package:skillbridge_ecommerce_project/screens/auth/login_screen.dart';
import 'package:skillbridge_ecommerce_project/screens/payment_screen.dart';


class AuthWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);


    return authState.when(
      data: (user) {
        if (user == null) {
          return LoginScreen();
        } else {
          return PaymentScreen(); // your ecommerce main screen
        }
      },
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}


final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepostioryProvider).authStateChanges();
});
