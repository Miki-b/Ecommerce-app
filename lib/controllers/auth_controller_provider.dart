import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbridge_ecommerce_project/Repostitory/auth_repository.dart';


class AuthController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}


  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepostioryProvider)
          .signIn(email, password);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepostioryProvider)
          .signUp(email, password);


      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }




}


final authControllerProvider =
AsyncNotifierProvider<AuthController, void>(() {
  return AuthController();
});
