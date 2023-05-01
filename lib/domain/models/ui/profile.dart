class User {
  final int id;

  final String username;

  final String? email;

  final String? firstName;

  final String? lastName;

  final String dateJoined;

  final int? score;

  const User({
    required this.id,
    required this.username,
    this.email,
    this.score,
    this.firstName,
    this.lastName,
    required this.dateJoined,
  });
}
