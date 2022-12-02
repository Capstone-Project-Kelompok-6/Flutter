import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: AppBar(
        title: const Text(
          'Article',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: n100,
          ),
        ),
        centerTitle: true,
        backgroundColor: whiteBg,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/arrow_back.svg',
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/explore/img15.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Benefits of green tea for metabolism",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "It's a tantalizing idea, isn't it, that we could burn stored fat simply by nibbling or sipping on something that tastes good.\n\n Plenty of companies are now capitalizing on the allure of 'metabolism boosting' foods and drinks. Among the most-hyped substance is green tea — for its supposed powers as an aid for weight loss and weight maintenance.\n\n You don't have to look hard to find these claims. Dr. Oz has asserted that just one cup of his Tangerine Weight-Orade, which contains green tea, will 'boost metabolism 12 percent.' Women's Health magazine described 'reen tea's weight-loss magic even in ice cream. And dozens of green tea drinks and pills for sale claim to help you burn more fat.\n\n There's a long tradition in East Asia of drinking green tea for health. But as scientists have tried to test the belief that green tea will help you keep off the pounds, they've largely come up short.\n\n Take the work of Rick Hursel of Maastricht University Medical Centre in the Netherlands. He published a review study that found green tea may slightly increase metabolism.\n\n We've shown that green tea is able to increase your energy expenditure — so the amount of calories you burn — and also to increase the amount of fat you are burning, Hursel told NPR's Allison Aubrey in 2012.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: n80,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        "Articles",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n60,
                        ),
                      ),
                      const SizedBox(width: 40),
                      // Views
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/password_unfocus.svg',
                              height: 18, width: 18),
                          const SizedBox(width: 5),
                          const Text(
                            '1.2k views',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: n60,
                            ),
                          )
                        ],
                      ),
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
                  articleCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget articleCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: n20),
        color: white,
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
