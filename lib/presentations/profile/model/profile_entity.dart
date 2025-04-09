class ProfileEntity {
  int? empId;
  String? empName;
  String? email;
  String? notlp;
  String? address;
  String? joindate;
  String? companyname;
  List<String>? features;
  String? metodeApproval;
  int? siteid;
  String? sitename;
  String? divisiName;
  int? jabatanid;
  String? position;
  String? status;
  String? shift;
  int? companyid;
  String? username;
  String? npwp;
  String? nip;
  String? dob;
  String? gender;
  String? restrictLocation;
  String? bankName;
  String? bankAccountName;
  String? bankAccountNumber;
  String? bankBranch;
  String? latitude;
  String? longitude;
  List<Latlongs>? latlongs;
  AbsenceType? absenceType;
  RequestType? requestType;
  List<Assets>? assets;
  bool? announcementGranted;
  bool? gudangGranted;
  bool? transportGranted;
  bool? driverGranted;
  bool? technicianGranted;
  bool? testingGranted;
  bool? techDrawingGranted;
  bool? drawingGranted;
  bool? hseGranted;
  Operational? operational;
  Attendance? attendance;
  String? foto;

  ProfileEntity({
    this.empId,
    this.empName,
    this.email,
    this.notlp,
    this.address,
    this.joindate,
    this.companyname,
    this.features,
    this.metodeApproval,
    this.siteid,
    this.sitename,
    this.divisiName,
    this.jabatanid,
    this.position,
    this.status,
    this.shift,
    this.companyid,
    this.username,
    this.npwp,
    this.nip,
    this.dob,
    this.gender,
    this.restrictLocation,
    this.bankName,
    this.bankAccountName,
    this.bankAccountNumber,
    this.bankBranch,
    this.latitude,
    this.longitude,
    this.latlongs,
    this.absenceType,
    this.requestType,
    this.assets,
    this.announcementGranted,
    this.gudangGranted,
    this.transportGranted,
    this.driverGranted,
    this.technicianGranted,
    this.testingGranted,
    this.techDrawingGranted,
    this.drawingGranted,
    this.hseGranted,
    this.operational,
    this.attendance,
    this.foto,
  });

  ProfileEntity.fromJson(Map<String, dynamic> json) {
    empId = json['emp_id'];
    empName = json['emp_name'];
    email = json['email'];
    notlp = json['notlp'];
    address = json['address'];
    joindate = json['joindate'];
    companyname = json['companyname'];
    features = json['features'].cast<String>();
    metodeApproval = json['metode_approval'];
    siteid = json['siteid'];
    sitename = json['sitename'];
    divisiName = json['divisi_name'];
    jabatanid = json['jabatanid'];
    position = json['position'];
    status = json['status'];
    shift = json['shift'];
    companyid = json['companyid'];
    username = json['username'];
    npwp = json['npwp'];
    nip = json['nip'];
    dob = json['dob'];
    gender = json['gender'];
    restrictLocation = json['restrict_location'];
    bankName = json['bank_name'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    bankBranch = json['bank_branch'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['latlongs'] != null) {
      latlongs = <Latlongs>[];
      json['latlongs'].forEach((v) {
        latlongs!.add(new Latlongs.fromJson(v));
      });
    }
    absenceType = json['absence_type'] != null ? new AbsenceType.fromJson(json['absence_type']) : null;
    requestType = json['request_type'] != null ? new RequestType.fromJson(json['request_type']) : null;
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(new Assets.fromJson(v));
      });
    }
    announcementGranted = json['announcement_granted'];
    gudangGranted = json['gudang_granted'];
    transportGranted = json['transport_granted'];
    driverGranted = json['driver_granted'];
    technicianGranted = json['technician_granted'];
    testingGranted = json['testing_granted'];
    techDrawingGranted = json['tech_drawing_granted'];
    drawingGranted = json['drawing_granted'];
    hseGranted = json['hse_granted'];
    operational = json['operational'] != null ? new Operational.fromJson(json['operational']) : null;
    attendance = json['attendance'] != null ? new Attendance.fromJson(json['attendance']) : null;
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_id'] = this.empId;
    data['emp_name'] = this.empName;
    data['email'] = this.email;
    data['notlp'] = this.notlp;
    data['address'] = this.address;
    data['joindate'] = this.joindate;
    data['companyname'] = this.companyname;
    data['features'] = this.features;
    data['metode_approval'] = this.metodeApproval;
    data['siteid'] = this.siteid;
    data['sitename'] = this.sitename;
    data['divisi_name'] = this.divisiName;
    data['jabatanid'] = this.jabatanid;
    data['position'] = this.position;
    data['status'] = this.status;
    data['shift'] = this.shift;
    data['companyid'] = this.companyid;
    data['username'] = this.username;
    data['npwp'] = this.npwp;
    data['nip'] = this.nip;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['restrict_location'] = this.restrictLocation;
    data['bank_name'] = this.bankName;
    data['bank_account_name'] = this.bankAccountName;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_branch'] = this.bankBranch;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.latlongs != null) {
      data['latlongs'] = this.latlongs!.map((v) => v.toJson()).toList();
    }
    if (this.absenceType != null) {
      data['absence_type'] = this.absenceType!.toJson();
    }
    if (this.requestType != null) {
      data['request_type'] = this.requestType!.toJson();
    }
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    data['announcement_granted'] = this.announcementGranted;
    data['gudang_granted'] = this.gudangGranted;
    data['transport_granted'] = this.transportGranted;
    data['driver_granted'] = this.driverGranted;
    data['technician_granted'] = this.technicianGranted;
    data['testing_granted'] = this.testingGranted;
    data['tech_drawing_granted'] = this.techDrawingGranted;
    data['drawing_granted'] = this.drawingGranted;
    data['hse_granted'] = this.hseGranted;
    if (this.operational != null) {
      data['operational'] = this.operational!.toJson();
    }
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.toJson();
    }
    data['foto'] = this.foto;
    return data;
  }
}

class Attendance {
  String? checkinTime;
  String? checkoutTime;

  Attendance({this.checkinTime, this.checkoutTime});

  Attendance.fromJson(Map<String, dynamic> json) {
    checkinTime = json['checkin_time'];
    checkoutTime = json['checkout_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkin_time'] = this.checkinTime;
    data['checkout_time'] = this.checkoutTime;
    return data;
  }
}

class Latlongs {
  String? locationName;
  String? latitude;
  String? longitude;
  String? locationType;
  int? radius;

  Latlongs({this.locationName, this.latitude, this.longitude, this.locationType, this.radius});

  Latlongs.fromJson(Map<String, dynamic> json) {
    locationName = json['location_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    locationType = json['location_type'];
    radius = json['radius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_name'] = this.locationName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location_type'] = this.locationType;
    data['radius'] = this.radius;
    return data;
  }
}

class AbsenceType {
  String? sK;
  String? cT;
  String? iZ;

  AbsenceType({this.sK, this.cT, this.iZ});

  AbsenceType.fromJson(Map<String, dynamic> json) {
    sK = json['SK'];
    cT = json['CT'];
    iZ = json['IZ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SK'] = this.sK;
    data['CT'] = this.cT;
    data['IZ'] = this.iZ;
    return data;
  }
}

class RequestType {
  String? rOT;
  String? rIL;

  RequestType({this.rOT, this.rIL});

  RequestType.fromJson(Map<String, dynamic> json) {
    rOT = json['ROT'];
    rIL = json['RIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ROT'] = this.rOT;
    data['RIL'] = this.rIL;
    return data;
  }
}

class Assets {
  String? merk;
  String? tahunPembuatan;
  String? nomorSeri;
  String? keterangan;
  String? jenisAsset;

  Assets({this.merk, this.tahunPembuatan, this.nomorSeri, this.keterangan, this.jenisAsset});

  Assets.fromJson(Map<String, dynamic> json) {
    merk = json['merk'];
    tahunPembuatan = json['tahun_pembuatan'];
    nomorSeri = json['nomor_seri'];
    keterangan = json['keterangan'];
    jenisAsset = json['jenis_asset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merk'] = this.merk;
    data['tahun_pembuatan'] = this.tahunPembuatan;
    data['nomor_seri'] = this.nomorSeri;
    data['keterangan'] = this.keterangan;
    data['jenis_asset'] = this.jenisAsset;
    return data;
  }
}

class Operational {
  String? jamMasuk;
  String? jamPulang;
  String? toleransi;
  bool? overDate;
  bool? overTime;

  Operational({this.jamMasuk, this.jamPulang, this.toleransi, this.overDate, this.overTime});

  Operational.fromJson(Map<String, dynamic> json) {
    jamMasuk = json['jam_masuk'];
    jamPulang = json['jam_pulang'];
    toleransi = json['toleransi'];
    overDate = json['over_date'];
    overTime = json['over_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jam_masuk'] = this.jamMasuk;
    data['jam_pulang'] = this.jamPulang;
    data['toleransi'] = this.toleransi;
    data['over_date'] = this.overDate;
    data['over_time'] = this.overTime;
    return data;
  }
}
