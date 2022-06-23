class SimulationModel {
  final String? fullName;
  final String? email;
  final double? amount;
  final int? term;
  final int? ltv;
  final bool? hasProtectedCollateral;

  SimulationModel({this.fullName, this.email, this.amount, this.term, this.ltv, this.hasProtectedCollateral});

  static SimulationModel fromJson(Map<String, dynamic> json){
    return SimulationModel(
      fullName: json['fullname'],
      email: json['email'],
      amount: json['amount'],
      term: json['term'],
      ltv: json['ltv'],
      hasProtectedCollateral: json['hasProtectedCollateral']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "fullname": fullName,
      "email": email,
      "amount": amount,
      "term": term,
      "ltv": ltv,
      "has_protected_collateral": hasProtectedCollateral,
    };
  }

  @override
  String toString() {
    return 'SimulationModel{fullName: $fullName, email: $email, ltv: $ltv, amount: $amount, term: $term, hasProtectedCollateral: $hasProtectedCollateral}';
  }
}