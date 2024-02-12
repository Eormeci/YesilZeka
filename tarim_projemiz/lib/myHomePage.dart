import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_events/learn_screen.dart';
import 'build_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'login_screen.dart';
import 'newPage1.dart';
import 'newPage2.dart';
import 'newPage3.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> events = [
    {
      'image': 'images/haber1.jpeg',
      'distance': 'Tarımın 2023 karnesi',
      'name':
      "'Tarım sektörü, 2023 yılında üretim artışların ve düşüşlerin yaşandığı bir yıl olarak kayıtlara geçti.En çok üretilen 20 tarım ürününden 15’i çiftçiyi kısmen memnun ederken, 5'i ise kaybettirdi. ",
    },
    {
      'image': 'images/haber2.jpg',
      'distance': 'İklim değişikliği zeytin üretimini vurdu',
      'name':
      'İklim değişikliğiyle birlikte artan ortalama sıcaklıklar ve yetersiz yağışlar, diğer Akdeniz ülkelerinde olduğu gibi, Türkiye’de de zeytin üretimini olumsuz etkiledi.',
    },
    {
      'image': 'images/haber3.jpg',
      'distance':
      'KOP bölgesi modern tarımla iklim değişikliğine hazırlanıyor',
      'name':
      'Konya Ovası Projesi (KOP) Bölge Kalkınma İdaresi Başkanı Dr. Murat Karakoyunlu, "Bölgemiz için suyun bir damlası bile önemlidir" dedi.',
    },
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Bütün Widget'lar bunun içine yazılacak.
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: bg,
                ),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // YesilZeka
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "YesilZeka",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.facebook),
                        Icon(Icons.mail),
                        Icon(Icons.safety_check)
                      ],
                    ),
                    SizedBox(height: 10),
                    // Welcome
                    Row(
                      children: [
                        Text(
                          "Welcome !",
                          style: GoogleFonts.roboto(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    // İkonlar
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildButton(Icons.login, "Login", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          }),
                          buildButton(Icons.school, "Learn", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LearnScreen()));
                          }),
                          buildButton(Icons.star, "Collection", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          }),
                          buildButton(Icons.sailing_sharp, "Sailing", () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          }),
                        ],
                      )
                      ,
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyNewPage1(onBackButtonPressed: () {
                                        // Your callback logic here
                                      }),
                                    ),
                                  );
                                  break;
                                case 1:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyNewPage2(onBackButtonPressed: () {
                                        // Your callback logic here
                                      }),
                                    ),
                                  );
                                  break;
                                case 2:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyNewPage3(onBackButtonPressed: () {
                                        // Your callback logic here
                                      }),
                                    ),
                                  );
                                  break;
                              }
                            },

                            child: Container(
                              width: 350,
                              height: 300,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              // İç içe istiyorsan stack kullanacaksın.
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(45),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.asset(
                                            events[index]['image'],
                                            height: 100,
                                            width: 320,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 4, left: 15),
                                        child: Text(
                                          events[index]['distance'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 4, left: 15),
                                        child: Text(
                                          events[index]['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
