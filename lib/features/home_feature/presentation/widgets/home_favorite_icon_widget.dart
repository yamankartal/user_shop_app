import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/responsive.dart';
import '../../../../injection.dart';
import '../../../notifications_feature/presentation/bloc/notifications_bloc.dart';
import '../../../notifications_feature/presentation/screens/notifications_screen.dart';
import '../../../products_feature/presentation/screens/favorite_screen.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Res.width * 0.19,
      height: Res.height * 0.088,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius:
          BorderRadius.circular(Res.padding * 0.5)),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider(
                  create: (_) => sl<ProductsBloc>(),
                  child: const FavoriteScreen())));
        },
        icon: Icon(Icons.favorite_border,
            size: Res.font * 1.2),
      ),
    );
  }
}
