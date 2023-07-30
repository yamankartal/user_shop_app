part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
class EventSignIn extends AuthEvent{
  final String email;
  final String password;
  EventSignIn(this.email, this.password,);
}
class EventSignUp extends AuthEvent{
  final String email;
  final String password;
  final String phone;
  final String userName;

  EventSignUp(this.email, this.password, this.phone, this.userName);
}
class EventForgetPassword extends AuthEvent{

}
class EventVerifyCode extends AuthEvent{
 final int verifyCode;
 final String email;
  EventVerifyCode(this.verifyCode, this.email);
}
class EventPasswordVisibility extends AuthEvent{

}
class EventCheckEmail extends AuthEvent{
final String email;
  EventCheckEmail(this.email);
}
class EventResetPassword extends AuthEvent{
final String email;
final String password;

  EventResetPassword(this.email, this.password);
}
class IsSignInEvent extends AuthEvent{}