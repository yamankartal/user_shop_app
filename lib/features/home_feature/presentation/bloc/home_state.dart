



part of 'home_bloc.dart';

class HomeState{

  final States getHomeDataState;
  final HomeModel homeModel;
  final int pageIndex;
  final String errorMsg;

  HomeState({this.getHomeDataState=States.init, this.homeModel=const HomeModel(), this.errorMsg='',this.pageIndex=0, });

  HomeState copyWith({
    final States? getHomeDataState,
    final HomeModel? homeModel,
    final int ?pageIndex,
    final String?errorMsg,

}){
    return HomeState(
        errorMsg: errorMsg??this.errorMsg,
      pageIndex: pageIndex??this.pageIndex,
      getHomeDataState: getHomeDataState??this.getHomeDataState,
      homeModel: homeModel??this.homeModel,


    );
  }

}