class Environment {
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');

  static const String baseUrl = String.fromEnvironment(
    'base_url',
    defaultValue: 'http://192.168.1.154:62610/api',
  );
}
