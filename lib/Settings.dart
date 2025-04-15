import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://picsum.photos/id/1005/200/200', // Foto contoh
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Fathir',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            
            // Mode Gelap/Terang
            SwitchListTile(
              title: Text(
                'Mode Gelap',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              secondary: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const Spacer(),
            
            // Logout Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: const Icon(Icons.logout, color: Colors.black),
              label: const Text('Logout',style: TextStyle(color: Colors.black) ,),
              onPressed: () {
                _showLogoutDialog(context);
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Konfirmasi Logout"),
        content: const Text("Yakin ingin logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Berhasil logout")),
              );
              // Tambahkan logika logout asli di sini
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
