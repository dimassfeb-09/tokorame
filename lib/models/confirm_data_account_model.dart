class ConfirmDataAccount {
  final String? agen;
  final String? noWhatsapp;
  final String? level;
  final String? storeName;
  final String? storeDomain;

  const ConfirmDataAccount({
    this.agen,
    this.noWhatsapp,
    this.level,
    this.storeName,
    this.storeDomain,
  });

  // Tambahkan copyWith agar bisa memperbarui properti secara selektif
  ConfirmDataAccount copyWith({
    String? agen,
    String? noWhatsapp,
    String? level,
    String? storeName,
    String? storeDomain,
  }) {
    return ConfirmDataAccount(
      agen: agen ?? this.agen,
      noWhatsapp: noWhatsapp ?? this.noWhatsapp,
      level: level ?? this.level,
      storeName: storeName ?? this.storeName,
      storeDomain: storeDomain ?? this.storeDomain,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'agen': agen,
      'noWhatsapp': noWhatsapp,
      'level': level,
      'storeName': storeName,
      'storeDomain': storeDomain,
    };
  }
}
