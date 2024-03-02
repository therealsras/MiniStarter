import 'package:flutter/material.dart' show BuildContext;

import '../helpers/helpers.dart';

extension Localization on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this);
}
