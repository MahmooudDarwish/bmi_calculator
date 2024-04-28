import 'package:bmi_calculator/core/services/firebase_service.dart';
import 'package:bmi_calculator/features/bmi_entries_history/domain/use_cases/get_bmi_history_use_case.dart';
import 'package:bmi_calculator/shared/models/bmi_entry_with_id_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseGetBmiHistoryDataSource {
  Stream<List<BmiEntryWithIdModel>> getBmiHistoryData(
      {required BmiGettingHistoryParameters bmiGettingHistoryParameters});
}

class GetBmiHistoryDataSource implements BaseGetBmiHistoryDataSource {
  @override
  Stream<List<BmiEntryWithIdModel>> getBmiHistoryData(
      {required BmiGettingHistoryParameters bmiGettingHistoryParameters}) {
    Stream<QuerySnapshot> stream = FirebaseService.fetchData(
      userId: bmiGettingHistoryParameters.userId,
    );
    return stream.map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return BmiEntryWithIdModel.fromJson(json: data, id: doc.id);
      }).toList();
    });
  }
}
