import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> classes = [
      {
        'subject': 'Mathematics',
        'time': '08:00 AM - 09:30 AM',
        'teacher': 'Mr. Anderson',
        'room': '302',
        'color': '0xFF1E88E5',
      },
      {
        'subject': 'Physics',
        'time': '09:45 AM - 11:15 AM',
        'teacher': 'Ms. Davis',
        'room': 'Lab 1',
        'color': '0xFF43A047',
      },
      {
        'subject': 'Lunch Break',
        'time': '11:15 AM - 12:00 PM',
        'teacher': '',
        'room': 'Cafeteria',
        'color': '0xFFFFA000',
      },
      {
        'subject': 'English Literature',
        'time': '12:00 PM - 01:30 PM',
        'teacher': 'Mrs. Wilson',
        'room': '204',
        'color': '0xFF8E24AA',
      },
      {
        'subject': 'History',
        'time': '01:45 PM - 03:15 PM',
        'teacher': 'Mr. Brown',
        'room': '105',
        'color': '0xFFD81B60',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 7,
              itemBuilder: (context, index) {
                final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                final isSelected = index == 0; // Monday selected by default
                
                return Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF1A237E) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected ? null : Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${12 + index}',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: classes.length,
              itemBuilder: (context, index) {
                final item = classes[index];
                final color = Color(int.parse(item['color']!));
                
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border(
                      left: BorderSide(color: color, width: 6),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      item['subject']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(item['time']!),
                          ],
                        ),
                        if (item['teacher']!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(item['teacher']!),
                              const Spacer(),
                              Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(item['room']!),
                            ],
                          ),
                        ],
                      ],
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
}
