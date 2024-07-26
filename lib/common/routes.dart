import 'package:go_router/go_router.dart';
import 'package:workeydockey/features/home/presentation/screens/home_screen.dart';
import 'package:workeydockey/features/schedule/presentation/screens/employee_select_screen.dart';
import 'package:workeydockey/features/schedule/presentation/screens/role_management_screen.dart';
import 'package:workeydockey/features/schedule/presentation/screens/schedules_add_screen.dart';
import 'package:workeydockey/features/schedule/presentation/screens/schedules_detail_screen.dart';
import 'package:workeydockey/features/schedule/presentation/screens/schedules_screen.dart';

enum AppRoute {
  login('/login'),
  home('/home'),
  schedules('/schedules'),
  workRecords('/work_records'),
  users('/users'),

  // 스케줄
  scheduleAdd('/schedule_add'),
  scheduleDetail('/schedule_detail'),
  scheduleUpdate('/schedule_update'),
  employeeSelect('/employee_select'),
  roleManagement('/role_management');

  const AppRoute(this.path);

  final String path;
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => AppRoute.home.path,
    ),
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoute.roleManagement.path,
      builder: (context, state) => const RoleManagementScreen(),
    ),
    GoRoute(
      path: AppRoute.schedules.path,
      builder: (context, state) => const SchedulesScreen(),
    ),

    GoRoute(
      path: AppRoute.scheduleAdd.path,
      builder: (context, state) => const SchedulesAddScreen(displayDate: ''),
    ),
    // GoRoute(
    //   path: AppRoute.scheduleUpdate.path,
    //   builder: (context, state) {
    //     final schedule = state.extra as Map<String, dynamic>;
    //     return SchedulesUpdateScreen(schedule: schedule);
    //   },
    // ),
    GoRoute(
      path: AppRoute.scheduleDetail.path,
      builder: (context, state) {
        final schedule = state.extra as Map<String, dynamic>;
        return SchedulesDetailScreen(schedule: schedule);
      },
    ),
    GoRoute(
      path: AppRoute.employeeSelect.path,
      builder: (context, state) => const EmployeeSelectScreen(),
    ),
    GoRoute(
      path: AppRoute.scheduleAdd.path,
      builder: (context, state) {
        final displayDate = state.extra as String; // String 타입으로 변환
        return SchedulesAddScreen(displayDate: displayDate); // displayDate 전달
      },
    ),
    // GoRoute(
    //   path: AppRoute.scheduleUpdate.path,
    //   builder: (context, state) {
    //     final schedule = state.extra as Map<String, dynamic>;
    //     return SchedulesUpdateScreen(schedule: schedule);
    //   },
    // ),
    GoRoute(
      path: AppRoute.scheduleDetail.path,
      builder: (context, state) {
        final schedule = state.extra as Map<String, dynamic>;
        return SchedulesDetailScreen(schedule: schedule);
      },
    ),
    GoRoute(
      path: AppRoute.employeeSelect.path,
      builder: (context, state) => const EmployeeSelectScreen(),
    ),
  ],
);
