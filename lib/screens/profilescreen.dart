import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[700],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Edit profile functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit profile')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Settings')),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[700]!, Colors.green[50]!],
            stops: [0.0, 0.3],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: 20),
            // Profile Image
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.green[100],
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.green[700],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Name and designation
            Center(
              child: Column(
                children: [
                  Text(
                    'Hemanth Muvvala',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Field Officer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Performance Stats
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat('Reports', '47'),
                  _buildDivider(),
                  _buildStat('Completed', '38'),
                  _buildDivider(),
                  _buildStat('Reward Points', '920'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Main Profile Info Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Personal Information'),
                    SizedBox(height: 16),
                    _buildProfileDetail(Icons.calendar_today, 'Age: 20'),
                    _buildProfileDetail(Icons.phone, 'Phone: +91 9966323291'),
                    _buildProfileDetail(Icons.email, 'hemanth@example.com'),
                    _buildProfileDetail(
                        Icons.location_on, 'Bhimavaram, Andhra Pradesh, India'),
                    SizedBox(height: 24),
                    _buildSectionTitle('Work Information'),
                    SizedBox(height: 16),
                    _buildProfileDetail(Icons.work, 'Department: Field Operations'),
                    _buildProfileDetail(Icons.badge, 'Employee ID: FO-2023-089'),
                    _buildProfileDetail(Icons.calendar_month, 'Joined: June 2023'),
                    _buildProfileDetail(Icons.apartment, 'Branch: Bhimavaram Central'),
                    SizedBox(height: 24),
                    _buildSectionTitle('Performance Overview'),
                    SizedBox(height: 16),
                    _buildPerformanceIndicator('Monthly Target', 0.75),
                    SizedBox(height: 12),
                    _buildPerformanceIndicator('Quality Rating', 0.9),
                    SizedBox(height: 12),
                    _buildPerformanceIndicator('Team Contribution', 0.85),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Recent Activity
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Recent Activity'),
                  SizedBox(height: 16),
                  _buildActivityItem(
                    'Report Submitted',
                    'Agricultural survey in West Region',
                    '2 hours ago',
                    Icons.description,
                  ),
                  Divider(height: 24),
                  _buildActivityItem(
                    'Earned 50 Points',
                    'Completed task ahead of schedule',
                    'Yesterday',
                    Icons.emoji_events,
                  ),
                  Divider(height: 24),
                  _buildActivityItem(
                    'New Assignment',
                    'Crop analysis in North District farms',
                    '3 days ago',
                    Icons.assignment,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetail(IconData icon, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.green[700], size: 22),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              detail,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green[700],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildPerformanceIndicator(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            Text(
              '${(value * 100).toInt()}%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              widthFactor: value,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityItem(
      String title, String description, String time, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green[50],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.green[700],
            size: 22,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}