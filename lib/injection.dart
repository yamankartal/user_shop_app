import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/features/adress_feature/domain/repository/repository.dart';
import 'package:shopapp/features/adress_feature/domain/use_case/add_address_case.dart';
import 'package:shopapp/features/auth_feature/data/sources/local.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/check_email_case.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/is_sign_in_case.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/reset_password_case.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/sign_in_case.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/sign_up_case.dart';
import 'package:shopapp/features/auth_feature/domain/use_case/verify_code_case.dart';
import 'package:shopapp/features/cart_feature/data/repository/repository.dart';
import 'package:shopapp/features/cart_feature/data/sources/local.dart';
import 'package:shopapp/features/cart_feature/data/sources/remote.dart';
import 'package:shopapp/features/cart_feature/domain/repository/repository.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/add_to_cart_case.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/discount_from_cart_case.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/get_cart_case.dart';
import 'package:shopapp/features/cart_feature/domain/use_case/remove_from_cart_case.dart';
import 'package:shopapp/features/cart_feature/presentation/bloc/cart_bloc.dart';
import 'package:shopapp/features/coupons_feature/data/repository/repository.dart';
import 'package:shopapp/features/home_feature/data/repository/repository.dart';
import 'package:shopapp/features/home_feature/data/sources/remote.dart';
import 'package:shopapp/features/home_feature/domain/use_case/get_all_data_case.dart';
import 'package:shopapp/features/home_feature/presentation/bloc/home_bloc.dart';
import 'package:shopapp/features/home_page_feature/presentation/bloc/home_page_bloc.dart';
import 'package:shopapp/features/notifications_feature/domain/repository/repository.dart';
import 'package:shopapp/features/products_feature/domain/repository/repository.dart';
import 'package:shopapp/features/profile_feature/domain/repository/repository.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/add_user_image_case.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/delete_image_case.dart';
import 'package:shopapp/features/profile_feature/domain/use_case/update_user_image_case.dart';
import 'package:shopapp/features/profile_feature/presentation/bloc/profile_bloc.dart';
import 'package:shopapp/features/tracking_feature/domain/repository/repository.dart';
import 'package:shopapp/features/tracking_feature/presentation/bloc/tracking_bloc.dart';
import 'core/constants/fire_base.dart';
import 'features/adress_feature/data/repository/repository.dart';
import 'features/adress_feature/data/sources/remote.dart';
import 'features/adress_feature/domain/use_case/calculate_address_distance_case.dart';
import 'features/adress_feature/domain/use_case/delete_address_case.dart';
import 'features/adress_feature/domain/use_case/get_address_details_case.dart';
import 'features/adress_feature/domain/use_case/get_addresses_case.dart';
import 'features/adress_feature/domain/use_case/get_position_case.dart';
import 'features/adress_feature/domain/use_case/get_shop_address_case.dart';
import 'features/adress_feature/domain/use_case/update_address_case.dart';
import 'features/adress_feature/presentation/bloc/address_bloc.dart';
import 'features/auth_feature/data/repository/repository.dart';
import 'features/auth_feature/data/sources/remote.dart';
import 'features/auth_feature/domain/repository/repository.dart';
import 'features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'features/cart_feature/domain/use_case/update_cart_case.dart';
import 'features/categories_feature/data/repository/repository.dart';
import 'features/categories_feature/data/sources/remote.dart';
import 'features/categories_feature/domain/repository/repository.dart';
import 'features/categories_feature/domain/use_case/get_categoies_case.dart';
import 'features/categories_feature/domain/use_case/search_categories_case.dart';
import 'features/categories_feature/presentation/bloc/categories_bloc.dart';
import 'features/checkout_feature/domain/use_case/checkOutOrderCase.dart';
import 'features/checkout_feature/presentation/bloc/checkout_bloc.dart';
import 'features/checkout_feature/data/repository/repository.dart';
import 'features/checkout_feature/data/sources/remote.dart';
import 'features/checkout_feature/domain/repository/repository.dart';
import 'features/checkout_feature/domain/use_case/check_coupon_case.dart';
import 'features/checkout_feature/domain/use_case/send_order_case.dart';
import 'features/coupons_feature/data/sources/remote.dart';
import 'features/coupons_feature/domain/repository/repository.dart';
import 'features/coupons_feature/domain/use_case/get_coupons_case.dart';
import 'features/coupons_feature/presentation/bloc/coupons_bloc.dart';
import 'features/home_feature/domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'features/notifications_feature/data/repository/repository.dart';
import 'features/notifications_feature/data/sources/remote.dart';
import 'features/notifications_feature/domain/use_case/get_notifications_case.dart';
import 'features/notifications_feature/presentation/bloc/notifications_bloc.dart';
import 'features/orders_feature/data/repository/repository.dart';
import 'features/orders_feature/data/sources/remote.dart';
import 'features/orders_feature/domain/repository/repository.dart';
import 'features/orders_feature/domain/use_case/delete_order_case.dart';
import 'features/orders_feature/domain/use_case/get_archived_orders.dart';
import 'features/orders_feature/domain/use_case/get_order_details_case.dart';
import 'features/orders_feature/domain/use_case/get_orders_case.dart';
import 'features/orders_feature/domain/use_case/get_position_case.dart';
import 'features/orders_feature/domain/use_case/rate_order_case.dart';
import 'features/orders_feature/presentation/bloc/orders_bloc.dart';
import 'features/products_feature/data/repository/repository.dart';
import 'features/products_feature/data/sources/remote.dart';
import 'features/products_feature/domain/use_case/add_product_to_favorite_case.dart';
import 'features/products_feature/domain/use_case/get_favorite_produts.dart';
import 'features/products_feature/domain/use_case/get_product_details_case.dart';
import 'features/products_feature/domain/use_case/get_products_case.dart';
import 'features/products_feature/domain/use_case/remove_product_from_favorite.dart';
import 'features/products_feature/domain/use_case/search_product.dart';
import 'features/products_feature/presentation/bloc/products_bloc.dart';
import 'features/profile_feature/data/repository/repopsitory.dart';
import 'features/profile_feature/data/sources/remote.dart';
import 'features/profile_feature/domain/use_case/get_user_data.dart';
import 'features/profile_feature/domain/use_case/update_user_case.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/tracking_feature/data/repository/repository.dart';
import 'features/tracking_feature/data/sources/remote.dart';
import 'features/tracking_feature/domain/use_case/get_current_location_case.dart';


final  sl=GetIt.instance;
late final SharedPreferences sharedPreferences;
final InternetConnectionChecker internetConnectionChecker=InternetConnectionChecker();

Future<void>init()async{
  await  Geolocator.requestPermission();
  await Firebase.initializeApp();
  await initFireBaseMessaging();
  FirebaseMessaging.instance.subscribeToTopic("users1");

   sharedPreferences=await SharedPreferences.getInstance();
  //  sharedPreferences.clear();
  // // sharedPreferences.setInt('id', 1);
  // // FirebaseMessaging.instance.subscribeToTopic("users");
  // // FirebaseMessaging.instance.subscribeToTopic("users1");
   initHomePageFeature();

   initAuthFeature();

   initHomeFeature();

   initProductsFeature();

   initCartFeature();

   initAddressFeature();

   initCheckOutFeature();

   initCategoriesFeature();

   initProfileFeature();

   initCouponsFeature();

   initOrdersFeature();

   initNotificationsFeature();

   initTrackingFeature();

}



 initAuthFeature(){


  sl.registerFactory(() => AuthBloc(sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call()));

  sl.registerLazySingleton(() => CaseSignIn(sl.call()));
  sl.registerLazySingleton(() => CaseSignUp(sl.call()));
  sl.registerLazySingleton(() => CheckEmailCase(sl.call()));
  sl.registerLazySingleton(() => CaseVerifyCode(sl.call()));
  sl.registerLazySingleton(() => IsSignInCase(sl.call()));
  sl.registerLazySingleton(() => ResetPasswordCase(sl.call()));


  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(sl.call(),internetConnectionChecker,sl.call()));

  sl.registerLazySingleton(() => AuthRemote());
  sl.registerLazySingleton(() => AuthLocal(sharedPreferences));


}

 initHomePageFeature(){
  sl.registerFactory(() => HomePageBloc());
 }

 initHomeFeature(){
   sl.registerFactory(() => HomeBloc(sl.call()));

   sl.registerLazySingleton(() => GetAllDataCase(sl.call()));

   sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(sl.call(),internetConnectionChecker,sl.call()));

   sl.registerLazySingleton(() => HomeRemote());
 }

 initProductsFeature(){

   sl.registerFactory(() => ProductsBloc(sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call()));

   sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImp(sl.call(),internetConnectionChecker,sl.call()));

   sl.registerLazySingleton(() => AddProductToFavoriteCase(sl.call()));
   sl.registerLazySingleton(() => GetFavoriteProductsCase(sl.call()));
   sl.registerLazySingleton(() => GetProductsCase(sl.call()));
   sl.registerLazySingleton(() => GetProductDetailsCase(sl.call()));
   sl.registerLazySingleton(() => SearchProductsCase(sl.call()));
   sl.registerLazySingleton(() =>RemoveFromFavoriteCase(sl.call()));

   sl.registerLazySingleton(() => ProductsRemote());

 }

 initCartFeature(){

   sl.registerFactory(() => CartBloc(sl.call(), sl.call(), sl.call(), sl.call(), sl.call()));

   sl.registerLazySingleton(() => AddToCartCase(sl.call()));
   sl.registerLazySingleton(() => RemoveFromCartCase(sl.call()));
   sl.registerLazySingleton(() => UpdateCartCase(sl.call()));
   sl.registerLazySingleton(() => GetCartCase(sl.call()));
   sl.registerLazySingleton(() => DiscountFromCartCase(sl.call()));


   sl.registerLazySingleton<CartRepository>(() => CartRepositoryImp(sl.call(), sl.call()));

   sl.registerLazySingleton(() => CartLocal(sharedPreferences));
   sl.registerLazySingleton(() => CartRemote());


 }

 initAddressFeature(){

   sl.registerFactory(() =>AddressBloc(sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call()));

   sl.registerLazySingleton(() => AddAddressesCase(sl.call()));
   sl.registerLazySingleton(() => DeleteAddressesCase(sl.call()));
   sl.registerLazySingleton(() => UpdateAddressesCase(sl.call()));
   sl.registerLazySingleton(() => GetAddressesCase(sl.call()));
   sl.registerLazySingleton(() => GetAddressDetailsCase(sl.call()));
   sl.registerLazySingleton(() => GetPositionCase(sl.call()));
   sl.registerLazySingleton(() => GetShopAddressCase(sl.call()));
   sl.registerLazySingleton(() => CalculateAddressDistanceCase(sl.call()));

   sl.registerLazySingleton<AddressRepository>(() => AddressRepositoryImp(sl.call(),sl.call(),internetConnectionChecker));

   sl.registerLazySingleton(() =>AddressRemote());
 }

 initCheckOutFeature(){
   sl.registerFactory(() => CheckOutBloc(sl.call(),sl.call(),sl.call()));

   sl.registerLazySingleton(() => CheckCouponCase(sl.call()));
   sl.registerLazySingleton(() => SendOrderCase(sl.call()));
   sl.registerLazySingleton(() => CheckOutOrderCase(sl.call()));

   sl.registerLazySingleton<CheckOutRepository>(() =>CheckOutRepositoryImp(sl.call(),sl.call()));

   sl.registerLazySingleton(() => CheckOutRemote());

 }

 initOrdersFeature(){
   sl.registerFactory(() => OrdersBloc(sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call()));

   sl.registerLazySingleton(() => GetOrdersCase(sl.call()));
   sl.registerLazySingleton(() => GetOrderDetailsCase(sl.call()));
   sl.registerLazySingleton(() => DeleteOrderCase(sl.call()));
   sl.registerLazySingleton(() => GetArchivedOrdersCase(sl.call()));
   sl.registerLazySingleton(() => RateOrderCase(sl.call()));
   sl.registerLazySingleton(() => GetCurPositionCase(sl.call()));


   sl.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImp(sl.call(),sl.call()));

   sl.registerLazySingleton(() => OrdersRemote());


 }

 initCategoriesFeature(){

  sl.registerFactory(() => CategoriesBloc(sl.call(),sl.call()));

  sl.registerLazySingleton(() => GetCategoriesCase(sl.call()));
  sl.registerLazySingleton(() => SearchCategoriesCase(sl.call()));

  sl.registerLazySingleton<CategoriesRepository>(() => CategoriesRepositoryImp(sl.call()));

  sl.registerLazySingleton(() => CategoriesRemote());
 }

 initProfileFeature(){

  sl.registerFactory(() => ProfileBloc(sl.call(), sl.call(),sl.call(),sl.call(),sl.call(),));

  sl.registerLazySingleton(() => GetUserDataCase(sl.call()));
  sl.registerLazySingleton(() => UpdateUserNameCase(sl.call()));
  sl.registerLazySingleton(() => AddUserImageCase(sl.call()));
  sl.registerLazySingleton(() => UpdateUserImageCase(sl.call()));
  sl.registerLazySingleton(() => DeleteImageCase(sl.call()));

  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImp(sl.call(),sl.call()));

  sl.registerLazySingleton(() => ProfileRemote());



 }

 initCouponsFeature(){

  sl.registerFactory(() => CouponsBloc(sl.call()));

  sl.registerLazySingleton(() => GetCouponsCase(sl.call()));

  sl.registerLazySingleton<CouponsRepository>(() => CouponsRepositoryImp(internetConnectionChecker,sl.call()));

  sl.registerLazySingleton(() => CouponsRemote());


 }

 initNotificationsFeature(){

  sl.registerFactory(() => NotificationsBloc(sl.call()));

  sl.registerLazySingleton(() => GetNotificationsCase(sl.call()));

  sl.registerLazySingleton<NotificationsRepository>(() => NotificationsRepositoryImp(sl.call(),sl.call()));

  sl.registerLazySingleton(() => NotificationsRemote());


 }

 initTrackingFeature(){
  sl.registerFactory(() => TrackingBloc(sl.call(),));

  sl.registerLazySingleton(() => GetCurrentLocationCase(sl.call()));

  sl.registerLazySingleton<TrackingRepository>(() => TrackingRepositoryImp(sl.call(),internetConnectionChecker));

  sl.registerLazySingleton(() => TrackingRemote());
 }


