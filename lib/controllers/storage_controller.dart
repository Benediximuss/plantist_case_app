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
      await _fireStore.collection('users').doc(newUser.id).set(_addTimestamp(newUser.toJson()));
    } on FirebaseException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error creating user",
        message: e.message.toString(),
      );
      rethrow;
    } catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error creating user",
        message: 'An error occurred, please try again',
      );
      print(e.toString());
      rethrow;
    }
  }

  Stream<List<ReminderModel>> reminderStream(String uid) {
    return _fireStore.collection("users").doc(uid).collection("reminders").orderBy("due", descending: false).snapshots().map((QuerySnapshot query) {
      List<ReminderModel> retVal = <ReminderModel>[];
      for (var element in query.docs) {
        ReminderModel newRem = ReminderModel.fromDocumentSnapshot(documentSnapshot: element);
        retVal.add(newRem);
      }
      return retVal;
    });
  }

  Future<void> postReminder({required ReminderModel reminder}) async {
    try {
      final collection = _fireStore.collection('users').doc(Get.find<AuthController>().activeUser!.uid).collection('reminders');

      final newDoc = _addTimestamp(reminder.toJson());

      if (reminder.id == null) {
        await collection.doc().set(newDoc);
      } else {
        await collection.doc(reminder.id).set(newDoc);
      }
    } on FirebaseException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error ${reminder.id == null ? 'updating' : 'creating'} reminder",
        message: e.message.toString(),
      );
      rethrow;
    } catch (e) {
      Get.snackbar("title", "message");
      NotificationUtils.showCustomSnackbar(
        title: "Error ${reminder.id == null ? 'updating' : 'creating'} reminder",
        message: "An error occurred, please try again",
      );

      print(e.toString());
      rethrow;
    }
  }

  Future<void> deleteReminder(String docId) async {
    try {
      await _fireStore.collection('users').doc(Get.find<AuthController>().activeUser!.uid).collection('reminders').doc(docId).delete();
    } on FirebaseException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title: "Error deleting reminder",
        message: e.message.toString(),
      );
      rethrow;
    } catch (e) {
      Get.snackbar("title", "message");
      NotificationUtils.showCustomSnackbar(
        title: "Error deleting reminder",
        message: "An error occurred, please try again",
      );

      print(e.toString());
      rethrow;
    }
  }

  void completeReminder(ReminderModel reminder) {
    reminder.completed = !reminder.completed;
    postReminder(reminder: reminder);
  }

  Map<String, dynamic> _addTimestamp(Map<String, dynamic> json) => json..['last_edit'] = FieldValue.serverTimestamp();
}
