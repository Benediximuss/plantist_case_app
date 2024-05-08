import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:plantist_case_app/controllers/auth_controller.dart';
import 'package:plantist_case_app/models/reminder_model.dart';
import 'package:plantist_case_app/models/user_model.dart';
import 'package:plantist_case_app/utils/notification_utils.dart';

class StorageController extends GetxController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> createUser({required UserModel newUser}) async {
    try {
      await _fireStore
          .collection('users')
          .doc(newUser.id)
          .set(_addTimestamp(newUser.toJson()));
    } on FirebaseException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "1: Error posting",
        message: e.message.toString(),
      );
    } catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "2: Error posting",
        message: e.toString(),
      );
    }
  }

  Stream<List<ReminderModel>> reminderStream(String uid) {
    return _fireStore
        .collection("users")
        .doc(uid)
        .collection("reminders")
        .orderBy("priority", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ReminderModel> retVal = <ReminderModel>[];
      for (var element in query.docs) {
        ReminderModel newRem =
            ReminderModel.fromDocumentSnapshot(documentSnapshot: element);
        retVal.add(newRem);
      }
      return retVal;
    });
  }

  Future<void> postNewItem() async {
    ReminderModel newRem = ReminderModel(
      priority: 3,
      title: 'porno',
      note: 'amk',
      due: Timestamp.now(),
      completed: true,
    );

    try {
      await _fireStore
          .collection('users')
          .doc(Get.find<AuthController>().activeUser!.uid)
          .collection('reminders')
          .doc()
          .set(_addTimestamp(newRem.toJson()));
    } on FirebaseException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "1: Error posting",
        message: e.message.toString(),
      );
    } catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "2: Error posting",
        message: e.toString(),
      );
    }
  }

  Future<void> deleteItem(String docId) async {
    try {
      await _fireStore
          .collection('users')
          .doc(Get.find<AuthController>().activeUser!.uid)
          .collection('reminders')
          .doc(docId)
          .delete();
    } catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: 'Error deleting',
        message: e.toString(),
      );
    }
  }

  Map<String, dynamic> _addTimestamp(Map<String, dynamic> json) =>
      json..['created_at'] = FieldValue.serverTimestamp();
}
