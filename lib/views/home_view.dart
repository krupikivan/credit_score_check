import 'package:flutter/material.dart';
import '../models/credit_card_account.dart';
import '../widgets/animated_chart.dart';
import '../widgets/credit_factors.dart';
import '../widgets/account_details.dart';
import '../widgets/total_balance.dart';
import '../widgets/open_credit_card_accounts.dart';
import '../widgets/credit_score.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF4A148C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/employment-information');
                          },
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(width: 48), // To balance the AppBar
                      ],
                    ),
                    const SizedBox(height: 16),
                    const CreditScoreCard(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const AnimatedChart(),
                  const SizedBox(height: 16),
                  const CreditFactors(),
                  const SizedBox(height: 16),
                  const AccountDetails(
                    spendLimit: 100.0,
                    balance: 30.0,
                    creditLimit: 600.0,
                  ),
                  const SizedBox(height: 16),
                  const TotalBalance(
                    totalBalance: 8390.0,
                    totalLimit: 200900.0,
                  ),
                  const SizedBox(height: 16),
                  OpenCreditCardAccounts(
                    accounts: [
                      CreditCardAccount(
                        name: 'Syncb/Amazon',
                        balance: 1500.0,
                        limit: 6300.0,
                        utilizationPercentage: 21.0,
                        reportedDate: 'June 20, 2023',
                      ),
                      CreditCardAccount(
                        name: 'Syncb/Amazon',
                        balance: 1500.0,
                        limit: 6300.0,
                        utilizationPercentage: 21.0,
                        reportedDate: 'June 20, 2023',
                      ),
                      CreditCardAccount(
                        name: 'Syncb/Amazon',
                        balance: 1500.0,
                        limit: 6300.0,
                        utilizationPercentage: 21.0,
                        reportedDate: 'June 20, 2023',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
