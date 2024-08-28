class QrCodeData {
  String? qrCode;
  int? emailSendingResult;
  int? whatsappSendingResult;

  QrCodeData(
      {this.qrCode, this.emailSendingResult, this.whatsappSendingResult});

  QrCodeData.fromJson(Map<String, dynamic> json) {
    qrCode = json['qr_code'];
    emailSendingResult = json['email_sending_result'];
    whatsappSendingResult = json['whatsapp_sending_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qr_code'] = this.qrCode;
    data['email_sending_result'] = this.emailSendingResult;
    data['whatsapp_sending_result'] = this.whatsappSendingResult;
    return data;
  }
}
