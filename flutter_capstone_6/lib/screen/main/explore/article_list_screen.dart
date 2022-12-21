import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/article/article_rows.dart';
import 'package:flutter_capstone_6/screen/main/explore/article_detail_screen.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({Key? key, required this.articleRows})
      : super(key: key);
  final List<ArticleRows>? articleRows;

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  TextEditingController searchbarController = TextEditingController();
  String searchText = '';

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
              for (int i = 0; i < widget.articleRows!.length; i++)
                if (widget.articleRows![i].title
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleDetailScreen(
                                    articleRows: widget.articleRows,
                                    index: i,
                                  )));
                    },
                    child: articleCard(widget.articleRows![i].articleImage,
                        widget.articleRows![i].title),
                  ),

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
        controller: searchbarController,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: const InputDecoration(
          fillColor: white,
          labelText: 'Search',
          labelStyle: TextStyle(
            fontSize: 16,
            color: n20,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: n100),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: n60)),
          contentPadding: EdgeInsets.all(12),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: n20,
          ),
        ),
      ),
    );
  }

  Widget articleCard(String image, String title) {
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
            child: Image.network(
              image,
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
              // Row(
              //   children: [
              //     SvgPicture.asset(
              //       'assets/icons/password_unfocus.svg',
              //       width: 18,
              //       height: 18,
              //     ),
              //     const SizedBox(width: 8),
              //     Text(
              //       view,
              //       style: const TextStyle(
              //         fontSize: 12,
              //         fontWeight: FontWeight.w600,
              //         color: n40,
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}
