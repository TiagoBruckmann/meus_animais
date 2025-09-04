final class EnvSettings {

  // HTTP CONFIGURATIONS
  final String baseUrlEmail = const String.fromEnvironment('BASE_URL_EMAIL', defaultValue: "WITHOUT_BASE_URL_EMAIL");
  final String baseUrlNotifications = const String.fromEnvironment('BASE_URL_NOTIFICATION', defaultValue: "WITHOUT_BASE_URL_NOTIFICATION");

  // ONESIGNAL CONFIGURATIONS
  final String onesignalAppId = const String.fromEnvironment('ONESIGNAL_APP_ID', defaultValue: "WITHOUT_ONESIGNAL_APP_ID");
  final String onesignalTemplateInfoData = const String.fromEnvironment('ONESIGNAL_TEMPLATE_INFO_DATA', defaultValue: "WITHOUT_ONESIGNAL_TEMPLATE_INFO_DATA");
  final String onesignalTemplateReapply = const String.fromEnvironment('ONESIGNAL_TEMPLATE_REAPPLY', defaultValue: "WITHOUT_ONESIGNAL_TEMPLATE_REAPPLY");

  // CLIENT ACCESS
  final String clientName = const String.fromEnvironment('CLIENT_NAME', defaultValue: "WITHOUT_CLIENT_NAME");
  final String xApiKey = const String.fromEnvironment('X_API_KEY', defaultValue: "WITHOUT_X_API_KEY");

}