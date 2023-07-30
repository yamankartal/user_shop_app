import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/notifications_feature/presentation/bloc/notifications_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/widgets.dart';
import '../widgets/notification_item_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late NotificationsBloc notificationsBloc;

  @override
  void initState() {
    notificationsBloc = BlocProvider.of<NotificationsBloc>(context);
    notificationsBloc.add(GetNotificationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColors,
        title: const Text('Notifications'),
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        buildWhen: (p, c) => p.getNotificationsState != c.getNotificationsState,
        builder: (_, state) {
          if (state.getNotificationsState == States.loading) {
            return circularProgressIndicatorWidget();
          } else if (state.getNotificationsState == States.loaded) {
            return ListView.separated(
                padding: EdgeInsets.all(Res.padding),
                itemBuilder: (_, index) => NotificationItemWidget(
                    notificationModel: state.notifications[index]),
                separatorBuilder: (_, index) => SizedBox(
                      height: Res.padding,
                    ),
                itemCount: state.notifications.length);
          } else if (state.getNotificationsState == States.error) {
            return errorWidget(state.errorMsg);
          }

          return Container();
        },
      ),
    );
  }
}
