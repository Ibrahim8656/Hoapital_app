abstract class DoctorStates {}

class DoctorInitial extends DoctorStates {}

class DoctorSignInLoading extends DoctorStates {}

class DoctorSignInSuccess extends DoctorStates {}

class DoctorSignInFailure extends DoctorStates {
  final String errorMassage;
  DoctorSignInFailure({required this.errorMassage});
}

class ChangeBottomNabBarState extends DoctorStates {}

class ChangeVisiableState extends DoctorStates {}

class NoteInitialState extends DoctorStates {}

class AddDignoseState extends DoctorStates {}

class GetPatientState extends DoctorStates {}

class InitialPatientState extends DoctorStates {}

class GetmedicalState extends DoctorStates {}

class AddmedicalState extends DoctorStates {}

class InfoSucsse extends DoctorStates {}

class InfoInitial extends DoctorStates {}

class PatientDataInitialState extends DoctorStates {}

class PatientDataScusseState extends DoctorStates {}

class removeState extends DoctorStates {}

class nullpatientstate extends DoctorStates {}

class InitialHistory extends DoctorStates {}

class GetHistory extends DoctorStates {}

class InitialHistoryId extends DoctorStates {}

class GetHistoryId extends DoctorStates {}

class updata extends DoctorStates {}

class InitialRoomsState extends DoctorStates {}

class GetRoom extends DoctorStates {}

class addrowstate extends DoctorStates {}

class Initialadd extends DoctorStates {}

class AddHistory extends DoctorStates {}

class InitialBookingRoom extends DoctorStates {}

class GetBookingRoom extends DoctorStates {}

class AddHistoryApi extends DoctorStates {}

class ErrorState extends DoctorStates {
  final String message;
  ErrorState({required this.message});
}

class errorState extends DoctorStates {}
