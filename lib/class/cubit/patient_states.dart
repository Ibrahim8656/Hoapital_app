abstract class PatientStates{}
class patientInitial extends PatientStates {}
class PatientSignInLoading extends PatientStates {}
class PatientSignInSuccess  extends PatientStates {}

class Register1Succss  extends PatientStates {
  final String accss ;
  Register1Succss({required this.accss});
}
class PatientSignInFailure extends PatientStates {
  final String errorMassage;
  PatientSignInFailure({required this.errorMassage});}

  class PatientSignUPLoading extends PatientStates {}
  class PatientSignUPSuccess  extends PatientStates {}
  class Ontap  extends PatientStates {}
  class PatientSignUPFailure extends PatientStates {
    final String errorMassage;

    PatientSignUPFailure({required this.errorMassage});
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


