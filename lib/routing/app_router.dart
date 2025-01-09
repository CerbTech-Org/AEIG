import 'package:aeig/presentation/screen/admin_screen/acceptation_customer_object_loan.dart';
import 'package:aeig/presentation/screen/admin_screen/admin_inventory.dart';
import 'package:aeig/presentation/screen/admin_screen/admin_page.dart';
import 'package:aeig/presentation/screen/admin_screen/admin_request_of_customer.dart';
import 'package:aeig/presentation/screen/admin_screen/admin_setting.dart';
import 'package:aeig/presentation/screen/admin_screen/edit_inventory_form.dart';
import 'package:aeig/presentation/screen/admin_screen/inventory_form.dart';
import 'package:aeig/presentation/screen/admin_screen/return_customer_object_loan.dart';
import 'package:aeig/presentation/screen/student_screen/borrow_object.dart';
import 'package:aeig/presentation/screen/student_screen/customer_notification.dart';
import 'package:aeig/presentation/screen/student_screen/customer_request.dart';
import 'package:aeig/presentation/screen/student_screen/customer_setting.dart';
import 'package:aeig/presentation/screen/student_screen/return_object.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import '../presentation/screen/admin_screen/home_screen.dart';
import '../presentation/screen/auth_screen/auth_screen.dart';
import '../presentation/screen/auth_screen/login.dart';
import '../presentation/screen/auth_screen/reset_password.dart';
import '../presentation/screen/auth_screen/sign_up.dart';
import '../presentation/screen/student_screen/customer_page.dart';
import '../presentation/screen/student_screen/home_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AdminHomeRoute.page),
    AutoRoute(page: AdminRoute.page),
    AutoRoute(initial: true, page: ConnectionBetweenLoginAndSignUpRoute.page),
    AutoRoute(page: CustomerRoute.page),
    AutoRoute(page: PasswordResetRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: StudentHomeRoute.page),
    AutoRoute(page: BorrowObjectRoute.page),
    AutoRoute(page: CustomerSettingsRoute.page),
    AutoRoute(page: CustomerRequestRoute.page),
    AutoRoute(page: CustomerNotificationsRoute.page),
    AutoRoute(page: ReturnObjectRoute.page),
    AutoRoute(page: AcceptationCustomerObjectLoanRoute.page),
    AutoRoute(page: AdminInventoryRoute.page),
    AutoRoute(page: AdminRequestOfCustomerRoute.page),
    AutoRoute(page: AdminSettingRoute.page),
    AutoRoute(page: EditInventoryFormRoute.page),
    AutoRoute(page: InventoryFormRoute.page),
    AutoRoute(page: ReturnCustomerObjectLoanRoute.page)
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}