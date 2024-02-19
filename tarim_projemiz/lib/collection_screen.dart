import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_events/discover_page1.dart';
import 'colors.dart';
import 'discover_page2.dart';
import 'discover_page3.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bg,
          title: Text("Giriş Yap"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "images/lale.jpg",
                              width: 330,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Main Text Here",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Subtext Here",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Spacer(),
                           Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DiscoverPage1()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.search, size: 20),
                                        SizedBox(width: 8),
                                        Text("Discover", style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.image, size: 20),
                                      SizedBox(width: 8),
                                      Text("Gallery", style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.public, size: 20),
                                      SizedBox(width: 8),
                                      Text("Public", style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "images/kaktus.jpg",
                              width: 330,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Main Text Here",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Subtext Here",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DiscoverPage2()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.search, size: 20),
                                        SizedBox(width: 8),
                                        Text("Discover", style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.image, size: 20),
                                      SizedBox(width: 8),
                                      Text("Gallery", style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.public, size: 20),
                                      SizedBox(width: 8),
                                      Text("Public", style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "images/mushroom.jpg",
                              width: 330,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Main Text Here",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Subtext Here",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DiscoverPage3()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.search, size: 20),
                                        SizedBox(width: 8),
                                        Text("Discover", style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.image, size: 20),
                                      SizedBox(width: 8),
                                      Text("Gallery", style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.public, size: 20),
                                      SizedBox(width: 8),
                                      Text("Public", style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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