import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/ui/tabs/hijb_tab.dart';
import 'package:quran/ui/tabs/page_tab.dart';
import 'package:quran/ui/tabs/para_tab.dart';
import 'package:quran/ui/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context,
                      bool innerBoxIsScrolled) =>
                  [
                    SliverToBoxAdapter(
                      child: _salam(),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      automaticallyImplyLeading: true,
                      shape: Border(
                          bottom: BorderSide(
                              color: const Color(0XFFAAAAAA).withOpacity(0.1))),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: _tab(),
                      ),
                    )
                  ],
              body: TabBarView(
                children: [SurahTab(), ParaTab(), PageTab(), HijbTab()],
              )),
        ),
      ),
    );
  }

  TabBar _tab() => TabBar(
        tabs: [
          _tabItem('Surah'),
          _tabItem('Hijb'),
          _tabItem('Page'),
          _tabItem('Para'),
        ],
      );

  Tab _tabItem(String label) => Tab(
        child: Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  Column _salam() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assalamu\'alaikum',
            style: GoogleFonts.plusJakartaSans(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Altop",
            style: GoogleFonts.plusJakartaSans(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          _lastRead()
        ],
      );

  Stack _lastRead() => Stack(
        children: [
          Container(
            height: 155,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset('assets/svg/quran_banner.svg')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Last Read',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Al Fatihah',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Ayat Ke-1',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          )
        ],
      );

  BottomNavigationBar _bottomNavBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          _bottomNavItem(icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
          _bottomNavItem(icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
          _bottomNavItem(
              icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark'),
        ],
      );

  BottomNavigationBarItem _bottomNavItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(icon),
          activeIcon: SvgPicture.asset(icon),
          label: label);

  AppBar _appBar() => AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/svg/quran_icon.svg'),
            const SizedBox(width: 16),
            Text(
              'Quran App',
              style: GoogleFonts.poppins(
                  color: Colors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset('assets/svg/search_icon.svg'))
        ],
      );
}
