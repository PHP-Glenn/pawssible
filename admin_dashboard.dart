import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: ListView(
        children: [
          DashboardItem(
            title: 'Appointment Calendar',
            icon: Icons.calendar_today,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AppointmentCalendarPage()));
            },
          ),
          DashboardItem(
            title: 'Pending Requests',
            icon: Icons.pending,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => PendingRequestsPage()));
            },
          ),
          DashboardItem(
            title: 'Confirm Requests',
            icon: Icons.check_circle,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmRequestsPage()));
            },
          ),
          DashboardItem(
            title: 'Queueing',
            icon: Icons.queue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => QueueingPage()));
            },
          ),
          DashboardItem(
            title: 'Patient Record List',
            icon: Icons.list,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => PatientRecordListPage()));
            },
          ),
        ],
      ),
    );
  }     
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const DashboardItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Color(0xFF6A1B9A)),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder pages for each dashboard item

class AppointmentCalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Calendar'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Center(
        child: Text(
          'Appointment Calendar Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class PendingRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Requests'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Center(
        child: Text(
          'Pending Requests Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ConfirmRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Requests'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Center(
        child: Text(
          'Confirm Requests Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class QueueingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Queueing'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Center(
        child: Text(
          'Queueing Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class PatientRecordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Record List'),
        backgroundColor: Color(0xFF6A1B9A),
      ),
      body: Center(
        child: Text(
          'Patient Record List Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
