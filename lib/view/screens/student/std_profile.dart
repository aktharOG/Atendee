import 'package:attendee/logout.dart';
import 'package:attendee/services/dio_service.dart';
import 'package:attendee/view/provider/home_provider.dart';
import 'package:attendee/view/widgets/profile_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated user data (replace with actual data)
    String userName = 'John Doe';
    int userAge = 25;
    String userSex = 'Male';
    String userDob = 'January 1, 1995';
    String userAddress = '123 Main St, City, Country';
    String userContact = '+1 (123) 456-7890';
    final homePro = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.teal],
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignOutPage()));
                          // Navigate to settings page (implement this)
                        },
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(
                        baseUrl + homePro.profileModelSTD!.data.image),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    homePro.profileModelSTD?.data.studentName ?? userName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 20),
                  ProfileItem(
                      title: "Age: ",
                      value:"$userAge years"),
                  ProfileItem(
                      title: "Sex: ",
                      value: homePro.profileModelSTD?.data.gender ?? userSex),
                       ProfileItem(
                      title: "Date of Birth: ",
                      value: userDob),
             
                  ProfileItem(
                      title: "Address: ",
                      value: homePro.profileModelSTD?.data.studentAddress ??
                          "address empty"),
                             ProfileItem(
                      title: "Contact Number: ",
                      value: homePro.profileModelSTD?.data.phone ?? userContact),
               
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
