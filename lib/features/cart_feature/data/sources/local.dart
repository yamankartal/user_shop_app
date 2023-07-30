import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/failures.dart';


class CartLocal {
  final SharedPreferences sharedPreferences;

  CartLocal(this.sharedPreferences);

  int? get userId {
    try {
      return sharedPreferences.getInt('userId');
    }
    catch (e) {
      throw CacheFailure();
    }
  }
}

