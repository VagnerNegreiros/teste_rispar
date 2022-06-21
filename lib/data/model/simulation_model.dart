class SimulationModel {
  final String? name;
  final String? email;
  final double? amount;
  final int? term;
  final int? ltv;
  final bool? hasProtectedCollateral;

  SimulationModel({this.name, this.email, this.amount, this.term, this.ltv, this.hasProtectedCollateral});

  static SimulationModel fromJson(Map<String, dynamic> json){
    return SimulationModel(
      name: json['name'],
      email: json['email'],
      amount: json['amount'],
      term: json['term'],
      ltv: json['ltv'],
      hasProtectedCollateral: json['hasProtectedCollateral']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name": name,
      "email": email,
      "amount": amount,
      "term": term,
      "ltv": ltv,
      "hasProtectedCollateral": hasProtectedCollateral,
    };
  }

  @override
  String toString() {
    return 'SimulationModel{name: $name, email: $email, ltv: $ltv, amount: $amount, term: $term, hasProtectedCollateral: $hasProtectedCollateral}';
  }
}