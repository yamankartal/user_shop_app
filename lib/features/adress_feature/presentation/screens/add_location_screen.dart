import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopapp/core/constants/widgets.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../bloc/address_bloc.dart';
import 'add_address_screen.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({Key? key}) : super(key: key);

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  late AddressBloc addressBloc;

  @override
  void initState() {
    addressBloc = BlocProvider.of<AddressBloc>(context);
    addressBloc.add(GetPositionEvent());
    addressBloc.add(GetShopAddressEvent());
    print("init");
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColors,
        title: const Text(' Add Location'),
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (_, state) {
          if (state.getPositionState == States.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red.shade900,
              ),
            );
          } else if (state.getPositionState == States.loaded) {
            return  BlocBuilder<AddressBloc,AddressState>(
              buildWhen: (p,c)=>p.getShopAddressState!=c.getShopAddressState,
              builder: (_,state){
                if(state.getShopAddressState==States.loading){
                  return circularProgressIndicatorWidget();
                }
                else if(state.getShopAddressState==States.loaded){
                  return BlocBuilder<AddressBloc,AddressState>(
                      buildWhen: (p,c)=>p.markers!=c.markers,
                      builder: (_,state)=>BlocListener<AddressBloc,AddressState>(
                          listener: (_,state){
                            if(state.getAddressDistanceState==States.error){
                              showSnackBar(context, "dffdf");
                            }else if(state.getAddressDistanceState==States.loaded){
                               Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BlocProvider.value(
                                 value: addressBloc,
                                  child:  AddAddressScreen(addressDistance: state.addressDistance,),
                               )));
                            }
                          },
                          listenWhen: (p,c)=>p.getAddressDistanceState!=c.getAddressDistanceState,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GoogleMap(
                                markers: state.markers.toSet(),
                                onTap: (LatLng latLng) {
                                  addressBloc.add(AddMarkerEvent(latLng));
                                },
                                mapType: MapType.hybrid,
                                initialCameraPosition: CameraPosition(
                                    zoom: 12,
                                    target: LatLng(state.position!.latitude,state.position!.longitude)
                                ),
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                              ),
                              Positioned(
                                bottom: Res.tinyFont,
                                child: MaterialButton(
                                  height: Res.font * 1.2,
                                  minWidth: Res.width * 0.6,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(Res.font)),
                                  color: AppColor.primaryColors,
                                  onPressed: () {
                                    if (state.markers.isNotEmpty) {
                                      addressBloc.add(GetAddressDistanceEvent(state.position!.latitude,state.position!.longitude,state.shopAddressModel.shopLat!,state.shopAddressModel.shopLong!));
                                    }else{
                                      showSnackBar(context, "add marker to continue");
                                    }
                                  },
                                  child: Text(
                                    'continue',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: Res.font * 0.9),
                                  ),
                                ),
                              )
                            ],
                          )
                      ));

                }

                else if(state.getShopAddressState==States.error){
                  showSnackBar(context, "");
                }
                return Container();
              },);
          } else if (state.getPositionState == States.error) {
            return const Center(
              child: Text('error'),
            );
          }

          return Container();
        },
      ),
    );
  }
}
