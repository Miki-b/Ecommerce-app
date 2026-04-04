import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbridge_ecommerce_project/Repostitory/auth_repository.dart';

class AuthController extends AsyncNotifier<void>{


  @override
  Future<void> build() async {}


  //sign in
  Future<void> login (String email , String password) async{

    state = const AsyncLoading();

    try {
      ref.read(authRepostioryProvider).signIn(email, password);


    }catch(e, st){
      state = AsyncError(e, st);
    }


  }




}