// lib/screens/reports_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Spending Report',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 24),
            _buildTotalExpenses(),
            const SizedBox(height: 24),
            _buildSpendingBreakdown(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
      ),
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundColor: AppColors.primary,
          child: Text('S', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back,', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
          
          Text('Mozammel Rahman Fahim', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  Widget _buildTotalExpenses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Total Expenses (Last 30 days)',
          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 8),
        const Text(
          '-\$1270.00',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.expenseRed),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.arrow_upward, color: AppColors.expenseRed, size: 16),
            const SizedBox(width: 4),
            Text(
              'Up 12% from last month',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpendingBreakdown() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spending Breakdown',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 16),
          _spendingItem('Food & Drink', '\$450.00', '35%', 0.35, AppColors.primary),
          _spendingItem('Shopping', '\$320.00', '25%', 0.25, Colors.orange),
          _spendingItem('Housing', '\$280.00', '22%', 0.22, Colors.green),
          _spendingItem('Transport', '\$150.00', '12%', 0.12, Colors.blue),
          _spendingItem('Other', '\$70.00', '6%', 0.06, Colors.grey),
        ],
      ),
    );
  }

  Widget _spendingItem(String category, String amount, String percentage, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('$amount ($percentage)', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              color: color,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}