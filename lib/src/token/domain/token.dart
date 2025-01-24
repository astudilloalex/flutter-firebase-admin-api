class Token {
  const Token({
    required this.token,
    required this.expirationDate,
  });

  final String token;
  final DateTime expirationDate;

  Token copyWith({
    String? token,
    DateTime? expirationDate,
  }) {
    return Token(
      token: token ?? this.token,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }
}
