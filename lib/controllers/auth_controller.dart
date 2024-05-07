import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/routes/app_routes.dart';
import 'package:plantist_case_app/utils/notification_utils.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;

  User? get activeUser => _firebaseUser.value;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());

    ever(_firebaseUser, (callback) {
      if (_firebaseUser.value != null) {
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        Get.offAllNamed(AppRoutes.welcomeScreen);
      }
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await Future.delayed(const Duration(seconds: 1));
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
      rethrow;
    }
  }
}
