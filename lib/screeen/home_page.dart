import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pakaian_adat/Controller/music_controller.dart';
import 'package:pakaian_adat/footer_bar/footer_bar.dart';
import 'package:pakaian_adat/model/music_model.dart';
import 'package:pakaian_adat/screeen/about_page.dart';
import 'package:pakaian_adat/screeen/materi_screen.dart';
import 'package:pakaian_adat/screeen/sejarah.dart';
import 'package:pakaian_adat/screeen/upload_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = -1;
  int _selectedIndex = 0;
  List<Music> musicList = [];
  late MusicController musicController;

  @override
  void initState() {
    super.initState();
    musicController =
        MusicController('https://musik-tradisionalsumbawa.com/api/get-all');
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Music> fetchedMusicList = await musicController.getAllMusic();
      setState(() {
        musicList = fetchedMusicList;
      });
    } catch (error) {
      print('Error fetching data: $error');
      // Handle error
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Sejarah()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    } else if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Baju Adat Sasambo',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 2.4,
              color: Color(0xff000000),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu_open_rounded,
                color: Color(0xff141e47),
              ),
              onPressed: () {
                print('Hamburger icon clicked!');
              },
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: musicList.length,
                  itemBuilder: (context, index) {
                    Music music = musicList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedTabIndex == index) {
                            selectedTabIndex =
                                -1; // Toggle off if the same item is tapped
                          } else {
                            selectedTabIndex = index;
                          }
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Materi(id: music.id)),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        padding: EdgeInsets.fromLTRB(17, 6, 0, 7),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffdcdde0)),
                          color: selectedTabIndex == index
                              ? Color.fromARGB(255, 114, 244, 137)
                              : Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xfff1f2f5),
                              offset: Offset(0, 10),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 50, 7),
                              padding: EdgeInsets.fromLTRB(9, 0, 14, 0),
                              height: double.infinity,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://musik-tradisionalsumbawa.com/${music.image}'),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Align(
                                      child: SizedBox(
                                        width: 150,
                                        height: 60,
                                        child: Text(
                                          '${music.namaAlat}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 2.7272727273,
                                            color: Color(0xff201a25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // inclassJZH (111:25)
                                    left: 0,
                                    top: 17,
                                    child: Align(
                                      child: SizedBox(
                                        width: 137,
                                        height: 60,
                                        child: Text(
                                          '${music.author.name}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 5,
                                            color: Color(0xff201a25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // member1Th (111:26)
                                    left: 0,
                                    top: 47,
                                    child: Align(
                                      child: SizedBox(
                                        width: 205,
                                        height: 60,
                                        child: Text(
                                          '1 Views',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            height: 3.75,
                                            color: Color(0xff201a25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
