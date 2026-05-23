import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  final Map<String, dynamic>? event;

  const AddEventScreen({super.key, this.event});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late final TextEditingController titleController;
  late final TextEditingController dateController;
  late final TextEditingController locationController;
  bool isSaveEnabled = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.event != null ? widget.event!['title'] : '',
    );
    dateController = TextEditingController(
      text: widget.event != null ? widget.event!['date'] : '',
    );
    locationController = TextEditingController(
      text: widget.event != null ? widget.event!['location'] : '',
    );

    isSaveEnabled =
        titleController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        locationController.text.isNotEmpty;
  }

  void _updateSaveState() {
    final enabled =
        titleController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        locationController.text.isNotEmpty;
    if (enabled != isSaveEnabled) {
      setState(() {
        isSaveEnabled = enabled;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(121, 7, 7, 231),

        title: Text(
          widget.event == null ? 'Add Event' : 'Edit Event',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2), Color(0xFF00C9FF)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Event Title',
                  labelStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: dateController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Event Date',
                  labelStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: locationController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSaveEnabled
                        ? const Color.fromARGB(122, 77, 77, 79)
                        : const Color.fromARGB(122, 77, 77, 79),

                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: true
                      ? () {
                          Map<String, dynamic> newEvent = {
                            'title': titleController.text,
                            'date': dateController.text,
                            'location': locationController.text,
                          };
                          Navigator.pop(context, newEvent);
                        }
                      : null,
                  child: Text(
                    widget.event == null ? 'Save Event' : 'Update Event',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
