part of 'auth_bloc.dart';

class AuthState {
  final States isSignInState;
  final States signInState;
  final States signUpState;
  final States checkEmailState;
  final States verifyCodeState;
  final States resetPasswordState;
  final bool hidePassword;
  final bool isSignIn;
  final String errorMsg;

  AuthState({
    this.errorMsg="",
    this.isSignInState=States.init,
    this.isSignIn=false,
      this.signInState = States.init,
      this.signUpState = States.init,
      this.checkEmailState = States.init,
      this.verifyCodeState = States.init,
      this.hidePassword = false,
      this.resetPasswordState = States.init});

  AuthState copyWith({
    final States? signInState,
    final States? signUpState,
    final States? checkEmailState,
    final States? verifyCodeState,
    final States? resetPasswordState,
    final bool? hidePassword,
   final States? isSignInState,
    final bool ?isSignIn,
    final String ?errorMsg,
  }) {
    return AuthState(
      signInState: signInState ?? this.signInState,
      signUpState: signUpState ?? this.signUpState,
      checkEmailState: checkEmailState ?? this.checkEmailState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      hidePassword: hidePassword ?? this.hidePassword,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      isSignIn: isSignIn??this.isSignIn,
      isSignInState: isSignInState??this.isSignInState,
      errorMsg: errorMsg??this.errorMsg,
    );
  }
}
