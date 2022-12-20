import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/booking_offline_done.dart';
import 'package:flutter_capstone_6/widget/appbar.dart';
import 'package:intl/intl.dart';

class SummaryOfflineClassDetail extends StatefulWidget {
  const SummaryOfflineClassDetail({
    Key? key,
    required this.classId,
    required this.classTitle,
    required this.classImage,
    required this.classInstructor,
    required this.classDesc,
    required this.classSchedule,
    required this.price,
    required this.createdAt,
    required this.endClassDate,
  }) : super(key: key);
  final String classId;
  final String classTitle;
  final String classImage;
  final String classInstructor;
  final String classDesc;
  final List classSchedule;
  final int price;
  final int createdAt;
  final int endClassDate;

  @override
  State<SummaryOfflineClassDetail> createState() =>
      _SummaryOfflineClassDetailState();
}

class _SummaryOfflineClassDetailState extends State<SummaryOfflineClassDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBg,
      appBar: appBar(context, widget.classTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // workout image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.classImage,
                  width: double.infinity,
                  height: 185,
                  fit: BoxFit.cover,
                ),
              ),

              // instructor name
              const SizedBox(height: 24),
              const Text(
                "Instructor:",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: n100,
                ),
              ),
              Text(
                widget.classInstructor,
                style: const TextStyle(
                  fontSize: 20,
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
              Text(
                widget.classDesc,
                textAlign: TextAlign.justify,
                style: const TextStyle(
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
                  fontWeight: FontWeight.w600,
                  color: n100,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.classSchedule.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        widget.classSchedule[index],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n80,
                        ),
                      ),
                    );
                  }),
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
              children: [
                const Text(
                  "Validity Period up to",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: n100,
                  ),
                ),
                Text(
                  DateFormat("dd MMMM yyyy").format(
                      DateTime.fromMicrosecondsSinceEpoch(
                          widget.endClassDate * 1000)),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: violet,
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingOfflineDone(
                                classTitle: widget.classTitle,
                                classInstructor: widget.classInstructor,
                                createdAt: DateTime.fromMicrosecondsSinceEpoch(
                                    widget.createdAt * 1000),
                                endClassDate:
                                    DateTime.fromMicrosecondsSinceEpoch(
                                        widget.endClassDate * 1000),
                              )));
                },
                style: ElevatedButton.styleFrom(
                  primary: violet,
                  minimumSize: const Size(146, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  "Detail",
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
