class Data {
  String? idUser;
  String? username;
  String? email;

  Data({this.idUser, this.username, this.email});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUser: json['id_user'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id_user': idUser,
        'username': username,
        'email': email,
      };
}
