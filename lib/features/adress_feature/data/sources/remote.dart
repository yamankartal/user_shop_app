import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/core/constants/constants.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/failures.dart';
import '../model/addressModel.dart';
import '../model/address_details_model.dart';
import '../model/shop_address_model.dart';

class AddressRemote{



  Future<AddressModel?> addAddress(Map<String, dynamic> data,int ?userId)async{
    try{
      final response=await http.post(Uri.parse(addAddressLink),body: data..addAll({'address_user_id':userId.toString()}));
      if(response.statusCode==200)
        {
          final res=jsonDecode(response.body);
          if(res['success']){
            final Map<String,dynamic> map=res['address'];
            return AddressModel.fromJson(map);
          }
          return null;
        }
        throw ServerFailure();


    }
        catch(e){
          rethrow;
        }
  }

  Future<bool> deleteAddresses(int ?id)async{
    try{
      final response=await http.post(Uri.parse(deleteAddressLink),body: {'address_id':id.toString()});
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res['success'];
      }
      throw ServerFailure();
    }
    catch(e){
      rethrow;
    }

  }


  Future<List<AddressModel>> getAddresses(int?userId)async{
     try{
       final response= await http.post(Uri.parse(getAddressesLink),body: {'address_user_id':userId.toString()});
       if(response.statusCode==200){
         final res=jsonDecode(response.body);
         if(res['success']){
           final List list=res['address'];
           return list.map((e) => AddressModel.fromJson(e)).toList();
         }
         return [];

       }

       throw ServerFailure();
     }
     catch(e){
       rethrow;
     }

  }

  Future<bool> updateAddresses(Map<String,dynamic>data,int addressId)async{

    try{

      final response=await http.post(Uri.parse(updateAddressLink),body: data..addAll({"address_id":addressId.toString()}));
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        return res['success'];
      }


      throw ServerFailure();
    }
        catch(e){
      rethrow;
        }

  }

  Future<Position> getPosition()async{
    try{
        final  Position position= await Geolocator.getCurrentPosition();
        return position;

    }
        catch(e){
      rethrow;
        }
  }


  Future<AddressDetailsModel?> getAddressDetails(int addressId)async{
    try{
      final response=await http.post(Uri.parse(getAddressDetailsLink),body: {"address_id":addressId.toString()});
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          print(0);
          final Map<String,dynamic> map=res['address_details'];
          return AddressDetailsModel.fromJson(map);
        }
        return null;

      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }

  }



  Future<double?>calculateAddressDistance(double lat, double long, double shopLat, double shopLong)async {



    String googleMapLink = "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$shopLat,$shopLong&key=$apiKey";

    print(googleMapLink);

    final response = await http.post(Uri.parse(googleMapLink));
    final res = jsonDecode(response.body);

    if (res['status'] == 'OK') {
      String distance= res['routes'][0]['legs'][0]['distance']['text'];
      print("###################################");
      print(res);
     final double distanceKm= double.parse(distance.split(" ")[0]);
      print(distance);
      return distanceKm;
    }
    return null;
  }

  Future<ShopAddressModel?>getShopAddress()async{
    try{
      final response=await http.post(Uri.parse(getShopAddressLink),);
      if(response.statusCode==200){
        final res=jsonDecode(response.body);
        if(res['success']){
          final Map<String,dynamic> map=res['shop_address'];
          return ShopAddressModel.fromJson(map);
        }
        return null;

      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }


}