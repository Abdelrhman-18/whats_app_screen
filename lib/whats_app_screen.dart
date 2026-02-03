import 'package:flutter/material.dart';

class WhatsAppScreen extends StatefulWidget {
  WhatsAppScreen({super.key});

  @override
  State<WhatsAppScreen> createState() => _WhatsAppScreenState();
}

class _WhatsAppScreenState extends State<WhatsAppScreen> {
  final List<String> categories = ["All", "Unread", "Favourites", "Groups", "Other"];

  List chats = [
    {"name": "Ahmed", "message": "ازيك عامل ايه؟", "time": "10:30 AM", "image": "assets/images/doctor_fake.png"},
    {"name": "Waleed", "message": "تمام، هشوفك بكرة", "time": "Yesterday", "image": "assets/images/doctor_fake.png"},
    {"name": "Mohamed", "message": "فينك؟", "time": "9:15 PM", "image": "assets/images/doctor_fake.png"},
    {"name": "Ali", "message": "تعالى الجيم النهارده 💪", "time": "8:00 PM", "image": "assets/images/doctor_fake.png"},
    {"name": "Youssef", "message": "خلصت الشغل؟", "time": "7:45 PM", "image": "assets/images/doctor_fake.png"},
    {"name": "Mahmoud", "message": "ممكن تكلميني لما تفضى؟", "time": "6:20 PM", "image": "assets/images/doctor_fake.png"},
    {"name": "Khaled", "message": "بعتلك الفايل", "time": "5:10 PM", "image": "assets/images/doctor_fake.png"},
    {"name": "Nour", "message": "😂😂😂", "time": "4:55 PM", "image": "assets/images/doctor_fake.png"},
    {"name": "Abdo", "message": "متنساش الميتنج", "time": "3:30 PM", "image": "assets/images/doctor_fake.png"},
    {"name": "Omar", "message": "فينك يا نجم؟", "time": "2:15 PM", "image": "assets/images/doctor_fake.png"},
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xff008069),
        actions: const [
          Icon(Icons.camera_alt_outlined, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.menu, color: Colors.white),
          SizedBox(width: 10),

        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey.shade600),
                  const SizedBox(width: 10),
                  Text("Search...", style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                bool isSelected = index == selectIndex;
                return GestureDetector(
                  onTap: () => setState(() => selectIndex = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xffD9FDD3) : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? const Color(0xff008069) : Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(chat["image"]),
                  ),
                  title: Text(
                    chat["name"],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: Text(
                    chat["message"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat["time"],
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),

                    ],
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