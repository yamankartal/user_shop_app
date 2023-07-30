import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopapp/core/constants/widgets.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/enums.dart';
import '../bloc/tracking_bloc.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  late TrackingBloc trackingBloc;

  @override
  void initState() {
    screen=Screen.tracking;
    trackingBloc = BlocProvider.of<TrackingBloc>(context);
    trackingBloc.add(GetCurrentLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
      ),
      body: BlocBuilder<TrackingBloc, TrackingState>(
        buildWhen: (p, c) => p.getPositionState != c.getPositionState,
        builder: (_, state) {
          if (state.getPositionState == States.loading) {
            return circularProgressIndicatorWidget();
          } else if (state.getPositionState == States.loaded) {
            return BlocBuilder<TrackingBloc, TrackingState>(
              buildWhen: (p, c) => p.markers != c.markers,
              builder: (_, state) => GoogleMap(
                onMapCreated: (GoogleMapController val) {
                  trackingBloc.googleMapController = val;
                },
                markers: state.markers.toSet(),
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        state.position!.latitude, state.position!.longitude),
                    zoom: 12),
              ),
            );
          } else if (state.getPositionState == States.error) {
            return errorWidget("");
          }
          return Container(color: Colors.red,);
        },
      ),
    );
  }
  @override
  void dispose() {

    super.dispose();
  }
}
