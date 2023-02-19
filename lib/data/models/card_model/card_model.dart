class CardModel{
  final int cardNumber;
  final int cardDate;
  final int cvvCode;
  final String cardType;
  final String cardIcon;

  const CardModel({
    required this.cardNumber,
    required this.cardDate,
    required this.cvvCode,
    required this.cardType,
    required this.cardIcon,
  });

  @override
  String toString() {
    return 'CardModel{ '
        'cardNumber: $cardNumber, '
        'cardDate: $cardDate, '
        'cvvCode: $cvvCode, '
        'cardType: $cardType, '
        'cardIcon: $cardIcon,}';
  }

  CardModel copyWith({
    int? cardNumber,
    int? cardDate,
    int? cvvCode,
    String? cardType,
    String? cardIcon,
  }) {
    return CardModel(
      cardNumber: cardNumber ?? this.cardNumber,
      cardDate: cardDate ?? this.cardDate,
      cvvCode: cvvCode ?? this.cvvCode,
      cardType: cardType ?? this.cardType,
      cardIcon: cardIcon ?? this.cardIcon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'cardDate': cardDate,
      'cvvCode': cvvCode,
      'cardType': cardType,
      'cardIcon': cardIcon,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardNumber: map['cardNumber'] as int,
      cardDate: map['cardDate'] as int,
      cvvCode: map['cvvCode'] as int,
      cardType: map['cardType'] as String,
      cardIcon: map['cardIcon'] as String,
    );
  }

//</editor-fold>
}