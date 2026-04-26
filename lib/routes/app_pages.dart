import 'package:get/get.dart';
import '../modules/auth/login_view.dart';
import '../modules/employee/employee_list_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/login',
      page: () => LoginView(),
    ),
    GetPage(
      name: '/employees',
      page: () => EmployeeListView(),
    ),
  ];
}
