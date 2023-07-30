import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/orders_feature/presentation/bloc/orders_bloc.dart';
import 'package:shopapp/features/tracking_feature/presentation/bloc/tracking_bloc.dart';
import 'core/app_feature/presentation/screens/initial_screen.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => sl<OrdersBloc>()),
    BlocProvider(create: (_) => sl<TrackingBloc>()),
  ], child: const InitialScreen()));
}
