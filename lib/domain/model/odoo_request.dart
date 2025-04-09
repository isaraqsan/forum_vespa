import 'package:vespa_app/core/util/core_function.dart';

class OdooRequest {
  String? model;
  String? method;
  List<dynamic>? args;
  Kwargs? kwargs;

  OdooRequest({this.model, this.method, this.args, this.kwargs});

  OdooRequest.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    method = json['method'];
    args = json['args'].cast<String>();
    kwargs = json['kwargs'] != null ? new Kwargs.fromJson(json['kwargs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['method'] = this.method;
    if (this.args != null) {
      data['args'] = this.args;
    } else {
      data['args'] = [];
    }
    if (this.kwargs != null) {
      data['kwargs'] = this.kwargs!.toJson();
    } else {
      data['kwargs'] = {};
    }
    CoreFunction.logPrint("Odoo Request", data.toString());
    return data;
  }
}

class Kwargs {
  Context? context;
  Map<String, dynamic>? custom;
  List<List<dynamic>>? domain;
  List<String>? fields;

  Kwargs({this.context, this.domain, this.fields, this.custom});

  Kwargs.fromJson(Map<String, dynamic> json) {
    context = json['context'] != null ? new Context.fromJson(json['context']) : null;
    if (json['domain'] != null) {
      domain = List<List<String>>.from(json["domain"].map((x) => List<String>.from(x.map((x) => x))));
    }
    fields = json['fields'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.context != null) {
      data['context'] = this.context!.toJson();
    }
    if (this.domain != null) {
      data['domain'] = List<dynamic>.from(this.domain!.map((x) => List<dynamic>.from(x.map((x) => x))));
    }
    data['fields'] = this.fields;
    if (this.custom != null) {
      this.custom!.forEach((key, value) {
        data['$key'] = value;
      });
    }
    data.removeWhere((key, value) => value == null);
    return data;
  }
}

class Context {
  bool? binSize;

  Context({this.binSize});

  Context.fromJson(Map<String, dynamic> json) {
    binSize = json['bin_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bin_size'] = this.binSize;
    return data;
  }
}
