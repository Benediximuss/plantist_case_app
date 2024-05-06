import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool inside = false;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    print("3131: signup - $email, $password");
    // try {
    //   await _auth.createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    // } on FirebaseAuthException catch (e) {
    //   Get.snackbar(
    //     "Error signing up",
    //     e.message.toString(),
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) inside = true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
