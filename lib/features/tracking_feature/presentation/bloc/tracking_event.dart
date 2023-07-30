part of'tracking_bloc.dart';

abstract class TrackingEvent{}

class GetCurrentLocation extends TrackingEvent{}

class GoToCurrentLocationEvent extends TrackingEvent{}

class RefreshDeliveryLocation extends TrackingEvent{
  final double dLat;
  final double dLong;
  RefreshDeliveryLocation(this.dLat, this.dLong);
}