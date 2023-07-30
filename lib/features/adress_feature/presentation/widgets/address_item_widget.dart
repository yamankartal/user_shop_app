import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/adress_feature/data/model/addressModel.dart';
import 'package:shopapp/features/adress_feature/presentation/bloc/address_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../screens/adress_details_screen.dart';

class AddressItemWidget extends StatelessWidget {
  final AddressBloc addressBloc;
  final AddressModel addressModel;
  final int index;
  final FromScreen fromScreen;
  const AddressItemWidget({Key? key, required this.addressBloc, required this.addressModel, required this.index, required this.fromScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.padding*0.5)
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BlocProvider.value(
            value: addressBloc,
            child:AddressDetailsScreen(addressId: addressModel.addressId!,index: index,fromScreen: fromScreen,)
          )));
        },
        trailing: IconButton(
          onPressed: () {
            addressBloc.add(DeleteAddressEvent(index));
          },
          icon:  const Icon(Icons.delete_outline,color: AppColor.primaryColors,),
        ),
        title: Text(addressModel.addressCity!),
        subtitle:
        Text(addressModel.addressStreet!),
      ),
    );
  }
}
