class user {
  final String firstName;
  final String lastName;
  final String email;
  final String usertype;
  final String ProfileImage;

  user({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.usertype,
    required this.ProfileImage,
  });

  String get _firstName => firstName;

  String get _lastName => lastName;

  String get _email => email;

  String get _usertype => usertype;

  String get _Profileimage => ProfileImage;
}
