import 'package:flutter/material.dart';
import 'package:new_pro/main.dart';
import 'package:new_pro/screens/reportscreen.dart';
import 'package:new_pro/screens/viewreport.dart';

class HomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Mob-Bin!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20),
          AppButton(
            text: 'Report Waste',
            icon: Icons.report_problem,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportWasteScreen()),
              );
            },
          ),
          SizedBox(height: 20),
          AppButton(
            text: 'View Reports',
            icon: Icons.list,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewReportsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}