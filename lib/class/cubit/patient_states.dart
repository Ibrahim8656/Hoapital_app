abstract class PatientStates{}
class patientInitial extends PatientStates {}
class PatientSignInLoading extends PatientStates {}
class PatientSignInSuccess  extends PatientStates {}
class BOkingpatientlodingstate  extends PatientStates {}
class GitBookingPaptientdatastate  extends PatientStates {}

class Register1Succss  extends PatientStates {
  final String accss ;
  Register1Succss({required this.accss});
}
class Login1Succss  extends PatientStates {
  final  data ;
  Login1Succss({required this.data});
}
class PatientSignInFailure extends PatientStates {
  final String errorMassage;
  PatientSignInFailure({required this.errorMassage});}

  class PatientSignUPLoading extends PatientStates {}
  class PatientSignUPSuccess  extends PatientStates {}
  class Ontap  extends PatientStates {}
  class docOntap  extends PatientStates {}
  class PatientSignUPFailure extends PatientStates {
    final String errorMassage;

    PatientSignUPFailure({required this.errorMassage});
  }
  class PatientLoginFailure extends PatientStates {
    final String errorMassage;

    PatientLoginFailure({required this.errorMassage});
  }

class PageChangedState extends PatientStates {
  final int pageIndex;
  final int selectedIconIndex;
  PageChangedState(this.pageIndex, this.selectedIconIndex);
}
class ErrorGetdoctorData  extends PatientStates {
  final String error;

  ErrorGetdoctorData(this.error);
}
class SuccsseGetdoctorData extends PatientStates {}
class Caangeiconpassword  extends PatientStates {}
class doctorlodingstate  extends PatientStates {}
class GitDoctordatastate  extends PatientStates {}

class GitPaptientdatastate extends PatientStates {}
class patientlodingstate extends PatientStates {}
class GitDoctrodatastate extends PatientStates {}
class Git1Doctrodatatate extends PatientStates {}
class Lodingstatedoc extends PatientStates {}
class PatientLoadingState extends PatientStates {}
class GetDepatmentsstate extends PatientStates {}
class GitDepartmentDoctrodatatate extends PatientStates {}
class GitDoctorTimestate extends PatientStates {}
class BookingUPLoading extends PatientStates {}
class BookingSuccss extends PatientStates {}
class BookingFailure  extends PatientStates {
  final String error;

  BookingFailure(this.error);
}

class DoctorInitial extends PatientStates{}
class DoctorSignInLoading extends PatientStates {}
class DoctorSignInSuccess  extends PatientStates {
  final  data ;
  DoctorSignInSuccess({required this.data});
}
class DoctorSignInFailure extends PatientStates {
  final String errorMassage;
  DoctorSignInFailure({required this.errorMassage});}
class ChangeBottomNabBarState extends PatientStates {}
class ChangeVisiableState extends  PatientStates {}
class AddNewNoteState extends  PatientStates {}
class AddDignoseState extends  PatientStates {}
class UpdateListState extends  PatientStates {}
class NoteInitialState extends PatientStates{}
class MediaclInitialState extends PatientStates{}
class AddMedicalState extends PatientStates{}
class PatientInitialState extends PatientStates{}
class PatientUpdateState extends PatientStates{}
//



