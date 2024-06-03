
import 'models/history_medical_model.dart';

abstract class DoctorStates{}
class DoctorInitial extends DoctorStates{}
class DoctorSignInLoading extends DoctorStates {}
class DoctorSignInSuccess  extends DoctorStates {
  final  data ;
  DoctorSignInSuccess({required this.data});
}
class DoctorSignInFailure extends DoctorStates {
  final String errorMassage;
  DoctorSignInFailure({required this.errorMassage});}
class ChangeBottomNabBarState extends DoctorStates {}
class ChangeVisiableState extends  DoctorStates {}
class AddNewNoteState extends  DoctorStates {}
class AddDignoseState extends  DoctorStates {}
class UpdateListState extends  DoctorStates {}
class NoteInitialState extends DoctorStates{}
class MediaclInitialState extends DoctorStates{}
class AddMedicalState extends DoctorStates{}
class NoteUpdatedState extends DoctorStates{
  final List<HistoryMedicalModel>historylist;
  NoteUpdatedState(this.historylist);
}
class PatientInitialState extends DoctorStates{}
class PatientUpdateState extends DoctorStates{}
//




