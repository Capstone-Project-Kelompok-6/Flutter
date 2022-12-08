import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/explore/article_detail_screen.dart';
import 'package:flutter_capstone_6/screen/main/explore/article_list_screen.dart';
import 'package:flutter_capstone_6/screen/main/explore/video_list_screen.dart';
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
        automaticallyImplyLeading: false,
        title: Container(
          margin: const EdgeInsets.only(left: 9),
          child: const Text(
            'Explore',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: n100,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar Section
              const SizedBox(height: 10),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VideoListScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
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
              ),

              // Popular Articles Section
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular articles this week',
                    style: TextStyle(
                      color: n100,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArticleListScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
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
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ArticleDetailScreen()));
                      },
                      child: popularArticlesCard(
                          'img4.png',
                          'Benefits of green tea for metabolism',
                          '1.52k views'),
                    ),
                    popularArticlesCard(
                        'img5.png',
                        '20-minutes Outdoor Can Make You Less Stress',
                        '3k views'),
                    popularArticlesCard(
                        'img6.png', 'Stress and premature aging', '2.4k views'),
                    popularArticlesCard(
                        'img7.png', 'Natrium behind the pack', '1.1k views'),
                    popularArticlesCard('img8.png',
                        'Not always bad, there is also good fat', '1.2k views'),
                  ],
                ),
              ),

              // Top view Section
              const SizedBox(height: 24),
              const Text(
                'Top view exercise',
                style: TextStyle(
                  color: n100,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(right: 25),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    topViewCard('img9.png', 'Body Workout', '03:12'),
                    const SizedBox(width: 26),
                    topViewCard('img10.png', 'Planking', '05:52'),
                    topViewCard('img11.png', 'Zumba', '04:22'),
                    const SizedBox(width: 26),
                    topViewCard('img12.png', 'Yoga', '04:35'),
                    topViewCard('img13.png', 'Streching', '04:59'),
                    const SizedBox(width: 26),
                    topViewCard('img14.png', 'Cardio', '03:48'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget topViewCard(String image, String title, String duration) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: 158,
          height: 143,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: n100.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: n100,
                        ),
                        child: Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: n100,
          ),
        ),
      ],
    );
  }

  Widget popularArticlesCard(String image, String title, String views) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 16),
      width: 245,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: n40.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 3,
          )
        ],
        color: white,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              'assets/explore/$image',
              height: 134,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 42,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: n100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/password_unfocus.svg',
                          height: 18, width: 18),
                      const SizedBox(width: 5),
                      Text(
                        views,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: n60,
                        ),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
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
            fillColor: white,
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
