// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/app/core/services/env_settings.dart';
import 'package:meus_animais/app/core/services/notification.dart';
import 'package:meus_animais/app/core/services/shared.dart';

// imports globais
import 'package:meus_animais/domain/source/remote/performance.dart';
import 'package:meus_animais/domain/source/remote/app_events.dart';
import 'package:meus_animais/domain/source/local/app_logs.dart';
import 'package:meus_animais/domain/source/remote/crash.dart';
import 'package:meus_animais/domain/entities/user.dart';

class Session {
  static GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();

  static final NotificationsServices notifications = NotificationsServices();
  static final SharedServices sharedServices = SharedServices();
  static final Performance performance = Performance();
  static final AppEvents appEvents = AppEvents();
  static final EnvSettings env = EnvSettings();
  static UserEntity user = UserEntity.empty();
  static final AppLogs logs = AppLogs();
  static final Crash crash = Crash();

}