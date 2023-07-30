import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopapp/features/adress_feature/domain/use_case/get_addresses_case.dart';

import '../../../../core/constants/enums.dart';
import '../../data/model/addressModel.dart';
import '../../data/model/address_details_model.dart';
import '../../data/model/shop_address_model.dart';
import '../../domain/use_case/add_address_case.dart';
import '../../domain/use_case/calculate_address_distance_case.dart';
import '../../domain/use_case/delete_address_case.dart';
import '../../domain/use_case/get_address_details_case.dart';
import '../../domain/use_case/get_position_case.dart';
import '../../domain/use_case/get_shop_address_case.dart';
import '../../domain/use_case/update_address_case.dart';

part 'address_event.dart';

part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddAddressesCase addAddressesCase;
  final DeleteAddressesCase deleteAddressCase;
  final UpdateAddressesCase updateAddressCase;
  final GetAddressesCase getAddressesCase;
  final GetAddressDetailsCase getAddressDetailsCase;
  final GetPositionCase getPositionCase;
  final CalculateAddressDistanceCase calculateAddressDistanceCase;
  final GetShopAddressCase getShopAddressCase;

  AddressBloc(
      this.addAddressesCase,
      this.deleteAddressCase,
      this.updateAddressCase,
      this.getAddressesCase,
      this.getPositionCase,
      this.getAddressDetailsCase,
      this.getShopAddressCase, this.calculateAddressDistanceCase)
      : super(AddressState()) {
    on<AddAddressEvent>((event, emit) async {
      emit(state.copyWith(addAddressState: States.loading));
      final res = await addAddressesCase.call(ParamAddAddresses(
          addressPhone: event.addressPhone,
          addressLat: state.lat,
          addressLong: state.long,
          addressCity: event.addressCity,
          addressStreet: event.addressStreet,
          addressDetails: event.addressDetails,
          addressFloor: event.addressFloor,
        addressDistance: event.addressDistance,

      ));
      res.fold(
          (l) => emit(state.copyWith(addAddressState: States.error)),
          (r) => emit(state.copyWith(
              addAddressState: States.loaded,
              addresses: List.of(state.addresses)..add(r))));
    });

    on<UpdateAddressEvent>((event, emit) async {
      emit(state.copyWith(updateAddressState: States.loading));
      final res = await updateAddressCase.call(ParamUpdateAddresses(
        event.addressCity,
        event.addressStreet,
        event.addressDetails,
        event.addressFloor,
        event.addressId,
        event.addressPhone,
      ));
      res.fold((l) => emit(state.copyWith(updateAddressState: States.error)),
          (r) {
        state.addresses[event.index] = state.addresses[event.index].copyWith(
            addressCity: event.addressCity, addressStreet: event.addressStreet);
        emit(state.copyWith(updateAddressState: States.loaded));
      });
    });

    on<DeleteAddressEvent>((event, emit) async {
      emit(state.copyWith(deleteAddressState: States.loading));
      final res = await deleteAddressCase
          .call(ParamDeleteAddresses(state.addresses[event.index].addressId!));
      res.fold(
          (l) => emit(state.copyWith(deleteAddressState: States.error)),
          (r) => emit(state.copyWith(
              deleteAddressState: States.loaded,
              addresses: List.of(state.addresses)..removeAt(event.index))));
    });

    on<GetAddressesEvent>((event, emit) async {
      emit(state.copyWith(getAddressState: States.loading));
      final res = await getAddressesCase.call(ParamGetAddresses());
      res.fold(
          (l) => emit(state.copyWith(getAddressState: States.error)),
          (r) => emit(state.copyWith(
              getAddressState: States.loaded, addresses: List.of(r))));
    });

    on<GetAddressDetailsEvent>((event, emit) async {
      emit(state.copyWith(getAddressDetailsState: States.loading));
      final res = await getAddressDetailsCase
          .call(ParamGetAddressDetails(event.addressId));
      res.fold(
          (l) => emit(state.copyWith(getAddressDetailsState: States.error)),
          (r) => emit(state.copyWith(
              getAddressDetailsState: States.loaded, addressDetails: r)));
    });

    on<GetPositionEvent>((event, emit) async {
      emit(state.copyWith(getPositionState: States.loading));
      final res = await getPositionCase.call(ParamGetPosition());
      res.fold(
          (l) => emit(state.copyWith(getPositionState: States.error)),
          (r) => emit(state.copyWith(
              getPositionState: States.loaded,
              markers: List.of([]),
              position: r,
              lat: r.latitude,
              long: r.longitude)));
    });

    on<AddMarkerEvent>((event, emit) {
      if(state.markers.isNotEmpty){
        state.markers.removeWhere((element) => element.markerId.value=="1");
      }
      emit(state.copyWith(
          markers: List.of(
              [Marker(markerId: const MarkerId("1"), position: event.latLng)]),
          lat: event.latLng.latitude,
          long: event.latLng.longitude));
    });

    on<InitMarkersEvent>((event, emit) {
      emit(state.copyWith(markers: List.of([])));
    });

    on<GetShopAddressEvent>(
      (event, emit) async {
        emit(state.copyWith(getShopAddressState: States.loading));
        final res = await getShopAddressCase(ParamGetShopAddress());
        res.fold(
          (l) => emit(state.copyWith(getShopAddressState: States.error)),
          (r) => emit(
            state.copyWith(
                getShopAddressState: States.loaded, shopAddressModel: r),
          ),
        );
      },
    );

    on<GetAddressDistanceEvent>((event, emit) async{
      emit(state.copyWith(getAddressDistanceState: States.loading));
      final res =await calculateAddressDistanceCase(ParamCalculateAddressDistance(event.lat, event.long, event.shopLat, event.shopLong));
      res.fold((l) => emit(state.copyWith(getAddressDistanceState: States.error)), (r) => emit(state.copyWith(getAddressDistanceState: States.loaded,addressDistance: r)));
    });

  }
}
