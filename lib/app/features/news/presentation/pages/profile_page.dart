import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.exo2(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Header Profile
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1657815555962-297100ce4b0e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Kurokawa Akane',
                      style: GoogleFonts.exo2(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'akanecco2323@gmail.com',
                      style: GoogleFonts.exo2(
                        fontSize: 16,
                        color: AppColors.placeholder,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Section: Settings
              Text(
                'Settings',
                style: GoogleFonts.exo2(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 20),

              // Profile Info
              _buildProfileInfoItem('Name', 'Kurokawa Akane'),
              _buildProfileInfoItem('Username', '@akanecco2323'),
              _buildProfileInfoItem('Email', 'akanecco2323@gmail.com'),
              _buildProfileInfoItem('Phone', '+62 131 2424 1324'),
              _buildProfileInfoItem('Address', 'Tokyo, Japan'),

              const SizedBox(height: 30),

              // Theme Settings
              Text(
                'Theme',
                style: GoogleFonts.exo2(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 10),
              _buildThemeOption('Appearance'),
              _buildThemeOption('Light'),

              const SizedBox(height: 40),

              // Logout Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement logout functionality
                  },
                  icon: Icon(PhosphorIcons.signOut()),
                  label: Text(
                    'Logout',
                    style: GoogleFonts.exo2(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.exo2(fontSize: 14, color: AppColors.placeholder),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.exo2(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildThemeOption(String option) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option,
            style: GoogleFonts.exo2(fontSize: 16, color: AppColors.textDark),
          ),
          if (option == 'Light') // Show checkmark only for selected option
            Icon(PhosphorIcons.check(), color: AppColors.primary),
        ],
      ),
    );
  }
}
