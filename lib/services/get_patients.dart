
import '../class/cubit/api_pharmacist.dart';
import '../class/cubit/models/Patient_model_pharmacist.dart';

class AllPatients {
  Future<List<PatientModel>> getAllPatients() async {
    List<dynamic> data = await Api().get(
        url:
        "https://fodail2011.pythonanywhere.com/api/patients");

    List<PatientModel> patientslist = [];
    for (int i = 0; i < data.length; i++) {
      patientslist.add(
        PatientModel.fromJson(data[i]),
      );
    }
    return patientslist;
  }
}
