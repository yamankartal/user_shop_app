part of 'tracking_bloc.dart';

class TrackingState {
  final States getPositionState;
  final Position ?position;
  final List<Marker> markers;

  TrackingState(
      {this.getPositionState=States.init,
      this.position,
      this.markers=const[],

    });

  TrackingState copyWith({
    final States ?getPositionState,
    final Position ?position,
    final List<Marker> ?markers,

}){



    return TrackingState(
      getPositionState: getPositionState??this.getPositionState,
      position: position??this.position,
      markers: markers??this.markers,
    );

  }

}
