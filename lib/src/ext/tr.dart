import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension A on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
