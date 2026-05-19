import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Map<String, dynamic>> events = [
    {"title": "Music Concert", "date": "20 May 2026", "location": "Ahmedabad"},
    {"title": "Tech Seminar", "date": "25 May 2026", "location": "Gandhinagar"},
    {"title": "College Fest", "date": "30 May 2026", "location": "Surat"},
    {"title": "Art Exhibition", "date": "05 June 2026", "location": "Rajkot"},
    {"title": "Food Festival", "date": "10 June 2026", "location": "Vadodara"},
    {"title": "Marathon", "date": "15 June 2026", "location": "Bhavnagar"},
  ];

  // Add Event
  void addEvent() {
    setState(() {
      events.add({
        "title": "New Event",
        "date": "01 June 2026",
        "location": "Rajkot",
      });
    });
  }

  // Edit Event
  void editEvent(int index) {
    setState(() {
      events[index]["title"] = "Updated Event";
    });
  }

  // Delete Event
  void deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0C1638),
        centerTitle: true,
        title: const Text("Event Manager"),

        actions: [
          IconButton(
            onPressed: addEvent,
            icon: const Icon(Icons.add),
            tooltip: 'Add event',
          ),
        ],
      ),

      body: Container(
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF0C1638),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0C1638), Color(0xFF0C122B)],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          itemCount: events.length,

          itemBuilder: (context, index) {
            final event = events[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: const Color(0xFF162149),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF53C6E5),
                        child: const Icon(Icons.event, color: Colors.black),
                      ),
                      title: Text(
                        event["title"],
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          Text(
                            "Date: ${event["date"]}",
                            style: const TextStyle(color: Colors.white70),
                          ),
                          Text(
                            "Location: ${event["location"]}",
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            editEvent(index);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF53C6E5),
                            foregroundColor: Colors.black,
                          ),
                          icon: const Icon(Icons.edit, size: 18),
                          label: const Text("Edit"),
                        ),

                        const SizedBox(width: 10),

                        ElevatedButton.icon(
                          onPressed: () {
                            deleteEvent(index);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEE7A70),
                            foregroundColor: Colors.black,
                          ),
                          icon: const Icon(Icons.delete, size: 18),
                          label: const Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
