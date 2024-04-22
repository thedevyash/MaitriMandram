import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/Screens/chatbot/chatScreen.dart';
import 'package:sehyogini_frontned/Screens/chatbot/chatbotScreen.dart';

class VoicesScreen extends StatefulWidget {
  const VoicesScreen({super.key});

  @override
  State<VoicesScreen> createState() => _VoicesScreenState();
}

class _VoicesScreenState extends State<VoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset("assets/bot.png"),
        ),
        onPressed: () {
          Get.to(chatScreen(
            username: "me",
          ));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.lightBlueAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 24.0, right: 24),
              child: Text(
                "Counsellors",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "Book Your Appointment",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Expanded(
            child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
              children: [
                AppointmentCard(
                  counselorName: 'Dr. John Doe',
                  specialty: 'Depression & Anxiety',
                  availability: 'Available on Mon, Wed, Fri',
                  onTap: () {
                    _showAppointmentDialog(context, 'Dr. John Doe');
                  },
                ),
                SizedBox(height: 16.0),
                AppointmentCard(
                  counselorName: 'Dr. Jane Smith',
                  specialty: 'Family Counseling',
                  availability: 'Available on Tue, Thu, Sat',
                  onTap: () {
                    _showAppointmentDialog(context, 'Dr. Jane Smith');
                  },
                ),
                SizedBox(height: 16.0),
                AppointmentCard(
                  counselorName: 'Dr. Michael Johnson',
                  specialty: 'Teen Counseling',
                  availability: 'Available on Mon, Wed, Fri',
                  onTap: () {
                    _showAppointmentDialog(context, 'Dr. Michael Johnson');
                  },
                ),
                SizedBox(height: 16.0),
                AppointmentCard(
                  counselorName: 'Dr. Emily Brown',
                  specialty: 'Relationship Counseling',
                  availability: 'Available on Tue, Thu, Sat',
                  onTap: () {
                    _showAppointmentDialog(context, 'Dr. Emily Brown');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showAppointmentDialog(BuildContext context, String counselorName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AppointmentDialog(
        counselorName: counselorName,
      );
    },
  );
}

class AppointmentCard extends StatelessWidget {
  final String? counselorName;
  final String? specialty;
  final String? availability;
  final VoidCallback? onTap;

  const AppointmentCard({
    required this.counselorName,
    required this.specialty,
    required this.availability,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.blue.shade600],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade200,
              offset: Offset(2, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Book Now',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    counselorName!,
                    style: GoogleFonts.poppins(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    specialty!,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    availability!,
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentDialog extends StatefulWidget {
  final String? counselorName;

  const AppointmentDialog({this.counselorName});

  @override
  _AppointmentDialogState createState() => _AppointmentDialogState();
}

class _AppointmentDialogState extends State<AppointmentDialog> {
  List<String> slots = ['10:00 AM', '11:00 AM', '2:00 PM', '3:00 PM'];
  String? selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Book Appointment with ${widget.counselorName}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: slots.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(slots[index]),
                onTap: () {
                  setState(() {
                    selectedSlot = slots[index];
                  });
                },
                trailing:
                    selectedSlot == slots[index] ? Icon(Icons.check) : null,
              );
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Implement booking logic
              Navigator.of(context).pop();
            },
            child: Text('Book'),
          ),
        ],
      ),
    );
  }
}
