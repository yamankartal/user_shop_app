import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/features/auth_feature/data/model/user_model.dart';
import 'package:shopapp/features/profile_feature/presentation/bloc/profile_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../auth_feature/validate/validate.dart';

class UserNameWidget extends StatelessWidget {
  final UserModel userModel;
  final ProfileBloc profileBloc;
  final TextEditingController textEditingController;
  const UserNameWidget({Key? key, required this.userModel, required this.textEditingController, required this.profileBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Res.padding*0.5),
      child: TextButton(child:Text(userModel.userName!,style: TextStyle(fontSize: Res.font*1.2,color: Colors.black),),onPressed: (){
        showDialog(context: context, builder:(_)=>AlertDialog(
          content: TextFormField(
            cursorColor: Colors.black,
            controller: textEditingController,
            decoration: InputDecoration(
              focusColor: Colors.amber,
              enabledBorder: OutlineInputBorder(

                  borderSide: const BorderSide(color: AppColor.grey),
                  borderRadius: BorderRadius.circular(Res.padding)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.grey),
                borderRadius: BorderRadius.circular(Res.padding),
              ),
            ),
            validator: (val){
              return validate(max: 30, min: 5, type: Auth.userName, val: val);
            },

          ),
          title: Text("Change user name",style:Theme.of(context).textTheme.bodyText1,),
          actions: [
            TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("Cancel",style: TextStyle(color: AppColor.primaryColors),)),
            TextButton(onPressed: (){

              Navigator.of(context).pop();
              profileBloc.add(UpdateUserName(textEditingController.text));
              textEditingController.text="";
            }, child: const Text("Change",style: TextStyle(color: AppColor.primaryColors),)),
          ],

        ));
      }),
    );
  }
}
