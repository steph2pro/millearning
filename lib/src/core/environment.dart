class Environment {
  // Détermine l'environnement actuel (dev, prod, test, etc.)
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');

  // URL de base pour les API selon l'environnement
  static const String baseUrl = String.fromEnvironment(
    'base_url',
    defaultValue: 'http://192.168.1.199:3333/api', // URL de l'API Random User Generator
  );
}
