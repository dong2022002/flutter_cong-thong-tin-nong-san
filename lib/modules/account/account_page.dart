import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    // Xử lý sự kiện khi email được nhấn
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    // Xử lý sự kiện khi số điện thoại được nhấn
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.location_on),
                  onPressed: () {
                    // Xử lý sự kiện khi địa chỉ được nhấn
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
