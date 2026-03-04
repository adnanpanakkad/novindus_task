import 'package:flutter/material.dart';
import 'package:novindus_task/screens/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _sortValue = 'Date';

  // Dummy data – replace with your API / PatientModel list
  final List<Map<String, dynamic>> _bookings = [
    {
      'name': 'Vikram Singh',
      'treatment': 'Couple Combo Package (Rejuvenation Therapy)',
      'date': '31/01/2024',
      'user': 'Jithesh',
      'isHighlighted': false,
    },
    {
      'name': 'Vikram Singh',
      'treatment': 'Couple Combo Package (Rejuvenation Therapy)',
      'date': '31/01/2024',
      'user': 'Jithesh',
      'isHighlighted': false,
    },
    {
      'name': 'Vikram Singh',
      'treatment': 'Couple Combo Package (Rejuvenation Therapy)',
      'date': '31/01/2024',
      'user': 'Jithesh',
      'isHighlighted': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(''),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for treatments',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                  child: const Text('Search'),
                ),
              ],
            ),
          ),

          // Sort row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort by:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                DropdownButton<String>(
                  value: _sortValue,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'Date', child: Text('Date')),
                    DropdownMenuItem(value: 'Name', child: Text('Name')),
                    DropdownMenuItem(
                      value: 'Treatment',
                      child: Text('Treatment'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _sortValue = value);
                      // TODO: sort logic here
                    }
                  },
                ),
              ],
            ),
          ),

          // Patient list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _bookings.length,
              itemBuilder: (context, index) {
                final item = _bookings[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    color: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                    ),
                    child: InkWell(
                      onTap: () {
                        // TODO: open details
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${index + 1}. ',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['treatment'],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  item['date'],
                                  style: const TextStyle(fontSize: 13),
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.person_outline,
                                  size: 16,
                                  color: Colors.grey.shade600,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  item['user'],
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // ── Added: persistent bottom button ──
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(
          16,
          12,
          16,
          20,
        ), // extra bottom padding for safe area
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              'Register Now',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
