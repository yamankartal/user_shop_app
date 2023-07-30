
import 'package:geolocator/geolocator.dart';
import 'package:shopapp/core/constants/failures.dart';
class TrackingRemote{


  Future<Position>getCurrentLocation()async{
    try{
      final Position position= await Geolocator.getCurrentPosition();
      return position;
    }
        catch(e){
      throw ServerFailure();
        }
  }





}