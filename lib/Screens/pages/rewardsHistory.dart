import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardsHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rewardsHistory = [
    {'date': '23-04-2024', 'description': 'Daily login', 'points': 5},
    {'date': '22-04-2024', 'description': 'Made a purchase', 'points': -10},
    {'date': '21-04-2024', 'description': 'Daily login', 'points': 5},
    {'date': '20-04-2024', 'description': 'Made a purchase', 'points': -15},
    {'date': '19-04-2024', 'description': 'Daily login', 'points': 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Rewards History', style: GoogleFonts.poppins(fontSize: 20)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: rewardsHistory.length,
        itemBuilder: (context, index) {
          final item = rewardsHistory[index];
          return ListTile(
            title: Text(item['description'],
                style: GoogleFonts.poppins(fontSize: 16)),
            subtitle:
                Text(item['date'], style: GoogleFonts.poppins(fontSize: 14)),
            trailing: Text('${item['points'] > 0 ? '+' : ''}${item['points']}',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: item['points'] > 0 ? Colors.green : Colors.red)),
          );
        },
      ),
    );
  }
}
