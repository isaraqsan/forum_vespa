class Splashscreen {
  int? id;
  String? namaKerjasama;
  String? keterangan;
  int? status;
  String? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;

  Splashscreen({
    this.id,
    this.namaKerjasama,
    this.keterangan,
    this.status,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
  });

  Splashscreen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKerjasama = json['nama_kerjasama'];
    keterangan = json['keterangan'];
    status = json['status'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    modifiedBy = json['modified_by'];
    modifiedDate = json['modified_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['nama_kerjasama'] = namaKerjasama;
    data['keterangan'] = keterangan;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['modified_by'] = modifiedBy;
    data['modified_date'] = modifiedDate;
    return data;
  }
}
