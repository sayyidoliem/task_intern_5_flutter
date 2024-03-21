part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashBoardLoading extends DashboardState {}

final class DashBoardSuccess extends DashboardState {
  final List<DashBoard> articleList;

  DashBoardSuccess({required this.articleList});
}

final class DashBoardError extends DashboardState {}
