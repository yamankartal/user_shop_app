import 'package:bloc/bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../auth_feature/data/model/user_model.dart';
import '../../domain/use_case/add_user_image_case.dart';
import '../../domain/use_case/delete_image_case.dart';
import '../../domain/use_case/get_user_data.dart';
import '../../domain/use_case/update_user_case.dart';
import '../../domain/use_case/update_user_image_case.dart';

part "profile_event.dart";
part "profile_state.dart";



class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{

  final UpdateUserNameCase updateUserNameCase;
  final GetUserDataCase getUserDataCase;
  final AddUserImageCase addUserImageCase;
  final DeleteImageCase deleteUserImageCase;
  final UpdateUserImageCase updateUserImageCase;
  ProfileBloc( this.updateUserNameCase, this.getUserDataCase, this.addUserImageCase, this.updateUserImageCase, this.deleteUserImageCase, ) : super(ProfileState()){



    on<UpdateUserName>((event, emit)async {
      emit(state.copyWith(updateUserNameState: States.loading));
      final res=await updateUserNameCase.call(ParamUpdateUserName(event.userName));
      res.fold((l) => emit(state.copyWith(updateUserNameState: States.error)), (r) {
        emit(state.copyWith(updateUserNameState: States.loaded,userModel: state.userModel.copyWith(userName:event.userName)));
      });
    });

    on<GetUserDataEvent>((event, emit)async{
      emit(state.copyWith(getUserDataState: States.loading));
      final res=await getUserDataCase.call(ParamGetUserData());
      res.fold((l) => emit(state.copyWith(getUserDataState: States.error)), (r) => emit(state.copyWith(getUserDataState: States.loaded,userModel: r)));
    });


    on<AddUserImageEvent>((event, emit)async{
      emit(state.copyWith(addUserImageState: States.loading));
      final res=await addUserImageCase.call(ParamAddUserImage(event.image));
      res.fold((l) => emit(state.copyWith(addUserImageState: States.error)), (r) => emit(state.copyWith(addUserImageState: States.loaded,userModel:state.userModel.copyWith(userImage:r))));
    });

    on<UpdateUserImageEvent>((event, emit)async{
      print('update');
      emit(state.copyWith(updateUserImageState: States.loading));
      final res=await updateUserImageCase.call(ParamAUpdateUserImage(event.image,event.oldImage));
      res.fold((l) => emit(state.copyWith(updateUserImageState: States.error)), (r) => emit(state.copyWith(updateUserImageState: States.loaded,userModel:state.userModel.copyWith(userImage:r))));
    });

    on<DeleteUserImageEvent>((event, emit)async{
      emit(state.copyWith(deleteImageState: States.loading));
      final res=await deleteUserImageCase.call(ParamDeleteImage());
      res.fold((l) => emit(state.copyWith(deleteImageState: States.error)), (r) => emit(state.copyWith(deleteImageState: States.loaded,userModel:state.userModel.copyWith(userImage:""))));
    });




  }

}