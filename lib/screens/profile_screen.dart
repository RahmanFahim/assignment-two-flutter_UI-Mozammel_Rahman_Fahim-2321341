// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('User Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 24),
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primary,
              child: Text('SN', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 32),
            
            _buildInfoField('Mozammel Rahman Fahim', 'Fahim'),
            const SizedBox(height: 16),
            _buildInfoField('2321341', 'S12345'),
            const SizedBox(height: 16),
            _buildInfoField('nut02ral@gmail.com', '2321341@iub.edu.bd'),
            const SizedBox(height: 16),
            _buildInfoField(
              'Bio / Story',
              'I\'m currently focusing on my final year, balancing studies with building side projects. I believe financial health is key to academic success. I love hiking on weekends and planning my next big travel adventure!',
              isMultiLine: true,
            ),
            const SizedBox(height: 16),
            const Text(
              "(Note: Students should replace the text above with their own description here)",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.expenseRed, fontSize: 12),
            ),
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

  Widget _buildInfoField(String label, String value, {bool isMultiLine = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              height: isMultiLine ? 1.5 : 1.0,
            ),
          ),
        ),
      ],
    );
  }
}