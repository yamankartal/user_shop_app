import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/responsive.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? iconData;
  final bool hidePassword;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final String? Function(String? val)validate;
  final  void Function()? onTap;
  const TextFormFieldWidget({
    Key? key,
    required this.label,
    required this.hint,
     this.iconData,
    required this.validate,
    required this.textEditingController,
    this.onTap,
    this.hidePassword=false, this.textInputType,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Res.padding),
            width: Res.width,
            padding: EdgeInsets.symmetric(horizontal: Res.padding * 1.5),
            child: TextFormField(
              keyboardType:textInputType,
              controller: textEditingController,
              validator: validate,
              obscureText:hidePassword,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: Res.padding * 0.8, horizontal: Res.padding * 1.4),
                suffixIcon:onTap==null?Icon(iconData,color: Colors.black54,):InkWell(
                    borderRadius: BorderRadius.circular(Res.font),
                    onTap:onTap,
                    child: Icon(iconData,color:Colors.black54,)
                    ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Res.padding * 0.2),
                  child: Text(
                    label,
                    style: TextStyle(
                        fontSize: Res.font, color: AppColor.grey),
                  ),
                ),
                hintText: hint,
                hintStyle: TextStyle(
                    fontSize: Res.font*0.7, color: AppColor.grey),
                hoverColor: Colors.amber,
                fillColor: Colors.amber,
                focusColor: Colors.amber,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.grey),
                    borderRadius: BorderRadius.circular(Res.padding)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.grey),
                  borderRadius: BorderRadius.circular(Res.padding),
                ),
              ),
            ));
  }
}
