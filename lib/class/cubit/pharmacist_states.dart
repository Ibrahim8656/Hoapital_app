abstract class PharmacistStates {}

class PharmacistInitial extends PharmacistStates {}

class PharmacistSignInLoading extends PharmacistStates {}

class PharmacistSignInSuccess extends PharmacistStates {}

class PharmacistSignInFailure extends PharmacistStates {
  final String errorMassage;
  PharmacistSignInFailure({required this.errorMassage});
}

class ChangeBottomNabBarState extends PharmacistStates {}

class ChangeVisiableState extends PharmacistStates {}
