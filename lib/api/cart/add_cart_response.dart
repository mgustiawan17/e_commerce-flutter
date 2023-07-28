class AddCartResponse {
  bool? rows;
  int? status;
  String? message;

  AddCartResponse({this.rows, this.status, this.message});

  factory AddCartResponse.fromJson(Map<String, dynamic> json) {
    return AddCartResponse(
      rows: json['rows'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'rows': rows,
        'status': status,
        'message': message,
      };
}
