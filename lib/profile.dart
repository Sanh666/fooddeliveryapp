import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
              height: MediaQuery.of(context).size.height / 4.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 105.0),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Gen G vo dich 1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_nvu3gkYgZKRNPbh3rrh0NaetFpLRHLTsrHm3kJHAjw&s",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildInfoCard(Icons.person, "Name", "Shivam Gupta"),
                  SizedBox(height: 10),
                  _buildInfoCard(Icons.email, "Email", "Shivam@465gmail.com"),
                  SizedBox(height: 10),
                  _buildInfoCard(Icons.description, "Terms and Condition"),
                  SizedBox(height: 10),
                  _buildInfoCard(Icons.delete, "Delete Account"),
                  SizedBox(height: 10),
                  _buildInfoCard(Icons.logout, "LogOut"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, [String? subtitle]) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
          subtitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        )
            : null,
      ),
    );
  }
}
