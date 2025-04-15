import 'package:flutter/material.dart';

class TrackerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reports = [
    {'description': 'Plastic waste near lakeview', 'status': 'Reported'},
    {'description': 'Bunch of garbage', 'status': 'In Progress'},
    {'description': 'a waste dumb', 'status': 'Completed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatusIcon(
                        Icons.report_problem, 'Reported', Colors.orange),
                    _buildStatusIcon(Icons.timelapse, 'In Progress',
                        const Color.fromARGB(256, 76, 175, 80)),
                    _buildStatusIcon(
                        Icons.check_circle, 'Completed', Colors.green),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    title: Text(report['description']),
                    subtitle: Text('Status: ${report['status']}'),
                    trailing: Icon(
                      report['status'] == 'Reported'
                          ? Icons.report_problem
                          : report['status'] == 'In Progress'
                              ? Icons.timelapse
                              : Icons.check_circle,
                      color: report['status'] == 'Reported'
                          ? Colors.orange
                          : report['status'] == 'In Progress'
                              ? Colors.blue
                              : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildStatusIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 30),
        SizedBox(height: 8),
        Text(label,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

