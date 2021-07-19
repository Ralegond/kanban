class Account {
  String token;

  Account({required this.token});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      token: json['token'],
    );
  }
}
