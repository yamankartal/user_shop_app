part of 'notifications_bloc.dart';

class NotificationsState {
  final States getNotificationsState;
  final List<NotificationModel> notifications;
  final String errorMsg;

  NotificationsState(
      {
        this.errorMsg="",
        this.getNotificationsState = States.init,
      this.notifications = const []});

  NotificationsState copyWith({
    final States? getNotificationsState,
    final List<NotificationModel>? notifications,
    final String? errorMsg,
  }){
    return NotificationsState(
      errorMsg: errorMsg??this.errorMsg,
      getNotificationsState: getNotificationsState??this.getNotificationsState,
      notifications: notifications??this.notifications,
    );
  }


}
