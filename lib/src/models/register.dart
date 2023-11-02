class SignupRequest {
  late String? first_name;
  late String? last_name;
  late String? email;
  late String? password;

  SignupRequest({
    this.first_name,
    this.last_name,
    this.email,
    this.password,
  });

  SignupRequest.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password,
      };
}
