import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pakaian_adat/Controller/sejarahumum_controller.dart';
import 'package:pakaian_adat/footer_bar/footer_bar.dart';
import 'package:pakaian_adat/model/sejarahumum_model.dart';
import 'package:pakaian_adat/screeen/about_page.dart';
import 'package:pakaian_adat/screeen/home_page.dart';
import 'package:pakaian_adat/screeen/upload_page.dart';

class Sejarah extends StatefulWidget {
  const Sejarah({super.key});

  @override
  State<Sejarah> createState() => _SejarahState();
}

class _SejarahState extends State<Sejarah> {
  int _selectedIndex = 1;
  List<SejarahUmumModel> sejarahUmumList = [];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    } else if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    } else if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchSejarahUmumData();
  }

  Future<void> _fetchSejarahUmumData() async {
    try {
      final data = await SejarahUmumController.getSejarahUmumData();
      setState(() {
        sejarahUmumList = data;
      });
    } catch (e) {
      // Handle error
      print('Error fetching Sejarah Umum data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.3325,
              color: Color(0xff000000),
              decorationColor: Color(0xff000000),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 114, 244, 137)),
          centerTitle: true, // Membuat teks menjadi di tengah
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 17, 31),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // chapteroneaEX (10:1169)
                  margin: EdgeInsets.fromLTRB(15, 0, 1, 29),
                  child: Text(
                    'Sejarah Umum Baju Adat Sumbawa',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      height: 1.3325,
                      color: Color(0xff000000),
                      decorationColor: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // frame25rxj (10:1170)
                  margin: EdgeInsets.fromLTRB(1, 0, 3, 30),
                  padding: EdgeInsets.fromLTRB(17, 0, 17, 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff000000)),
                  ),
                  child: Center(
                    // theinfectioncomesasfeveratnigh (10:1171)
                    child: SizedBox(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 318,
                        ),
                        child: Text(
                          sejarahUmumList.isNotEmpty
                              ? sejarahUmumList[0].description
                              : 'Loading...',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.7142857143,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
