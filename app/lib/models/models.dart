import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'account_model.dart';
import 'audit_model.dart';
import 'profile_model.dart';
import 'app_model.dart';
import 'user_model.dart';

final appModel = ChangeNotifierProvider<AppModel>((ref) => AppModel());
final accountModel =
    ChangeNotifierProvider<AccountModel>((ref) => AccountModel());
final profileModel =
    ChangeNotifierProvider<ProfileModel>((ref) => ProfileModel());
final auditModel = ChangeNotifierProvider<AuditModel>((ref) => AuditModel());
final userModel = ChangeNotifierProvider<UserModel>((ref) {
  return UserModel();
});
