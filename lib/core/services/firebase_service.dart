import 'package:bmi_calculator/core/util/app_keys_values.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final CollectionReference _collectionReference = FirebaseFirestore
      .instance
      .collection(StringConstance.usersCollectionName);

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseService._();

  static Future<UserCredential> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> saveData(
      {required String userId, required BmiEntry bmiEntry}) async {
    try {
      CollectionReference bmiHistoryRef = _collectionReference
          .doc(userId)
          .collection(StringConstance.bmiHistoryCollectionName);
      await bmiHistoryRef.doc().set({
        AppKeyValues.bmiStatus: bmiEntry.bmiStatus,
        AppKeyValues.height: bmiEntry.height,
        AppKeyValues.weight: bmiEntry.weight,
        AppKeyValues.age: bmiEntry.age,
        AppKeyValues.date: bmiEntry.date,
        AppKeyValues.bmi: bmiEntry.bmi
      });
    } catch (e) {
      rethrow;
    }
  }

  static Stream<QuerySnapshot> fetchData({required String userId}) {
    CollectionReference bmiHistoryRef = _collectionReference
        .doc(userId)
        .collection(StringConstance.bmiHistoryCollectionName);

    Query query = bmiHistoryRef.orderBy(AppKeyValues.date, descending: true);
    return query.snapshots();
  }

  static Future<void> deleteData(
      {required String bmiEntryId, required String userId}) async {
    try {
      await _collectionReference
          .doc(userId)
          .collection(StringConstance.bmiHistoryCollectionName)
          .doc(bmiEntryId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateData(
      {required String userId, required BmiEntryWithId updatedBmiEntry}) async {
    try {
      await _collectionReference
          .doc(userId)
          .collection(StringConstance.bmiHistoryCollectionName)
          .doc(updatedBmiEntry.id)
          .update({
        AppKeyValues.height: updatedBmiEntry.height,
        AppKeyValues.weight: updatedBmiEntry.weight,
        AppKeyValues.bmiStatus: updatedBmiEntry.bmiStatus,
        AppKeyValues.age: updatedBmiEntry.age,
        AppKeyValues.date: updatedBmiEntry.date,
        AppKeyValues.bmi: updatedBmiEntry.bmi
      });
    } catch (e) {
      rethrow;
    }
  }
}
