// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 24),
            _buildRecentTransactions(),
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

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Balance', style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: '\$8,945'),
                    TextSpan(text: '.82', style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.remove_red_eye_outlined, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white30),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Savings: \$5,500', style: TextStyle(color: Colors.white, fontSize: 14)),
              Text('Last 30 days - \$300', style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionButton(Icons.swap_horiz, 'Transfer'),
        _actionButton(Icons.receipt_long, 'Pay Bills'),
        _actionButton(Icons.trending_up, 'Invest'),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: Icon(icon, color: AppColors.primary, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            TextButton(
              onPressed: () {},
              child: const Text('View All', style: TextStyle(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _transactionItem(Icons.movie, 'Netflix Subscripti...', 'Entertainment • Today', '\$19.99', AppColors.expenseRed),
        _transactionItem(Icons.coffee, 'Coffee Shop', 'Food & Drink • Today', '\$4.50', AppColors.expenseRed),
        _transactionItem(Icons.attach_money, 'Salary Deposit', 'Income • Yesterday', '+\$3500.00', AppColors.incomeGreen),
        _transactionItem(Icons.shopping_cart, 'Grocery Store', 'Shopping • Yesterday', '\$55.80', AppColors.expenseRed),
        _transactionItem(Icons.shopping_bag, 'Amazon Purchase', 'Shopping • 2 days ago', '\$120.45', AppColors.expenseRed),
      ],
    );
  }

  Widget _transactionItem(IconData icon, String title, String subtitle, String amount, Color amountColor) {
    return Card(
      elevation: 0.5,
      color: AppColors.cardBackground,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.textPrimary),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: AppColors.textSecondary)),
        trailing: Text(amount, style: TextStyle(color: amountColor, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}