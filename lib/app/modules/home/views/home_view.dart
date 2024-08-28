import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interview_practise/app/modules/home/views/scroll_widget.dart';
import 'package:interview_practise/models/customer_model.dart';
import 'package:interview_practise/utils/app_colors.dart';
import 'package:interview_practise/utils/constant.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RxList<CustomerModel> customerList = <CustomerModel>[].obs;

  @override
  void initState() {
    customerList.value = Common.getCustomerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.5),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                      height: 150,
                      width: Get.width - 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Manager customer",
                            style: Get.theme.textTheme.bodyLarge,
                          ),
                          Icon(Icons.filter)
                        ],
                      )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                      ),
                      child: ScrollWidget(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                // maxWidth: Get.width -200,
                                  minWidth: 1250

                              ),

                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Customer Name",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 25),
                                  Text(
                                    "locations",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 25),
                                  Text(
                                    "Emails",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                customerList.length,
                                (row) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      1,
                                      (col) {
                                        int index = row * 1 + col;
                                        if (index < customerList.length) {
                                          return _reviewItem(index);
                                        } else {
                                          return Container(); // Empty container if no data
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewItem(int index) {
    CustomerModel customer = customerList[index];
    return Container(
      constraints: BoxConstraints(
        // maxWidth: Get.width -200,
          minWidth: 1250


      ),
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            customer.customerName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            customer.location,
            overflow: TextOverflow.ellipsis,

            style: TextStyle(color: Colors.white),
          ),
          Text(
            customer.email,
            overflow: TextOverflow.ellipsis,

            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
