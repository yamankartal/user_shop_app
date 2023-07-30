part of "profile_bloc.dart";

abstract class ProfileEvent{}

class GetUserEvent extends ProfileEvent{

}

class UpdateUserName extends ProfileEvent{
  final String userName;
  UpdateUserName(this.userName);
}

class GetUserDataEvent extends ProfileEvent{

}

class AddUserImageEvent extends ProfileEvent{
  final String image;
  AddUserImageEvent(this.image);
}

class UpdateUserImageEvent extends ProfileEvent{
  final String image;
  final String oldImage;
  UpdateUserImageEvent(this.image, this.oldImage);
}

class DeleteUserImageEvent extends ProfileEvent{

}

