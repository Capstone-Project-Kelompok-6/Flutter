import 'package:flutter/material.dart';
import 'package:flutter_capstone_6/component/colors.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/booking_offline_class_detail.dart';
import 'package:flutter_capstone_6/screen/main/booking/offline_class/booking_offline_view_model.dart';
import 'package:provider/provider.dart';

class BookingOfflineClass extends StatefulWidget {
  const BookingOfflineClass({Key? key}) : super(key: key);

  @override
  State<BookingOfflineClass> createState() => _BookingOfflineClassState();
}

class _BookingOfflineClassState extends State<BookingOfflineClass> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            searchBarItem(),
            const SizedBox(height: 24),
            Consumer(builder: (context, OfflineClassViewModel data, child) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.getDatas.length,
                itemBuilder: (context, index) {
                  final classData = data.getDatas[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingOfflineClassDetail(
                                  classId: classData.classId,
                                  classTitle: classData.workout,
                                  classImage: classData.workoutImage,
                                  classInstructor: classData.instructorName,
                                  classDesc: classData.description,
                                  classSchedule: classData.classDates,
                                  price: classData.price)));
                    },
                    child: offlineClassCard(context, classData.workoutImage,
                        classData.workout, classData.classDates),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget offlineClassCard(
      BuildContext context, String? image, String? title, List? schedule) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: image != null
                ? Image.network(
                    image,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: white,
                  ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: n100,
                    ),
                  ),
                  const Text(
                    "Class Schedule : ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: n60,
                    ),
                  ),
                  // ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     itemCount: schedule!.length,
                  //     itemBuilder: (context, index) {
                  //       return Text(
                  //         schedule[index],
                  //         style: const TextStyle(
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w400,
                  //           color: n60,
                  //         ),
                  //       );
                  //     }),

                  Wrap(alignment: WrapAlignment.start, children: [
                    for (int i = 0; i < schedule!.length; i++)
                      Text(
                        (schedule[i] as String).split(',')[0] +
                            ((schedule.length - 1 == i) ? '' : ' - '),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: n60,
                        ),
                      ),
                  ]),

                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [

                  //     // Text(
                  //     //   schedule![0],
                  //     //   style: const TextStyle(
                  //     //     fontSize: 12,
                  //     //     fontWeight: FontWeight.w400,
                  //     //     color: n60,
                  //     //   ),
                  //     // ),

                  //   ],
                  // ),
                ],
              ))
        ],
      ),
    );
  }

  Widget searchBarItem() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        // inputFormatters: [LengthLimitingTextInputFormatter(20)],
        // controller: _titleController,
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
          // prefixIcon: Container(
          //   margin: const EdgeInsets.only(
          //       left: 20, right: 8, top: 14, bottom: 14),
          //   child: SvgPicture.asset(
          //     'assets/icons/search.svg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: n20,
          ),
        ),
      ),
    );
  }
}
