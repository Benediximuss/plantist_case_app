import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Firedb {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Future<bool> createNewUser(UserModel user) async {
  //   try {
  //     await _fireStore.collection("users").doc(user.id).set({
  //       "name": user.name,
  //       "email": user.email,
  //     });
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  static Future<void> postNewItem() async {
    try {
      await _fireStore.collection("testing").doc().set({
        "title": 'testTitle2',
        "number": 12,
      });
    } on FirebaseException catch (e) {
      Get.snackbar(
        "1: Error posting",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "2: Error posting",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
