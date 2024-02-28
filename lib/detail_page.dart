import 'package:flutter/material.dart';
import 'package:flutter_mozi/config/styles/styles.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool _saveStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body()
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_outlined, size: 22)
      ),
      title: Text('Details Movie', style: poppins18Medium),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _saveStatus = !_saveStatus;
            });
          },
          icon: SizedBox(
            height: 24,
            width: 24,
            child: _saveStatus ?
            Image.asset('assets/images/icons/ic_save_filled.png') :
            Image.asset('assets/images/icons/ic_save.png')
          )
        )
      ],
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(defaultMargin),
            children: [
              Hero(
                tag: 'tvSeriesHero_Behind Her Eyes',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.asset('assets/images/cover/behind_her_eyes_cover.png')
                ),
              ),
              const SizedBox(height: 12),
              Text('Behind Her Eyes', style: poppins20Medium),
              Row(
                children: [
                  Text('Director: Erik Richter Strand | ', style: poppins14Light.copyWith(color: greyColor)),
                  const Icon(Icons.star_rounded, color: orangeColor),
                  Text('4,9', style: poppins14Light.copyWith(color: greyColor))
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: tagBGColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text('Drama', style: poppins14Regular.copyWith(color: tagTextColor))
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: tagBGColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text('Supernatural fiction', style: poppins14Regular.copyWith(color: tagTextColor))
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text('Storyline', style: poppins20Medium),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Adele is a Scottish heiress whose extremely wealthy family owns estates and grounds. When she was a teenager.',
                      style: poppins14Light.copyWith(color: darkGreyColor)
                    ),
                    TextSpan(
                      text: ' Read More',
                      style: poppins14Light.copyWith(color: blueColor)
                    )
                  ]
                )
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              backgroundColor: blueColor,
              foregroundColor: whiteColor
            ),
            child: Text('Watch Movie', style: poppins18Medium)
          ),
        )
      ],
    );
  }
}
