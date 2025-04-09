class BaseRequest {
  int? offset;
  int? limit; //? Page
  String? filterMonth;
  List<int>? status;
  String? absenceType;

  BaseRequest({this.offset, this.limit, this.filterMonth, this.status, this.absenceType});

  BaseRequest.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    filterMonth = json['filter_month'];
    status = json['status'].cast<int>();
    absenceType = json['absence_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    data['filter_month'] = filterMonth;
    data['status'] = status;
    data['absence_type'] = absenceType;
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
