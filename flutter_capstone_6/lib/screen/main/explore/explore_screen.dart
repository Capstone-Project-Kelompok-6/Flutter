import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteBg,
        appBar: AppBar(
          backgroundColor: whiteBg,
          elevation: 0,
          title: const Text(
            'Explore',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: n100,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar Section
              const SizedBox(height: 16),
              searchBarItem(),

              // Videos Section
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Videos',
                    style: TextStyle(
                      color: n100,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: n5,
                    ),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: violet,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    videoCard('img1.png', 'Gym from home', '04:52'),
                    videoCard('img2.png', 'Yoga meditation', '04:12'),
                    videoCard('img3.png', 'Zumba', '04:56'),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget videoCard(String image, String title, String duration) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 16),
      width: 216,
      height: 119,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/explore/$image'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: n100.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: white,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: n100,
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget searchBarItem() {
    return Container(
      padding: const EdgeInsets.only(right: 25),
      height: 50,
      child: TextFormField(
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,

        decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: const TextStyle(
              fontSize: 16,
              color: n20,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: n100),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: n60)),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 8, top: 14, bottom: 14),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
