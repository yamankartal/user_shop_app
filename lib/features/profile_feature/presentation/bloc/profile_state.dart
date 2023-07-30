
part of "profile_bloc.dart";


class ProfileState{
  final States getUserDataState;
  final States addUserImageState;
  final States updateUserImageState;
  final States deleteImageState;
  final States updateUserNameState;
  final  UserModel userModel;
  final String errorMSg;
  ProfileState({this.errorMSg="",this.deleteImageState=States.init,this.addUserImageState=States.init, this.updateUserImageState=States.init,this.userModel=const UserModel(),this.getUserDataState=States.init, this.updateUserNameState=States.init});

  ProfileState copyWith({
    final States?signOutState,
    final States ?deleteImageState,
    final States? addUserImageState,
    final States ?updateUserImageState,
    final UserModel ?userModel,
    final States ?getUserDataState,
    final States ?updateUserNameState,
    final String ?errorMSg,
}){


    return ProfileState(
      deleteImageState: deleteImageState??this.deleteImageState,
      addUserImageState: addUserImageState??this.addUserImageState,
      updateUserImageState: updateUserImageState??this.updateUserImageState,
      userModel: userModel??this.userModel,
      getUserDataState: getUserDataState??this.getUserDataState,
      updateUserNameState: updateUserNameState??this.updateUserNameState,
      errorMSg: errorMSg??this.errorMSg
    );


  }


}