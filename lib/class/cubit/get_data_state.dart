part of 'get_data_cubit.dart';

abstract class GetDataState {}

class GetDataStateInitial extends GetDataState {}

class GetDataStateLoading extends GetDataState {}

class GetDoctorDataSuccess extends GetDataState {
  final DoctorLoginResponse doctor;

  GetDoctorDataSuccess({required this.doctor});
}

class GetDoctorDataError extends GetDataState {
  final String error;

  GetDoctorDataError({required this.error});
}
