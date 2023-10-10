class userModel {
  String? firstName;
  String? lastName;
  String? email;
  String? usertype;

  userModel();

  userModel.fromJson(Map<String, dynamic> json) {
    firstName = json['First name'];
    lastName = json['Last name'];
    email = json['First name'];
    firstName = json['Email'];
    usertype = json['User type'];
  }
}
