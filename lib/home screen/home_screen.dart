import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Profile Information',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        backgroundColor: Color.fromARGB(255, 216, 1, 249),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 216, 1, 249),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // Profile Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoTile(
                          title: 'Full Name', value: controller.fullName.value),
                      Divider(),
                      _buildInfoTile(
                          title: 'First Name',
                          value: controller.firstName.value),
                      Divider(),
                      _buildInfoTile(
                          title: 'Last Name', value: controller.lastName.value),
                      Divider(),
                      _buildInfoTile(
                          title: 'Email', value: controller.email.value),
                      Divider(),
                      _buildInfoTile(
                          title: 'Plan Type', value: controller.planType.value),
                      Divider(),
                      _buildInfoTile(
                          title: 'Gender', value: controller.gender.value),
                      Divider(),
                      _buildInfoTile(
                        title: 'Access Token',
                        value: controller.accessToken.value,
                        isToken: true,
                      ),
                      Divider(),
                      _buildInfoTile(
                        title: 'Is Verified',
                        value: controller.isVerified.value ? 'Yes' : 'No',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to display information tiles
  Widget _buildInfoTile({
    required String title,
    required String value,
    bool isToken = false,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
      subtitle: Text(
        value.isNotEmpty ? value : 'N/A',
        style: TextStyle(
          color: isToken ? Colors.grey : Colors.black,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(
        Icons.info_outline,
        color: Colors.blueAccent,
      ),
    );
  }
}
