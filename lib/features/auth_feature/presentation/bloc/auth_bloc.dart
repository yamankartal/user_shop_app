import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/enums.dart';
import '../../domain/use_case/check_email_case.dart';
import '../../domain/use_case/is_sign_in_case.dart';
import '../../domain/use_case/reset_password_case.dart';
import '../../domain/use_case/sign_in_case.dart';
import '../../domain/use_case/sign_up_case.dart';
import '../../domain/use_case/verify_code_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckEmailCase caseCheckEmail;
  final CaseSignIn caseSignIn;
  final CaseSignUp caseSignUp;
  final CaseVerifyCode caseVerifyCode;
  final IsSignInCase isSignInCase;
  final ResetPasswordCase resetPasswordCase;
  AuthBloc(
      this.resetPasswordCase,
    this.caseCheckEmail,
    this.caseSignIn,
    this.caseSignUp,
    this.caseVerifyCode,
    this.isSignInCase,
  ) : super(AuthState()) {
    on<EventSignIn>(
      (event, emit) async {
        emit(
          state.copyWith(signInState: States.loading),
        );
        final res = await caseSignIn.call(
          ParamSignIn(event.email, event.password),
        );
        res.fold(
          (l) => emit(
            state.copyWith(
              signInState: States.error,
              errorMsg: errorMsg(l),
            ),
          ),
          (r) => emit(
            state.copyWith(signInState: States.loaded),
          ),
        );
      },
    );
    on<EventSignUp>(
      (event, emit) async {
        emit(
          state.copyWith(signUpState: States.loading),
        );
        final res = await caseSignUp.call(
          ParamSignUp(event.email, event.password, event.phone, event.userName),
        );
        res.fold(
          (l) => emit(
            state.copyWith(
              signUpState: States.error,
              errorMsg: errorMsg(l),
            ),
          ),
          (r) => emit(
            state.copyWith(
              signUpState: States.loaded,
            ),
          ),
        );
      },
    );

    on<EventVerifyCode>(
      (event, emit) async {
        emit(
          state.copyWith(verifyCodeState: States.loading),
        );
        final res = await caseVerifyCode.call(
          ParamVerifyCode(event.verifyCode, event.email),
        );
        res.fold(
          (l) => emit(
            state.copyWith(
              verifyCodeState: States.error,
              errorMsg: errorMsg(l),
            ),
          ),
          (r) => emit(
            state.copyWith(verifyCodeState: States.loaded),
          ),
        );
      },
    );

    on<EventCheckEmail>((event, emit) async {
      emit(state.copyWith(checkEmailState: States.loading));
      final res = await caseCheckEmail.call(
        ParamCheckEmail(event.email),
      );
      res.fold(
        (l) => emit(
          state.copyWith(checkEmailState: States.error,errorMsg: errorMsg(l)),
        ),
        (r) => emit(
          state.copyWith(
            checkEmailState: States.loaded,
          ),
        ),
      );
    },);

    on<EventResetPassword>((event, emit)async{
      emit(state.copyWith(resetPasswordState: States.loading));
      final res =await resetPasswordCase(ParamResetPassword(event.email, event.password));
      res.fold((l) => emit(state.copyWith(resetPasswordState: States.error)), (r) => emit(state.copyWith(resetPasswordState: States.loaded)));
    });

    on<EventPasswordVisibility>((event, emit) {
      emit(state.copyWith(hidePassword: !state.hidePassword),);
    },);

    on<IsSignInEvent>((event, emit) async {
      emit(state.copyWith(isSignInState: States.loading),);
      final res = await isSignInCase(ParamIsSignIn(),);
      res.fold(
          (l) => emit(state.copyWith(
                isSignInState: States.loaded,
              ),),
          (r) =>
              emit(state.copyWith(isSignInState: States.loaded, isSignIn: r),),);
    },);
  }
}
