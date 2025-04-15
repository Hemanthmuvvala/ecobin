import 'package:flutter/material.dart';

class ViewReportsScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {
      'description': 'Plastic waste near lakeview',
      'location': 'Lakeview Park, Bhimavaram',
      'date': '2024-02-12'
    },
    {
      'description': 'Bunch of garbage',
      'location': 'Main Street, Bhimavaram',
      'date': '2024-02-10'
    },
    {
      'description': 'A waste dump',
      'location': 'Near Bus Stand, Bhimavaram',
      'date': '2024-02-08'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Reports'),
        backgroundColor: Colors.green[700],
      ),
      body: reports.isEmpty
          ? Center(
              child: Text(
                'No reports available yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.report, color: Colors.green[700]),
                    title: Text(
                      reports[index]['description']!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        _buildDetail(
                            Icons.location_on, reports[index]['location']!),
                        SizedBox(height: 4),
                        _buildDetail(
                            Icons.calendar_today, reports[index]['date']!),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.green[700], size: 18),
        SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
