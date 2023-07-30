import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../components/text_form_fieldWidget.dart';
import '../bloc/address_bloc.dart';

class AddAddressScreen extends StatefulWidget {

 final double addressDistance;
  const AddAddressScreen({Key? key, required this.addressDistance}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController city = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController details = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  late AddressBloc addressBloc;

  @override
  void initState() {
    addressBloc = BlocProvider.of<AddressBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add address'),
        backgroundColor: AppColor.primaryColors,
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (_, state) {
          if (state.addAddressState == States.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('error')));
          }
          if (state.addAddressState == States.loaded) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        },
        listenWhen: (p, c) => p.addAddressState != c.addAddressState,
        buildWhen: (p, c) => p.addAddressState != c.addAddressState,
        builder: (_, state) {
          if (state.addAddressState == States.loading) {
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
                          label: "city",
                          textEditingController: city,
                          validate: (val) {
                            return val!.isEmpty ? "empty" : null;
                          },
                        ),
                        SizedBox(
                          height: Res.font,
                        ),
                        TextFormFieldWidget(
                          hint: "enter your street",
                          label: "street",
                          textEditingController: street,
                          validate: (val) {
                            return val!.isEmpty ? "empty" : null;
                          },
                        ),
                        SizedBox(
                          height: Res.font,
                        ),
                        TextFormFieldWidget(
                          hint: "enter your floor",
                          label: "floor",
                          textEditingController: floor,
                          validate: (val) {
                            return val!.isEmpty ? "empty" : null;
                          },
                        ),
                        SizedBox(
                          height: Res.font,
                        ),
                        TextFormFieldWidget(
                          hint: "enter your details",
                          label: "details",
                          textEditingController: details,
                          validate: (val) {
                            return val!.isEmpty ? "empty" : null;
                          },
                        ),
                        SizedBox(
                          height: Res.font,
                        ),
                        TextFormFieldWidget(
                          textInputType: TextInputType.phone,
                          hint: "enter your phone number",
                          label: "phone number",
                          textEditingController: phone,
                          validate: (val) {
                            return val!.isEmpty ? "empty" : null;
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
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          minWidth: Res.width*0.7,
          height: Res.font*2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Res.padding),
              topLeft: Radius.circular(Res.padding),
            )
          ),
          color: AppColor.primaryColors,
          onPressed: () {
            if(key.currentState!.validate()) {
              addressBloc.add(AddAddressEvent(
                  addressPhone: int.parse(phone.text),
                  addressCity: city.text,
                  addressStreet: street.text,
                  addressDetails: details.text,
                  addressFloor: floor.text,
                addressDistance: widget.addressDistance,
              ));
            }
          },
          child: const Text(
            'Add address',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
