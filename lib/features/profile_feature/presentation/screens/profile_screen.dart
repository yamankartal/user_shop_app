import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/notifications_feature/presentation/screens/notifications_screen.dart';
import 'package:shopapp/features/profile_feature/presentation/bloc/profile_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../../../adress_feature/presentation/bloc/address_bloc.dart';
import '../../../adress_feature/presentation/screens/adress_screen.dart';
import '../../../coupons_feature/presentation/bloc/coupons_bloc.dart';
import '../../../coupons_feature/presentation/screens/coupons_screen.dart';
import '../../../notifications_feature/presentation/bloc/notifications_bloc.dart';
import '../../../orders_feature/presentation/screens/orders_archive_screen.dart';
import '../../../orders_feature/presentation/screens/orders_screen.dart';
import '../widgets/profile_list_tile_widget.dart';
import '../widgets/profile_sign_out_dialog_widget.dart';
import '../widgets/user_image_widget.dart';
import '../widgets/user_name_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController textEditingController = TextEditingController();

  late ProfileBloc profileBloc;

  @override
  void initState() {
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(GetUserDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: Res.font * 2.5),
        padding: EdgeInsets.symmetric(horizontal: Res.padding ),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (p, c) => p.getUserDataState != c.getUserDataState,
            builder: (_, state) {
              if (state.getUserDataState == States.loading) {
                return circularProgressIndicatorWidget();
              } else if (state.getUserDataState == States.loaded) {
                return BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (_, state) {
                    if (state.updateUserNameState == States.error) {
                      showSnackBar(context, state.errorMSg);
                    }
                  },
                  buildWhen: (p, c) =>
                      p.updateUserNameState != c.updateUserNameState ||
                      p.addUserImageState != c.addUserImageState ||
                      p.updateUserImageState != c.updateUserImageState ||
                      p.deleteImageState != c.deleteImageState,
                  builder: (_, state) {
                    if (state.updateUserNameState == States.loading ||
                        state.addUserImageState == States.loading ||
                        state.updateUserImageState == States.loading ||
                        state.deleteImageState == States.loading) {
                      return circularProgressIndicatorWidget();
                    }

                    return Column(
                      children: [
                        UserImageWidget(
                            profileBloc: profileBloc,
                            userModel: state.userModel),
                        UserNameWidget(
                            userModel: state.userModel,
                            profileBloc: profileBloc,
                            textEditingController: textEditingController),
                        ProfileListTileWidget(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                    create: (_) => sl<AddressBloc>(),
                                    child: const AddressScreen()),
                              ),
                            );
                          },
                          label: 'Address',
                        ),
                        ProfileListTileWidget(
                          onTap: () {
                            Navigator.of(context)
                                .push(
                              MaterialPageRoute(
                                builder: (_) => const OrdersScreen(),
                              ),
                            )
                                .then((value) {
                              screen = Screen.other;
                            });
                          },
                          label: 'Orders',
                        ),
                        ProfileListTileWidget(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const OrdersArchiveScreen(),
                              ),
                            );
                          },
                          label: 'Archive',
                        ),
                        ProfileListTileWidget(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => sl<CouponsBloc>(),
                                  child: const CouponScreen(),
                                ),
                              ),
                            );
                          },
                          label: 'Coupons',
                        ),
                        ProfileListTileWidget(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => sl<NotificationsBloc>(),
                                  child: const NotificationsScreen(),
                                ),
                              ),
                            );
                          },
                          label: 'Notifications',
                        ),
                        ListTile(
                          onTap: () {
                            launchUrl(Uri.parse('tel:+963968045022'));
                          },
                          trailing: Icon(Icons.arrow_forward,
                              color: AppColor.primaryColors,
                              size: Res.font * 1.5),
                          title: Text(
                            'Contact as',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => const ProfileSignOutWidget(),
                            );
                          },
                          trailing: Icon(Icons.arrow_forward,
                              color: AppColor.primaryColors,
                              size: Res.font * 1.5),
                          title: Text(
                            'Logout',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else if (state.getUserDataState == States.error) {
                return errorWidget(state.errorMSg);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
