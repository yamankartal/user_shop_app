import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/enums.dart';
import '../../domain/use_case/get_current_location_case.dart';

part 'tracking_event.dart';

part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final GetCurrentLocationCase getCurrentLocationCase;
  late GoogleMapController googleMapController;

  TrackingBloc(this.getCurrentLocationCase, )
      : super(TrackingState()) {
    on<GetCurrentLocation>(
      (event, emit) async {
        emit(state.copyWith(getPositionState: States.loading));
        final res = await getCurrentLocationCase(ParamGetCurrentLocation());
        res.fold(
          (l) => emit(state.copyWith(getPositionState: States.error)),
          (r) => emit(
            state.copyWith(
              getPositionState: States.loaded,
              position: r,
              markers: List.of(state.markers)
                ..add(
                  Marker(
                    markerId: const MarkerId("user"),
                    position: LatLng(r.latitude, r.longitude),
                  ),
                ),
            ),
          ),
        );
      },
    );

    on<GoToCurrentLocationEvent>(
      (event, emit) {
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target:
                  LatLng(state.position!.latitude, state.position!.longitude),
            ),
          ),
        );
      },
    );

    on<RefreshDeliveryLocation>(
      (event, emit) {
        if (state.markers.isNotEmpty) {
          state.markers
              .removeWhere((element) => element.markerId.value == "delivery");
          emit(
            state.copyWith(
              markers: List.of(state.markers)
                ..add(
                  Marker(
                    markerId: const MarkerId("delivery"),
                    position: LatLng(event.dLat, event.dLong),
                  ),
                ),
            ),
          );
        }
      },
    );
  }
}
