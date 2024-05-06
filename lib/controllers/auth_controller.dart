import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/utils/notification_utils.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool inside = false;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      // await _auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      await Future.delayed(const Duration(seconds: 1));

    } on FirebaseAuthException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error signing up",
        message: e.message.toString(),
      );
      rethrow;
    } catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error signing up",
        message: "An error occurred, please try again",
      );

      print(e.toString());
      rethrow;
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      inside = _auth.currentUser != null;
    } on FirebaseAuthException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error signing in",
        message: e.message.toString(),
      );
      rethrow;
    } catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error signing in",
        message: "An error occurred, please try again",
      );

      print(e.toString());
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      inside = _auth.currentUser != null;
      // Get.find<UserController>().clear();
    } on FirebaseAuthException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error signing out",
        message: e.message.toString(),
      );
    } catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error signing out",
        message: "An error occurred, please try again",
      );

      print(e.toString());
    }
  }
}
