

import 'package:hosptial_project/class/cubit/models/Medicine_model_pharmacist.dart';

import '../class/cubit/api_pharmacist.dart';

class AllMedicines {
  Future<List<MedicineModel>> getAllMedicines() async {
    List<dynamic> data = await Api().get(
        url: "https://fodail2011.pythonanywhere.com/api/medications/list/");

    List<MedicineModel> medicineslist = [];
    for (int i = 0; i < data.length; i++) {
      medicineslist.add(
        MedicineModel.fromJson(data[i]),
      );
    }
    return medicineslist;
  }
}
