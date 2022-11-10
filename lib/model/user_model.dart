class User {
  final String uid;
  final String email;
  final String username;
  final String? role;
  final String? phone;
  final String? address;
  double? coin;

  User(
      {required this.uid,
      required this.email,
      required this.username,
      this.role,
      this.phone,
      this.address,
      this.coin});

  User.fromMap({required Map<String, dynamic> userMap})
      : uid = userMap['uid'],
        email = userMap['email'],
        username = userMap['username'],
        role = userMap['role'],
        phone = userMap['phone'],
        address = userMap['address'],
        coin = userMap['coin'];

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'email': email,
        'username': username,
        'role': role ?? '',
        'phone': phone ?? '',
        'address': address ?? '',
        'coin': coin ?? 0
      };
}
