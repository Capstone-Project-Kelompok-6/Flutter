import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, 'Article'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar Section
              const SizedBox(height: 10),
              searchBarItem(),

              const SizedBox(height: 16),
              articleCard(
                  "img12.png",
                  "Study shows 1 billion young people are at risk for hearing loss",
                  "1.52K"),
              articleCard(
                  "img13.png",
                  "Just 2 minutes of walking after eating can help blood sugar, study says",
                  "16K"),
              articleCard(
                  "img14.png",
                  "When you eat may dictate how hungry you are, study says",
                  "1.2K"),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBarItem() {
    return SizedBox(
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

  Widget articleCard(String image, String title, String view) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: n20.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 3,
          )
        ],
        color: white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/explore/$image',
              fit: BoxFit.cover,
              width: 90,
              height: 90,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: n100,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Articles",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: n60,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/password_unfocus.svg',
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    view,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: n40,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
