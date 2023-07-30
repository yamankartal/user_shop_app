import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/cart_feature/presentation/bloc/cart_bloc.dart';
import 'package:shopapp/features/cart_feature/presentation/screens/cart_screen.dart';

import '../../features/categories_feature/presentation/bloc/categories_bloc.dart';
import '../../features/categories_feature/presentation/screens/categories_screen.dart';
import '../../features/home_feature/presentation/bloc/home_bloc.dart';
import '../../features/home_feature/presentation/screens/home_screen.dart';
import '../../features/products_feature/presentation/bloc/products_bloc.dart';
import '../../features/products_feature/presentation/screens/favorite_screen.dart';
import '../../features/profile_feature/presentation/bloc/profile_bloc.dart';
import '../../features/profile_feature/presentation/screens/profile_screen.dart';
import '../../injection.dart';

List pagesList = [
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => sl<ProductsBloc>(),
      ),
      BlocProvider(
        create: (_) => sl<HomeBloc>(),
      ),
    ],
    child: const HomeScreen(),
  ),
  BlocProvider(
      create: (_) => sl<CategoriesBloc>(), child: const CategoriesScreen()),
  BlocProvider(
      create: (_) => sl<CartBloc>(), child: const CartScreen()),
  BlocProvider(create: (_) => sl<ProfileBloc>(), child: const ProfileScreen()),
];
