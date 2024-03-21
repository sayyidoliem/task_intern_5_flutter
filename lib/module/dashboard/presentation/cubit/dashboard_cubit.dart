import 'package:task_intern_5_flutter/import.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(DashboardService dashboardService) : super(DashboardInitial());

  void onDashboardLoaded() async {
    emit(DashBoardLoading());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final result = await DashboardService().getArticle();
      emit(DashBoardSuccess(articleList: result));
    } catch (e) {
      emit(DashBoardError());
    }
  }
}
