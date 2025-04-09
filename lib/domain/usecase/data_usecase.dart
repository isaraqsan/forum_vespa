import 'package:vespa_app/core/app/enum.dart';

class DataUsecase {
  static Status statusNumber(String? value) {
    switch (value) {
      case "5":
      case "Complete":
      case "Cancel":
      case "Kembali Sebagian":
        return Status.Complete;
      case "0":
      case "1":
      case "Pengajuan":
        return Status.Waiting;
      case "2":
        return Status.Rejected;
      case "3":
        return Status.Approved;
      case "Serah Terima":
      case "Serah Terima Kembali":
      case "Terima":
      case "Terima Kembali":
        return Status.HandOver;
      case "4":
      case "Expired":
        return Status.Expired;
      default:
        return Status.Waiting;
    }
  }

  static Status status(String? value) {
    switch (value) {
      case "Completed":
      case "Complete":
      case "Cancel":
      case "Kembali Sebagian":
      case "7":
        return Status.Complete;
      case "Waiting":
      case "Need Aprove":
      case "Pengajuan":
      case "0":
        return Status.Waiting;
      case "Rejected":
      case "6":
        return Status.Rejected;
      case "Approved":
      case "1":
        return Status.Approved;
      case "Serah Terima":
      case "Serah Terima Kembali":
      case "Terima":
      case "Terima Kembali":
      case "2":
      case "3":
      case "4":
      case "5":
        return Status.HandOver;
      case "Expired":
        return Status.Expired;
      default:
        return Status.Waiting;
    }
  }
}
