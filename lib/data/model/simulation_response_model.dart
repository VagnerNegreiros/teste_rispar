import 'package:intl/intl.dart';

class SimulationResponseModel {
  final String? id;
  final String? fullName;
  final String? email;
  final int? ltv;
  final double? contractValue;
  final double? netValue;
  final double? installmentValue;
  final double? lastInstallmentValue;
  final double? iofFee;
  final double? originationFee;
  final int? term;
  final String? collateral;
  final double? collateralInBrl;
  final double? collateralUnitPrice;
  final DateTime? firstDueDate;
  final DateTime? lastDueDate;
  final double? interestRate;
  final double? monthlyRate;
  final double? annualRate;

  SimulationResponseModel(
      {this.id,
      this.fullName,
      this.email,
      this.ltv,
      this.contractValue,
      this.netValue,
      this.installmentValue,
      this.lastInstallmentValue,
      this.iofFee,
      this.originationFee,
      this.term,
      this.collateral,
      this.collateralInBrl,
      this.collateralUnitPrice,
      this.firstDueDate,
      this.lastDueDate,
      this.interestRate,
      this.monthlyRate,
      this.annualRate});

  static SimulationResponseModel fromJson(Map<String, dynamic> json) {
    return SimulationResponseModel(
      id: json['id'],
      fullName: json['fullname'],
      email: json['email'],
      ltv: json['ltv'],
      contractValue: json['contract_value'],
      netValue: json['net_value'],
      installmentValue: json['installment_value'],
      lastInstallmentValue: json['last_installment_value'],
      iofFee: json['iof_fee'],
      originationFee: json['origination_fee'],
      term: json['term'],
      collateral: convertCollateralToBitcoin(json['collateral']),
      collateralInBrl: json['collateral_in_brl'],
      collateralUnitPrice: json['collateral_unit_price'],
      firstDueDate: convertDate(json['first_due_date']),
      lastDueDate: convertDate(json['last_due_date']),
      interestRate: json['interest_rate'],
      monthlyRate: json['monthly_rate'],
      annualRate: json['annual_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullname": fullName,
      "email": email,
      "ltv": ltv,
      "contract_value": contractValue,
      "installment_value": installmentValue,
      "last_installment_value": lastInstallmentValue,
      "iof_fee": iofFee,
      "origination_fee": originationFee,
      "term": term,
      "collateral": collateral,
      "collateral_in_brl": collateralInBrl,
      "collateral_unit_price": collateralUnitPrice,
      "first_due_date": firstDueDate,
      "last_due_date": lastDueDate,
      "interest_rate": interestRate,
      "monthly_rate": monthlyRate,
      "annual_rate": annualRate,
    };
  }

  static DateTime convertDate(String date) {
    return DateFormat('yyyy-MM-dd').parse(date);
  }

  static String convertCollateralToBitcoin(int sats) {
    return (sats / 100000000).toStringAsFixed(8);
  }

  @override
  String toString() {
    return 'SimulationResponseModel{id: $id, fullName: $fullName, email: $email, ltv: $ltv, contractValue: $contractValue, netValue: $netValue, installmentValue: $installmentValue, lastInstallmentValue: $lastInstallmentValue, iofFee: $iofFee, originationFee: $originationFee, term: $term, collateral: $collateral, collateralInBrl: $collateralInBrl, collateralUnitPrice: $collateralUnitPrice, firstDueDate: $firstDueDate, lastDueDate: $lastDueDate, interestRate: $interestRate, monthlyRate: $monthlyRate, annualRate: $annualRate}';
  }
}
