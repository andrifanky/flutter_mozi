import 'package:flutter/material.dart';
import 'package:flutter_mozi/config/styles/styles.dart';
import 'package:flutter_mozi/detail_page.dart';
import 'package:flutter_mozi/widgets/bottom_nav_bar_button.dart';
import 'package:flutter_mozi/widgets/top_movie.dart';
import 'package:flutter_mozi/widgets/tv_series.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mozi',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: blueColor,
          background: darkColor,
          surface: Colors.transparent,
          surfaceTint: Colors.transparent
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _bottomNavActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Row(
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Image.asset('assets/images/icons/ic_profile.png'),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning,', style: poppins12Regular.copyWith(color: darkGreyColor)),
                const SizedBox(height: 5),
                Text('Alex Samm', style: poppins14Medium)
              ],
            )
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            height: 22,
            width: 22,
            child: Image.asset('assets/images/icons/ic_notification.png')
          )
        )
      ],
    );
  }

  Widget body() {
    return ListView(
      children: [
        topMovieContent(),
        tvSeriesContent()
      ],
    );
  }

  Widget topMovieContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: defaultMargin, top: defaultMargin, right: defaultMargin, bottom: 12),
          child: Row(
            children: [
              Text('Top Movie', style: poppins20Medium),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact
                ),
                child: Text('See more', style: poppins14Light.copyWith(color: darkGreyColor))
              )
            ],
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TopMovie(
                image: 'assets/images/cover/avatar_cover.png',
                title: 'Avatar',
                rating: 5
              ),
              TopMovie(
                image: 'assets/images/cover/joker_cover.png',
                title: 'Joker',
                rating: 4.5
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget tvSeriesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: defaultMargin, top: defaultMargin, right: defaultMargin, bottom: 12),
          child: Row(
            children: [
              Text('TV Series', style: poppins20Medium),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact
                ),
                child: Text('See more', style: poppins14Light.copyWith(color: darkGreyColor))
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            children: [
              TVSeries(
                image: 'assets/images/thumbnails/behind_her_eyes_thumbnail.png',
                genre: 'Drama',
                title: 'Behind Her Eyes',
                rating: 4.5,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
                }
              ),
              TVSeries(
                image: 'assets/images/thumbnails/money_heist_thumbnail.png',
                genre: 'Crime',
                title: 'Money Heist',
                rating: 4,
                onTap: () {}
              )
            ],
          ),
        )
      ],
    );
  }

  Widget bottomNavBar() {
    return SizedBox(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomNavBarButton(
            activeStatus: bottomNavBarActiveStatus(0),
            icon: 'assets/images/icons/ic_home.png',
            label: 'Home',
            color: bottomNavBarIconColor(0),
            onTap: () {
              setState(() {
                _bottomNavActiveIndex = 0;
              });
            }
          ),
          BottomNavBarButton(
            activeStatus: bottomNavBarActiveStatus(1),
            icon: 'assets/images/icons/ic_search.png',
            label: 'Explore',
            color: bottomNavBarIconColor(1),
            onTap: () {
              setState(() {
                _bottomNavActiveIndex = 1;
              });
            }
          ),
          BottomNavBarButton(
            activeStatus: bottomNavBarActiveStatus(2),
            icon: 'assets/images/icons/ic_save.png',
            label: 'You',
            color: bottomNavBarIconColor(2),
            onTap: () {
              setState(() {
                _bottomNavActiveIndex = 2;
              });
            }
          ),
          BottomNavBarButton(
            activeStatus: bottomNavBarActiveStatus(3),
            icon: 'assets/images/icons/ic_user.png',
            label: 'You',
            color: bottomNavBarIconColor(3),
            onTap: () {
              setState(() {
                _bottomNavActiveIndex = 3;
              });
            }
          )
        ],
      ),
    );
  }

  Color bottomNavBarIconColor(int index) {
    if (index == _bottomNavActiveIndex) {
      return blueColor;
    }
    return greyColor;
  }

  bool bottomNavBarActiveStatus(int index) {
    if (index == _bottomNavActiveIndex) {
      return true;
    }
    return false;
  }
}
