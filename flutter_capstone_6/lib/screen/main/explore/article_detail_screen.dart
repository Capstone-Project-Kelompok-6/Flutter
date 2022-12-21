import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/model/article/article_rows.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({
    Key? key,
    required this.articleRows,
    required this.index,
  }) : super(key: key);
  final List<ArticleRows>? articleRows;
  final int index;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, 'Article'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                widget.articleRows![widget.index].articleImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.articleRows![widget.index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.articleRows![widget.index].description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: n80,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Text(
                        "Articles",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n60,
                        ),
                      ),
                      SizedBox(width: 40),
                      // Views
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     SvgPicture.asset('assets/icons/password_unfocus.svg',
                      //         height: 18, width: 18),
                      //     const SizedBox(width: 5),
                      //     const Text(
                      //       '1.2k views',
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w500,
                      //         color: n60,
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  divider(),

                  // Related Topic Section
                  const Text(
                    'Related Topic',
                    style: TextStyle(
                      color: n100,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.articleRows!.length > 3)
                    for (int i = 0; i < 3; i++)
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

                  if (widget.articleRows!.length < 4)
                    for (int j = 0; j < widget.articleRows!.length; j++)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleDetailScreen(
                                        articleRows: widget.articleRows,
                                        index: j,
                                      )));
                        },
                        child: articleCard(widget.articleRows![j].articleImage,
                            widget.articleRows![j].title),
                      ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
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

  Widget divider() {
    return Column(
      children: const [
        SizedBox(height: 16),
        Divider(
          height: 12,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: n20,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
