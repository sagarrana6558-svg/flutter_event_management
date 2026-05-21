import 'package:flutter/material.dart';
import 'addevent.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({
    super.key,
    required this.data,
    required this.deleteEvent,
    required this.editEvent,
    required this.addEvents,
  });
  final List<Map<String, dynamic>> data;
  final Function deleteEvent;
  final Function editEvent;
  final Function addEvents;

  // Delete Event

  // Edit Event

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A00E0),
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(right: 8.0)),
            Image.asset("images/image12.png", height: 60),
            const SizedBox(width: 12),
            const Text(
              "Event Manager",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            tooltip: 'Add Event',
            onPressed: () => addEvents(context),
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2), Color(0xFF00C9FF)],
          ),
        ),

        // It will add the events and show the list of events in the home screen
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final event = data[index];

            return Container(
              margin: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF4A00E0),
                    Color(0xFF8E2DE2),
                    Color(0xFF00C9FF),
                  ],
                ),

                // Card Design for Event List
                borderRadius: BorderRadius.circular(20),

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              // circle avtar for the event icon Event Card
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromARGB(122, 77, 77, 79),
                        child: Icon(Icons.event, color: Colors.white),
                      ),

                      title: Text(
                        event["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),

                          Text(
                            "📅 ${event["date"]}",
                            style: const TextStyle(color: Colors.white70),
                          ),

                          Text(
                            "📍 ${event["location"]}",
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              122,
                              77,
                              77,
                              79,
                            ),
                          ),

                          // Update Event
                          onPressed: () async {
                            final updatedEvent = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddEventScreen(event: event),
                              ),
                            );

                            if (updatedEvent != null) {
                              editEvent(index, updatedEvent);
                            }
                          },

                          icon: const Icon(Icons.edit, color: Colors.white),

                          label: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(width: 10),

                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              122,
                              77,
                              77,
                              79,
                            ),
                          ),

                          // Delete Event
                          onPressed: () {
                            deleteEvent(index);
                          },

                          icon: const Icon(Icons.delete, color: Colors.white),

                          label: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
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
