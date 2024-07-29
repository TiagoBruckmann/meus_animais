final class EnvSettings {

  // HTTP CONFIGURATIONS
  final String baseUrl = const String.fromEnvironment('BASE_URL', defaultValue: "WITHOUT_BASE_URL");

  // ONESIGNAL CONFIGURATIONS
  final String onesignalAppId = const String.fromEnvironment('ONESIGNAL_APP_ID', defaultValue: "WITHOUT_ONESIGNAL_APP_ID");
  final String onesignalTemplateInfoData = const String.fromEnvironment('ONESIGNAL_TEMPLATE_INFO_DATA', defaultValue: "WITHOUT_ONESIGNAL_TEMPLATE_INFO_DATA");
  final String onesignalTemplateReapply = const String.fromEnvironment('ONESIGNAL_TEMPLATE_REAPPLY', defaultValue: "WITHOUT_ONESIGNAL_TEMPLATE_REAPPLY");

}