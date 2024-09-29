import 'dart:developer';

import '../../models/auth_model.dart';
import '../../util/response_state.dart';
import 'firebase_repo.dart';

abstract class FirebasAuthRepo {
  Future<DataState> signUp(SignUpModel signUpData);
  Future<DataState> signIn(SignInModel signInData);

}

class FirebaseAuthRepoImpl extends FirebasAuthRepo {
  @override
  Future<DataState> signIn(SignInModel signInData) async {
    var auth = FirebaseService.firebaseAuth;

    try {
      var response = await auth.signInWithEmailAndPassword(
          email: signInData.email!, password: signInData.password!);

      return DataSuccess(response);
    } catch (e) {
      log(e.toString());
      return DataFailed(e);
    }
  }

  @override
  Future<DataState> signUp(SignUpModel signUpData) async {
    var auth = FirebaseService.firebaseAuth;
    try {
      var response = await auth.createUserWithEmailAndPassword(
          email: signUpData.email!, password: signUpData.password!);

      var userNewSignUpData = signUpData.copyWith(id: response.user!.uid);

      var collection = FirebaseService.firestoreCollection;
      await collection.collection("users").doc(response.user!.uid).set(
            userNewSignUpData.toJson(),
          );

      return DataSuccess(response);
    } catch (e) {
      log(e.toString());
      return DataFailed(e);
    }
  }


}
