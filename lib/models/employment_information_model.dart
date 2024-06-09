class EmploymentInformationModel {
  String employmentType;
  String employer;
  String jobTitle;
  String grossAnnualIncome;
  String payFrequency;
  String employerAddress;
  String timeWithEmployerYears;
  String timeWithEmployerMonths;
  String nextPayday;
  bool isDirectDeposit;

  EmploymentInformationModel({
    required this.employmentType,
    required this.employer,
    required this.jobTitle,
    required this.grossAnnualIncome,
    required this.payFrequency,
    required this.employerAddress,
    required this.timeWithEmployerYears,
    required this.timeWithEmployerMonths,
    required this.nextPayday,
    required this.isDirectDeposit,
  });

  factory EmploymentInformationModel.initializer() {
    return EmploymentInformationModel(
      employmentType: 'Full-time',
      employer: 'Apple Inc',
      jobTitle: 'Software engineer',
      grossAnnualIncome: '\$150,000/year',
      payFrequency: 'Bi-weekly',
      employerAddress: 'Apple One Apple Park Way, Cupertino, CA 95014',
      timeWithEmployerYears: '1 year',
      timeWithEmployerMonths: '3 months',
      nextPayday: 'Sept 22nd, 2023 (Friday)',
      isDirectDeposit: true,
    );
  }

  EmploymentInformationModel copyWith({
    String? employmentType,
    String? employer,
    String? jobTitle,
    String? grossAnnualIncome,
    String? payFrequency,
    String? employerAddress,
    String? timeWithEmployerYears,
    String? timeWithEmployerMonths,
    String? nextPayday,
    bool? isDirectDeposit,
  }) {
    return EmploymentInformationModel(
      employmentType: employmentType ?? this.employmentType,
      employer: employer ?? this.employer,
      jobTitle: jobTitle ?? this.jobTitle,
      grossAnnualIncome: grossAnnualIncome ?? this.grossAnnualIncome,
      payFrequency: payFrequency ?? this.payFrequency,
      employerAddress: employerAddress ?? this.employerAddress,
      timeWithEmployerYears:
          timeWithEmployerYears ?? this.timeWithEmployerYears,
      timeWithEmployerMonths:
          timeWithEmployerMonths ?? this.timeWithEmployerMonths,
      nextPayday: nextPayday ?? this.nextPayday,
      isDirectDeposit: isDirectDeposit ?? this.isDirectDeposit,
    );
  }

  factory EmploymentInformationModel.fromJson(Map<String, dynamic> json) =>
      EmploymentInformationModel(
        employmentType: json['employmentType'],
        employer: json['employer'],
        jobTitle: json['jobTitle'],
        grossAnnualIncome: json['grossAnnualIncome'],
        payFrequency: json['payFrequency'],
        employerAddress: json['employerAddress'],
        timeWithEmployerYears: json['timeWithEmployerYears'],
        timeWithEmployerMonths: json['timeWithEmployerMonths'],
        nextPayday: json['nextPayday'],
        isDirectDeposit: json['isDirectDeposit'],
      );

  Map<String, dynamic> toJson() => {
        'employmentType': employmentType,
        'employer': employer,
        'jobTitle': jobTitle,
        'grossAnnualIncome': grossAnnualIncome,
        'payFrequency': payFrequency,
        'employerAddress': employerAddress,
        'timeWithEmployerYears': timeWithEmployerYears,
        'timeWithEmployerMonths': timeWithEmployerMonths,
        'nextPayday': nextPayday,
        'isDirectDeposit': isDirectDeposit,
      };
}
