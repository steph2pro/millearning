class Environment {
  // Détermine l'environnement actuel (dev, prod, test, etc.)
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');

  // URL de base pour les API selon l'environnement
  static const String baseUrl = String.fromEnvironment(
    'base_url',
    defaultValue: 'https://randomuser.me/', // URL de l'API Random User Generator
  );
}
