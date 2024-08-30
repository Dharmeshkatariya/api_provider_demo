import 'dart:io';

import '../../models/customer_model.dart';
import '../../models/review.dart';
import '../export.dart';

class CommonWidget {

  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        twitterLogo,
        color: AppColors.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }



  static List<CustomerModel> getCustomerData(){
    List<CustomerModel> cList = [];


    var name = [
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",
      "Urgent Care Hospital",


    ];
    var locations = [
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
      "Surat Varacha main road" ,
    ];
    var emails = [
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",
      "katariyadharmesh658@gmail.com",

    ];
    for (int i = 0; i < name.length; i++) {
      CustomerModel customerModel = CustomerModel();
      customerModel.customerName = name[i];
      customerModel.location = locations[i];
      customerModel.email = emails[i];

      cList.add(customerModel);
    }
    return cList ;

  }


  static List<ReviewData> reviewData() {
    List<ReviewData> reviewList = [];


    var name = ["Sharon Jem", "Amy Gary", "Sharon Gary",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",

    ];
    var time = ["1d ago", "2d ago", "5d ago",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
    ];
    var desc = [
      "Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits.",
      "Maria has been amazing! 💪 Joining his coaching has been transformational for me and she makes it so much fun to workout with her I ve had several personal training experiences and this one is by far the best. Maria may very well be the best personal trainer in this app 😉",
      "Maria has been amazing! 💪 Joining his coaching has been transformational for me and she makes it so much fun to workout with her I ve had several personal training experiences and this one is by far the best. Maria may very well be the best personal trainer in this app 😉",
      "Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits."
          "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",
      "Amy Jem",

    ];
    for (int i = 0; i < name.length; i++) {
      ReviewData review = ReviewData();
      review.uName = name[i];
      review.discrption = desc[i];
      review.uTime = time[i];

      reviewList.add(review);
    }

    return reviewList;
  }



  static String mobileNumber = "";
  static String fcmToken = "";
  static String androidSound = "jetsons_doorbell";
  static String iosSound = "jetsons_doorbell.mp3";

  static Widget cacheCarouselSlider(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        height: 30.h,
        width: double.infinity,
        maxWidthDiskCache: 5000,
        maxHeightDiskCache: 5000,
        progressIndicatorBuilder: (_, __, progress) =>
            Center(child: Utility.animationLoader()),
      ),
    );
  }

  static Widget dividerRow() {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: const Text(
              "  OR  ",
              style: TextStyle(
                color: AppColors.black,
                // fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  static Widget cmnPositionWidget({
    required void Function() ontap,
    required Widget createWidget,
  }) {
    return Positioned(
      bottom: 10.h,
      right: 20.w,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: ontap,
          child: CircleAvatar(
            // backgroundColor: AppColors.navyBlue.withOpacity(0.1),
              backgroundColor: AppColors.white,
              radius: 15.r,
              child: createWidget),
        ),
      ),
    );
  }

  static Widget circleAvatarFilePath(String img) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 0.6,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 60.r,
        backgroundImage: FileImage(File(img)),
      ),
    );
  }

  static Widget circleAvatarUser(String img) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 0.6,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 60.r,
        backgroundImage: AssetImage(img),
      ),
    );
  }

  static Widget commonNetworkImage(String userImage, double radius) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: radius,
        backgroundImage: NetworkImage(userImage),
      ),
    );
  }

  static Widget commonAssetImage(String userImage, double radius) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: radius,
        backgroundImage: AssetImage(userImage),
      ),
    );
  }

  static Widget circleNetworkImage(String userImage) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 60.r,
        backgroundImage: NetworkImage(userImage),
      ),
    );
  }

  static Widget googleNetworkImage(String userImage) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 8.r,
        backgroundImage: NetworkImage(userImage),
      ),
    );
  }

  // static Widget cmnUserProfile(String imgPath) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: AppColors.white,
  //         borderRadius: BorderRadius.circular(Responsive.width * 25),
  //         border: Border.all(color: AppColors.appColor, width: 3)),
  //     height: Responsive.height * 14,
  //     width: Responsive.width * 28,
  //     child: Image.asset(
  //       imgPath,
  //       fit: BoxFit.fill,
  //     ),
  //   );
  // }

  static Widget cmnCacheNetworkImg(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2.h),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        height: 25.h,
        width: 25.w,
        maxWidthDiskCache: 5000,
        maxHeightDiskCache: 5000,
        progressIndicatorBuilder: (_, __, progress) =>
            Center(child: Utility.animationLoader()),
      ),
    );
  }

  static Widget bookEmptyTxt({String? text}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}