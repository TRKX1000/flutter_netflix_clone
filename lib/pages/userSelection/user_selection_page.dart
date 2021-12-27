import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/data/user.dart';
import 'package:flutter_netflix_clone/pages/userSelection/widget/user_selection_avatar.dart';
import 'package:flutter_netflix_clone/utils/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserSelectionPage extends StatefulWidget {
  static const String keyRoute = "UserSelectionPage";
  final void Function(User user) onUserClick;

  const UserSelectionPage(
      {Key? key, required Function(User user) this.onUserClick})
      : super(key: key);

  @override
  State<UserSelectionPage> createState() => _UserSelectionPageState();
}

class _UserSelectionPageState extends State<UserSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(width: 50),
                  const Expanded(
                    child: Image(
                      height: 40,
                      image: AssetImage(ImageAssets.imageNetflixLogo),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      ImageAssets.iconEditSvg,
                      color: Colors.white,
                      height: 25,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: usersGridView(),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget usersGridView() {
    var arrayAvatars = [
      User(avatarImage: ImageAssets.imageAvatar1, name: "Luis"),
      User(avatarImage: ImageAssets.imageAvatar2, name: "Sergio"),
      User(avatarImage: ImageAssets.imageAvatar3, name: "Maria"),
      User(avatarImage: ImageAssets.imageAvatar4, name: "Carmen"),
    ];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.7,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        shrinkWrap: true,
        itemCount: arrayAvatars.length,
        itemBuilder: (ctx, index) {
          return UserSelectionAvatar(
              user: arrayAvatars[index], onUserClick: widget.onUserClick);
        },
      ),
    );
  }
}
