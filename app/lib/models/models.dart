import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'account_model.dart';
import 'audit_model.dart';
import 'profile_model.dart';
import 'app_model.dart';
import 'user_model.dart';

final appStateProvider = ChangeNotifierProvider<AppModel>((ref) => AppModel());
final accountProvider =
    ChangeNotifierProvider<AccountModel>((ref) => AccountModel());
final profileProvider =
    ChangeNotifierProvider<ProfileModel>((ref) => ProfileModel());
final auditProvider = ChangeNotifierProvider<AuditModel>((ref) => AuditModel());
final userProvider = ChangeNotifierProvider<UserModel>((ref) {
  return UserModel();
});
