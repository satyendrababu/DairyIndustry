import 'package:dairy_industry_conference/screens/venue/MapWidget.dart';
import 'package:dairy_industry_conference/screens/widgets/CardWithIconAndText.dart';
import 'package:dairy_industry_conference/screens/widgets/TextTitle.dart';
import 'package:dairy_industry_conference/utils/size_config.dart';
import 'package:flutter/material.dart';

class VenueBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
              'assets/images/home-bg.png',
              fit: BoxFit.cover,
            )
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              const TextTitle(text: 'Venue'),
              SizedBox(height: getProportionateScreenHeight(25)),
              const CardWithIconAndText(
                  icon: 'assets/icons/mail.png',
                  text: 'HITEX Exhibition Center, \nHyderabad'
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              MapWidget()

            ],
          ),
        )
      ],
    );
  }

}