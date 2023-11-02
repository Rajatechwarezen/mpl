import 'package:flutter/material.dart';
import 'package:mplpro/screen/component/imageComponet.dart';
import 'package:mplpro/screen/home.dart';
import 'package:mplpro/screen/wallet/wallet.dart';
import 'package:mplpro/utilis/alinement.dart';
import 'package:mplpro/utilis/borderbox.dart';
import 'package:mplpro/utilis/fontstyle.dart';

class NavBarMusicWidget extends StatefulWidget {
  const NavBarMusicWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavBarMusicWidgetState createState() => _NavBarMusicWidgetState();
}

class _NavBarMusicWidgetState extends State<NavBarMusicWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: borderT,
      ),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButtonapp(text: "Play", icon: 'assets/icon/play.png'),
              TextButtonapp(text: "Criket", icon: 'assets/icon/cricket.png'),
              TextButtonapp(text: "Offer", icon: 'assets/icon/offer.png'),
                  
             GestureDetector(
              onTap: (){
                  showModalBottomSheet<void>(
                                showDragHandle: true,
                                useSafeArea : true,
                                isScrollControlled: true,
                                elevation: 8,
                                context: context,
                                builder: (BuildContext context) {
                                  return MyWallet();
                                });
              },
              child:  TextButtonapp(text: "Wallet", icon: 'assets/icon/wallet.png'),
             )
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
TextButtonapp({text, icon}) {
  return TextButton(
    onPressed: () {
      // Add your onPressed logic here
    },
    style: TextButton.styleFrom(
      backgroundColor:
          Colors.transparent, // Make the button background transparent
      padding: EdgeInsets.zero, // Remove the default padding
    ),
    child: Column(
      crossAxisAlignment: AlignmentCenterCross,
      mainAxisAlignment: AlignmentCenterMain,
      children: [
        ImageComponent(myWidth: 30.0, myheight: 30.0, myImage: icon),

        const SizedBox(
            width: 8), // Adjust the spacing between icon and label as needed
        Text(
          text.toString(),
          style: CustomStyles.textExternel,
        ),
      ],
    ),
  );
}
