// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pakaian_adat/Controller/DetailMusic_Controller.dart';
import 'package:pakaian_adat/model/music_model.dart';

class Materi extends StatefulWidget {
  final int id;

  const Materi({Key? key, required this.id}) : super(key: key);

  @override
  State<Materi> createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  late Future<Music> musicDetail;

  @override
  void initState() {
    super.initState();
    musicDetail = DetailMusicController.getMusicById(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Music>(
        future: musicDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data found');
          } else {
            Music music = snapshot.data!;
            return SafeArea(
              child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  title: Text(
                    '',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff000000),
                    ),
                  ),
                  backgroundColor: const Color(0xffffffff),
                  centerTitle: false,
                  iconTheme: const IconThemeData(
                    color: Color(0xff000000), // Ubah warna icon menjadi hitam
                  ),
                  elevation: 0,
                ),
                body: DefaultTabController(
                  length: 4,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            height: 285,
                            child: Image.network(
                                'https://musik-tradisionalsumbawa.com/${music.image}')),
                        Container(
                          width: double.infinity,
                          height: 470,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 25,
                                top: 9,
                                child: Container(
                                  width: 244,
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                        child: Text(
                                          '${music.namaAlat}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            height: 1.1725,
                                            color: Color(0xff3e3e3e),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Text(
                                          '${music.author.name}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1725,
                                            color: Color(0xff3e3e3e),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 75,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.white,
                                  child: TabBar(
                                    indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 114, 244, 137),
                                        width: 2.5,
                                      ),
                                    ),
                                    labelPadding:
                                        EdgeInsets.only(left: 0, right: 9),
                                    tabs: [
                                      Tab(text: 'Sejarah'),
                                      Tab(text: 'Tutorial'),
                                      Tab(text: 'Pembuatan'),
                                      Tab(text: 'Perawatan'),
                                    ],
                                    labelColor:
                                        Color.fromARGB(255, 114, 244, 137),
                                    unselectedLabelColor:
                                        Color.fromARGB(215, 170, 170, 170),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 130,
                                left: 20,
                                right: 25,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      1.0, // Adjust this height as needed
                                  child: TabBarView(
                                    children: [
                                      Center(
                                        child: SingleChildScrollView(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0),
                                            width: double.infinity,
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  color: Color(0xff000000),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '${music.sejarah}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: SingleChildScrollView(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0),
                                            width: double.infinity,
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  color: Color(0xff000000),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '${music.tutorial}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: SingleChildScrollView(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0),
                                            width: double.infinity,
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  color: Color(0xff000000),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '${music.pembuatan}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: SingleChildScrollView(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0),
                                            width: double.infinity,
                                            child: RichText(
                                              text: TextSpan(
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  color: Color(0xff000000),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '${music.perawatan}',
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
