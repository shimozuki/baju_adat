import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pakaian_adat/screeen/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 30, 0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 19),
                child: Text(
                  'Ragam Baju Adat Sumbawa',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ),
              Container(
                // weregladthatthatyouarehereVxP (111:220)
                margin: EdgeInsets.fromLTRB(0, 0, 0, 11),
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
                child: Text(
                  'Ragam Baju Adat Nusta Tenggara Barat',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 106),
                width: 675,
                height: 328,
                child: Image.asset('assets/Removal-151.png'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(50, 0, 50.89, 39),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Container(
                    width: double.infinity,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 114, 244, 137),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          'Lets get started',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.1725,
                            color: Color.fromARGB(255, 5, 5, 5),
                          ),
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
    );
  }
}
