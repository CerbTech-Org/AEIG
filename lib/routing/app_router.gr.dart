// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AcceptationCustomerObjectLoanScreen]
class AcceptationCustomerObjectLoanRoute extends PageRouteInfo<void> {
  const AcceptationCustomerObjectLoanRoute({List<PageRouteInfo>? children})
      : super(
          AcceptationCustomerObjectLoanRoute.name,
          initialChildren: children,
        );

  static const String name = 'AcceptationCustomerObjectLoanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AcceptationCustomerObjectLoanScreen();
    },
  );
}

/// generated route for
/// [AdminHomeScreen]
class AdminHomeRoute extends PageRouteInfo<void> {
  const AdminHomeRoute({List<PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminHomeScreen();
    },
  );
}

/// generated route for
/// [AdminInventoryScreen]
class AdminInventoryRoute extends PageRouteInfo<void> {
  const AdminInventoryRoute({List<PageRouteInfo>? children})
      : super(
          AdminInventoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInventoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminInventoryScreen();
    },
  );
}

/// generated route for
/// [AdminPage]
class AdminRoute extends PageRouteInfo<void> {
  const AdminRoute({List<PageRouteInfo>? children})
      : super(
          AdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminPage();
    },
  );
}

/// generated route for
/// [AdminRequestOfCustomerScreen]
class AdminRequestOfCustomerRoute extends PageRouteInfo<void> {
  const AdminRequestOfCustomerRoute({List<PageRouteInfo>? children})
      : super(
          AdminRequestOfCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRequestOfCustomerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminRequestOfCustomerScreen();
    },
  );
}

/// generated route for
/// [AdminSettingScreen]
class AdminSettingRoute extends PageRouteInfo<void> {
  const AdminSettingRoute({List<PageRouteInfo>? children})
      : super(
          AdminSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminSettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminSettingScreen();
    },
  );
}

/// generated route for
/// [BorrowObjectScreen]
class BorrowObjectRoute extends PageRouteInfo<void> {
  const BorrowObjectRoute({List<PageRouteInfo>? children})
      : super(
          BorrowObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'BorrowObjectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BorrowObjectScreen();
    },
  );
}

/// generated route for
/// [ConnectionBetweenLoginAndSignUpScreen]
class ConnectionBetweenLoginAndSignUpRoute extends PageRouteInfo<void> {
  const ConnectionBetweenLoginAndSignUpRoute({List<PageRouteInfo>? children})
      : super(
          ConnectionBetweenLoginAndSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectionBetweenLoginAndSignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ConnectionBetweenLoginAndSignUpScreen();
    },
  );
}

/// generated route for
/// [CustomerNotificationsScreen]
class CustomerNotificationsRoute extends PageRouteInfo<void> {
  const CustomerNotificationsRoute({List<PageRouteInfo>? children})
      : super(
          CustomerNotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerNotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerNotificationsScreen();
    },
  );
}

/// generated route for
/// [CustomerPage]
class CustomerRoute extends PageRouteInfo<void> {
  const CustomerRoute({List<PageRouteInfo>? children})
      : super(
          CustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerPage();
    },
  );
}

/// generated route for
/// [CustomerRequestScreen]
class CustomerRequestRoute extends PageRouteInfo<void> {
  const CustomerRequestRoute({List<PageRouteInfo>? children})
      : super(
          CustomerRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerRequestScreen();
    },
  );
}

/// generated route for
/// [CustomerSettingsScreen]
class CustomerSettingsRoute extends PageRouteInfo<void> {
  const CustomerSettingsRoute({List<PageRouteInfo>? children})
      : super(
          CustomerSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerSettingsScreen();
    },
  );
}

/// generated route for
/// [EditInventoryFormScreen]
class EditInventoryFormRoute extends PageRouteInfo<EditInventoryFormRouteArgs> {
  EditInventoryFormRoute({
    Key? key,
    required Map<String, dynamic> item,
    List<PageRouteInfo>? children,
  }) : super(
          EditInventoryFormRoute.name,
          args: EditInventoryFormRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'EditInventoryFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditInventoryFormRouteArgs>();
      return EditInventoryFormScreen(
        key: args.key,
        item: args.item,
      );
    },
  );
}

class EditInventoryFormRouteArgs {
  const EditInventoryFormRouteArgs({
    this.key,
    required this.item,
  });

  final Key? key;

  final Map<String, dynamic> item;

  @override
  String toString() {
    return 'EditInventoryFormRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [InventoryFormScreen]
class InventoryFormRoute extends PageRouteInfo<InventoryFormRouteArgs> {
  InventoryFormRoute({
    Key? key,
    Map<String, dynamic>? item,
    List<PageRouteInfo>? children,
  }) : super(
          InventoryFormRoute.name,
          args: InventoryFormRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'InventoryFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InventoryFormRouteArgs>(
          orElse: () => const InventoryFormRouteArgs());
      return InventoryFormScreen(
        key: args.key,
        item: args.item,
      );
    },
  );
}

class InventoryFormRouteArgs {
  const InventoryFormRouteArgs({
    this.key,
    this.item,
  });

  final Key? key;

  final Map<String, dynamic>? item;

  @override
  String toString() {
    return 'InventoryFormRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [PasswordResetPage]
class PasswordResetRoute extends PageRouteInfo<void> {
  const PasswordResetRoute({List<PageRouteInfo>? children})
      : super(
          PasswordResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordResetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PasswordResetPage();
    },
  );
}

/// generated route for
/// [ReturnCustomerObjectLoanScreen]
class ReturnCustomerObjectLoanRoute extends PageRouteInfo<void> {
  const ReturnCustomerObjectLoanRoute({List<PageRouteInfo>? children})
      : super(
          ReturnCustomerObjectLoanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnCustomerObjectLoanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReturnCustomerObjectLoanScreen();
    },
  );
}

/// generated route for
/// [ReturnObjectScreen]
class ReturnObjectRoute extends PageRouteInfo<void> {
  const ReturnObjectRoute({List<PageRouteInfo>? children})
      : super(
          ReturnObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnObjectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReturnObjectScreen();
    },
  );
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInScreen();
    },
  );
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpScreen();
    },
  );
}

/// generated route for
/// [StudentHomeScreen]
class StudentHomeRoute extends PageRouteInfo<void> {
  const StudentHomeRoute({List<PageRouteInfo>? children})
      : super(
          StudentHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StudentHomeScreen();
    },
  );
}
