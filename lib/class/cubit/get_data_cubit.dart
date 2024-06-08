import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptial_project/class/cubit/models/doctor_login_respone.dart';
import 'package:hosptial_project/sheared/constant/constant.dart';
import 'package:hosptial_project/sheared/shearedpref/shearedprefrances.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataStateInitial());

  void getDoctorData() async {
    emit(GetDataStateLoading());
    try {
      String? doc = CacheHelper.getData(key: 'doctorData') as String?;
      if (doc != null) {
        var data = json.decode(doc);
        Constants.doctor = DoctorLoginResponse.fromJson(data);
        emit(GetDoctorDataSuccess(doctor: Constants.doctor!));
      }
    } catch (e) {
      emit(GetDoctorDataError(error: e.toString()));
    }
  }
}
