import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/address_bloc.dart';
import '../widgets/address_item_widget.dart';
import 'add_location_screen.dart';

class AddressScreen extends StatefulWidget {
  final FromScreen fromScreen;

  const AddressScreen({Key? key, this.fromScreen = FromScreen.address})
      : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late AddressBloc addressBloc;

  @override
  void initState() {
    addressBloc = BlocProvider.of<AddressBloc>(context);
    addressBloc.add(GetAddressesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColors,
        title: const Text('address'),
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        buildWhen: (p, c) => p.getAddressState != c.getAddressState,
        builder: (_, state) {
          if (state.getAddressState == States.loading) {
            return circularProgressIndicatorWidget();
          } else if (state.getAddressState == States.loaded) {
            return BlocConsumer<AddressBloc, AddressState>(
                buildWhen: (p, c) =>
                    p.deleteAddressState != c.deleteAddressState ||
                    p.updateAddressState != c.updateAddressState ||
                    p.addAddressState != c.addAddressState,
                listenWhen: (p, c) =>
                    p.deleteAddressState != c.deleteAddressState,
                builder: (_, state) {
                  if (state.deleteAddressState == States.loading) {
                    return circularProgressIndicatorWidget();
                  }
                  return ListView.separated(
                      padding: EdgeInsets.all(Res.padding),
                      itemBuilder: (_, index) => SizedBox(
                          height: Res.height * 0.12,
                          child: AddressItemWidget(
                            fromScreen: widget.fromScreen,
                            index: index,
                            addressBloc: addressBloc,
                            addressModel: state.addresses[index],
                          )),
                      separatorBuilder: (_, index) => SizedBox(
                            height: Res.padding,
                          ),
                      itemCount: state.addresses.length);
                },
                listener: (_, state) {
                  if (state.deleteAddressState == States.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('connote delete')));
                  }
                });
          } else if (state.getAddressState == States.error) {
            return const Center(
              child: Text('error'),
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColors,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: addressBloc,
                child: const AddLocationScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
