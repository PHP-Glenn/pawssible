import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve owner's name from arguments
    final String? ownerName = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 240, 241),
      appBar: AppBar(
        title: Icon(
          Icons.pets,
          size: 50.0,
        ),
        backgroundColor: Color.fromARGB(255, 144, 26, 157),
        automaticallyImplyLeading: false,
        toolbarHeight: 70, // Adjust the height as needed
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'my_account') {
                _navigateToAccount(context);
              } else if (value == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'my_account',
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.black),
                      SizedBox(width: 10),
                      Text('My Account'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Logout'),
                    ],
                  ),
                ),
              ];
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome $ownerName',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildDashboardCard(
                    icon: Icons.pets,
                    title: 'Make Appointments',
                    onTap: () {
                      Navigator.pushNamed(context, '/appointments'); // Navigate to PetForm
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.medical_services,
                    title: 'View Patient Records',
                    onTap: () {
                      Navigator.pushNamed(context, '/patient_records'); // Navigate to ViewPatientRecordsPage
                    },
                  ),
                  _buildDashboardCard(
                    icon: Icons.queue,
                    title: 'Queue Status',
                    onTap: () {
                      _navigateToQueueStatus(context, ownerName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAccount(BuildContext context) {
    Navigator.pushNamed(context, '/my_account');
  }

  Widget _buildDashboardCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100, // Adjust the height as needed
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // Make corners less rounded
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Color(0xFF6A1B9A),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A1B9A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToQueueStatus(BuildContext context, String? ownerName) {
    Navigator.pushNamed(
      context,
      '/queueStatus',
      arguments: ownerName,
    );
  }

  void _logout(BuildContext context) {
    // Clear user data here
    // Navigate to login screen
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
