class Env {
  static const String baseUrl = 'https://api.spotify.com/v1';
  static const String clientId = '486a4c7e6e6a4ecdb4af03e0ed0efe3f';
  static const String clientSecret = 'd3feb2d3cd57419a969ed7ff012457c1';
  static const String redirectUri = 'com.example.llmapp://auth';
  static const String authorizeUrl = 'https://accounts.spotify.com/authorize';
  static const String tokenUrl = 'https://accounts.spotify.com/api/token';
  static const String scope = 'user-library-read playlist-read-private';

  static Map<String, dynamic> get baseHeader => {
        'accept': 'application/json',
        'content-type': 'application/x-www-form-urlencoded',
      };
}
