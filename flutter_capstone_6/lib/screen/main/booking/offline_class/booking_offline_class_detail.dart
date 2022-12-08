import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/payment_booking_class.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';

class BookingOfflineClassDetail extends StatefulWidget {
  const BookingOfflineClassDetail({Key? key}) : super(key: key);

  @override
  State<BookingOfflineClassDetail> createState() =>
      _BookingOfflineClassDetailState();
}

class _BookingOfflineClassDetailState extends State<BookingOfflineClassDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, 'Yoga'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // workout image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/explore/img2.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // instructor name
              const SizedBox(height: 24),
              const Text(
                'Endah',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),

              // divider
              divider(),

              // informations
              const Text(
                'Informations',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: violet,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Pada kelas ini akan melatih basic, vinyasa dan power yoga sesuai dengan tubuh Anda masing-masing. Selama yoga kita akan memfokuskan diri hanya ke tubuh nafas dan konsentrasi penuh. Kelas ini akan diajar oleh Endah seorang instruktur berpengalaman mengajar yoga selama 2 tahun.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: n80,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Time Schedule :",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: n100,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sunday : 14.00 - 18.00\nSunday : 14.00 - 18.00\nSunday : 14.00 - 18.00",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: n80,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        width: double.infinity,
        height: 76,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: n40.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 3,
            )
          ],
          color: white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Total Payment",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: n100,
                  ),
                ),
                Text(
                  "Rp.500.000/ month",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: violet,
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: const Center(
                            child: Text(
                              "Buy Yoga Class ?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: violet,
                              ),
                            ),
                          ),
                          titlePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          contentPadding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 12,
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // cancel button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: white,
                                  minimumSize: const Size(140, 48),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: violet),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: violet,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              // booking button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentOfflineClass()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: violet,
                                  minimumSize: const Size(140, 48),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: const Text(
                                  "Booking Now",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  primary: violet,
                  minimumSize: const Size(146, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Column(
      children: const [
        SizedBox(height: 10),
        Divider(
          height: 12,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: n20,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
