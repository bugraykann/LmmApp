class SpotifyToken {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  SpotifyToken({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });
  factory SpotifyToken.fromJson(Map<String, dynamic> json) {
    return SpotifyToken(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
    );
  }
}
