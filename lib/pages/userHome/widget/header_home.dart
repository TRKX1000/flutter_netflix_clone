import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/utils/image_assets.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key, required this.avatarImage}) : super(key: key);

  final String avatarImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 0),
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                height: 40,
                image: AssetImage(ImageAssets.imageNNetflix),
              ),
              Expanded(child: Container()),
              IconButton(
                splashRadius: 20,
                icon: const Image(
                  color: Colors.white,
                  height: 25,
                  image: AssetImage(
                    ImageAssets.imageSearch,
                  ),
                ),
                onPressed: () => {},
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      avatarImage,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
