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
    return _fireStore
        .collection("users")
        .doc(uid)
        .collection("reminders")
        .orderBy("due", descending: false)
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

  Future<void> postNewItem({required ReminderModel reminder}) async {
    try {
      final collection = _fireStore
          .collection('users')
          .doc(Get.find<AuthController>().activeUser!.uid)
          .collection('reminders');

      final newDoc = _addTimestamp(reminder.toJson());

      if (reminder.id == null) {
        await collection.doc().set(newDoc);
      } else {
        await collection.doc(reminder.id).set(newDoc);
      }
    } on FirebaseException catch (e) {
      NotificationUtils.showCustomSnackbar(
        title:
            "Error ${reminder.id == null ? 'updating' : 'creating'} reminder",
        message: e.message.toString(),
      );
      rethrow;
    } catch (e) {
      Get.snackbar("title", "message");
      NotificationUtils.showCustomSnackbar(
        title:
            "Error ${reminder.id == null ? 'updating' : 'creating'} reminder",
        message: "An error occurred, please try again",
      );

      print(e.toString());
      rethrow;
    }
  }

  Future<void> postDummy() async {
    List<ReminderModel> listed = [
      ReminderModel(
        priority: 2,
        title: 'Odev yap',
      ),
      ReminderModel(
        priority: 1,
        title: '31 koy',
        note: 'saglam bir porno ac',
      ),
      ReminderModel(
        priority: 0,
        title: 'Tras ol',
        due: Timestamp.now(),
      ),
      ReminderModel(
        priority: 3,
        title: 'porno',
        due: Timestamp.now(),
        timeInDue: true,
      ),
      ReminderModel(
        priority: 0,
        title: 'masa topla',
        note: 'sik sok işler hakketen aq',
        due: Timestamp.now(),
      ),
      ReminderModel(
        priority: 0,
        title:
            'masa topla ve sonra kalkıpğ siktor olup git lütfen masa topla ve sonra kalkıpğ siktor olup git lütfen masa topla ve sonra kalkıpğ siktor olup git lütfen',
        note:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        due: Timestamp.now(),
        timeInDue: true,
      ),
    ];

    try {
      listed.forEach((element) async {
        await _fireStore
            .collection('users')
            .doc(Get.find<AuthController>().activeUser!.uid)
            .collection('reminders')
            .doc()
            .set(_addTimestamp(element.toJson()));
      });
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

  Map<String, dynamic> _addTimestamp(Map<String, dynamic> json) =>
      json..['last_edit'] = FieldValue.serverTimestamp();
}
