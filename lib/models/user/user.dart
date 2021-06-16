class User {
  final String email;
  final String uid;
  final String displayName;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
  });

  factory User.empty() {
    return User(
      uid: '',
      email: '',
      displayName: '',
    );
  }

  User copyWith({String? uid, String? email, String? displayName}) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
    );
  }
}
