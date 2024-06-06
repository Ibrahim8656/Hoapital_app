
import '../class/cubit/api_pharmacist.dart';
import '../class/cubit/models/Record_model_pharmacist.dart';

class AllRecords {
  Future<List<RecordModel>> getAllRecords(int patientId) async {
    List<dynamic> data = await Api().get(
        url:
        "https://fodail2011.pythonanywhere.com/api/patients/$patientId/unfilled-medical-records/");

    List<RecordModel> recordslist = [];
    for (int i = 0; i < data.length; i++) {
      recordslist.add(
        RecordModel.fromJson(data[i]),
      );
    }
    return recordslist;
  }
}
