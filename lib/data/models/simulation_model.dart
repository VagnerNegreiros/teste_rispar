class SimulationModel {
  final String? name;
  final String? email;
  final int? ltv;
  final double? amount;
  final int? term;
  final bool? hasProtectedCollateral;

  SimulationModel({this.name, this.email, this.ltv, this.amount, this.term, this.hasProtectedCollateral});

  @override
  String toString() {
    return 'SimulationModel{name: $name, email: $email, ltv: $ltv, amount: $amount, term: $term, hasProtectedCollateral: $hasProtectedCollateral}';
  }
}