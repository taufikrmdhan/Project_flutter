import 'package:flutter/material.dart';
import 'package:onboard/home_page.dart';

import 'colors.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _halKontrol = PageController(initialPage: 0);
  // int _halSekarang = 0;
   int _halSekarang;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _halKontrol,
                // parameter controller berfungsi sebagai pengontrol page view untuk menampilkan dari apa yang ditampilkan
                onPageChanged: (int halaman) {
                  _halSekarang = halaman;
                  setState(() {});
                },
                // akan dijalankan ketika kita scroll halaman, set state berfungsi untuk memberi tau bahwa ada state yang berubah
                children: [
                  _buildPageContent(
                      isShowImageOnTop: false,
                      image: 'assets/image/logoitc.png',
                      body: 'Selamat Datang di ITC \n Mobile Development ',
                      desc:
                          "ITC 2021 datang kembali dengan membawa banyak manfaat untuk kamu yang baru saja ingin berkenalan tentang teknologi masa kini sebagai bekal kamu saat berkuliah di Universitas Amikom Yogyakarta",
                      color: midnightBlue),
                  _buildPageContent(
                      isShowImageOnTop: true,
                      image: 'assets/image/fulogo.png',
                      body: 'Yuk kenalan dengan divisi yang ada di ITC',
                      desc:
                          "ITC mempunyai 4 divisi diantara nya yaitu Mobile development, E-Commerce, Komgraf, dan Office",
                      color: midnightBlue),
                  _buildPageContent(
                      isShowImageOnTop: false,
                      image: 'assets/image/pengenalan.png',
                      body: 'Introduction to Computer',
                      desc:
                          "Introduction To Computer (ITC) adalah kegiatan rutin Universitas Amikom Yogyakarta yang dikhususkan bagi mahasiswa baru untuk mendalami dunia komputer sebelum perkuliahan reguler.",
                      color: midnightBlue)
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: (_halSekarang != 2)
                    ? InkWell(
                        child: Container(
                          height: 40,
                          width: 60,
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        onTap: () {
                          _halKontrol.animateToPage(2,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                      )
                    : InkWell(
                        child: Container(
                          height: 60,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            'Start',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        },                        
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(
      {String image, String body, String desc, Color color, isShowImageOnTop}) {
    return Container(
      decoration: BoxDecoration(color: color),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isShowImageOnTop)
            Column(
              children: [
                Center(child: Image.asset(image)),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70),
                ),
              ],
            ),
          if (isShowImageOnTop)
            Column(
              children: [
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(image, width: 200,),
                ),
              ],
            )
        ],
      ),
    );
  }
}
