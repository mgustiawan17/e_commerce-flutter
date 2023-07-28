class DeleteCartResponse {
  int? rows;
  int? status;
  String? message;

  DeleteCartResponse({this.rows, this.status, this.message});

  factory DeleteCartResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCartResponse(
      rows: json['rows'] as int?,
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
