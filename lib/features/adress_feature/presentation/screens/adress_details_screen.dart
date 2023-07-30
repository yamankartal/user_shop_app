import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../../../checkout_feature/presentation/bloc/checkout_bloc.dart';
import '../../../checkout_feature/presentation/screens/checkout_screen.dart';
import '../../../components/text_form_fieldWidget.dart';

import '../bloc/address_bloc.dart';

class AddressDetailsScreen extends StatefulWidget {
    final FromScreen fromScreen;
   final int addressId;
   final int index;

  const AddressDetailsScreen({Key? key, required this.addressId, required this.index, this.fromScreen=FromScreen.address,}) : super(key: key);

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {

  late AddressBloc addressBloc;
  final TextEditingController city = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController details = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    addressBloc = BlocProvider.of<AddressBloc>(context);
    addressBloc.add(GetAddressDetailsEvent(widget.addressId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Address details'),
          backgroundColor: AppColor.primaryColors,
        ),

        body: BlocBuilder<AddressBloc, AddressState>(
          buildWhen: (p,c)=>p.getAddressDetailsState!=c.getAddressDetailsState,
            builder: (_, state) {

             if(state.getAddressDetailsState==States.loading){
               return circularProgressIndicatorWidget();
             }

             else if(state.getAddressDetailsState==States.loaded){
             city.text = state.addressDetails.addressCity!;
               floor.text =state.addressDetails.addressFloor!;
                details.text =state.addressDetails.addressDetails!;
               street.text = state.addressDetails.addressStreet!;
               phone.text = state.addressDetails.addressPhone.toString();
               return  BlocConsumer<AddressBloc, AddressState>(
                 listener: (_, state) {
                   if (state.updateAddressState == States.error) {
                     ScaffoldMessenger.of(context)
                         .showSnackBar(
                         const SnackBar(content: Text('error')));
                   }
                   if (state.updateAddressState == States.loaded) {

                       if(widget.fromScreen==FromScreen.address) {
                         Navigator.of(context).pop();
                       }
                       else {
                         Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                         BlocProvider(create: (_)=>sl<CheckOutBloc>(),child: CheckOutScreen(addressId: widget.addressId,),)
                         ));
                       }
                   }
                 },
                 listenWhen: (p, c) =>
                 p.updateAddressState != c.updateAddressState,
                 buildWhen: (p, c) =>
                 p.updateAddressState != c.updateAddressState,
                 builder: (_, state) {
                   if (state.updateAddressState == States.loading) {
                     return circularProgressIndicatorWidget();
                   }
                   return SizedBox(
                     width: Res.width,
                     height: Res.height,
                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                           Form(
                             key: key,
                             child: Column(
                               children: [
                                 SizedBox(
                                   height: Res.font,
                                 ),
                                 TextFormFieldWidget(
                                   hint: "enter your city",
                                   iconData: Icons.edit,
                                   label: "city",
                                   textEditingController: city,
                                   validate: (val) {
                                     return null;
                                   },
                                 ),
                                 SizedBox(
                                   height: Res.font,
                                 ),


                                 TextFormFieldWidget(
                                   hint: "enter your street",
                                   iconData: Icons.edit,
                                   label: "street",
                                   textEditingController: street,
                                   validate: (val) {
                                     return null;
                                   },
                                 ),
                                 SizedBox(
                                   height: Res.font,
                                 ),
                                 TextFormFieldWidget(
                                   hint: "enter your floor",
                                   iconData: Icons.edit,
                                   label: "floor",
                                   textEditingController: floor,
                                   validate: (val) {
                                     return null;
                                   },
                                 ),
                                 SizedBox(
                                   height: Res.font,
                                 ),
                                 TextFormFieldWidget(
                                   hint: "enter your details",
                                   iconData: Icons.edit,
                                   label: "details",
                                   textEditingController: details,
                                   validate: (val) {
                                     return null;
                                   },
                                 ),
                                 SizedBox(
                                   height: Res.font,
                                 ),
                                 TextFormFieldWidget(
                                   hint: "enter your phone",
                                   iconData: Icons.edit,
                                   label: "phone",
                                   textEditingController: phone,
                                   validate: (val) {
                                     return null;
                                   },
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 },
               );
             }
             return Container();
            }
        ),
      bottomNavigationBar: Container(

        child: MaterialButton(
          height: Res.font*2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Res.padding),
              topLeft: Radius.circular(Res.padding),
            )
          ),
          color: AppColor.primaryColors,
          onPressed: () {
            addressBloc.add(UpdateAddressEvent(
                addressId:addressBloc.state.addresses[widget.index].addressId!,
                addressCity: city.text,
                addressStreet: street.text,
                addressDetails: details.text,
                addressFloor: floor.text,
                addressPhone: int.parse(phone.text),
                index: widget.index));
          },
          child:  Text(
            widget.fromScreen==FromScreen.address?'save':"continue",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),

    );
  }
}
