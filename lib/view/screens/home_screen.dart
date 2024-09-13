import 'package:flutter/material.dart';
import 'package:meui_project/app_constants/constants.dart';
import 'package:meui_project/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _topList = [
    "Latest",
    "Jobs",
    "Properties",
    "Cars",
    "Services",
    "Plans",
    "Business",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "meui",
          style: TextStyle(
            color: const Color(0xff2d2b75),
            fontWeight: FontWeight.w900,
            fontSize: 4.h,
          ),
        ),
        elevation: 0.7,
      ),
      body: Column(
        children: [
          SizedBox(height: 4.w),
          _topListWidget(),
          _searchWidget(),
          _cardWidget(),
        ],
      ),
    );
  }

  Widget _searchWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          fillColor: Constants.grey,
          filled: true,
          suffixIcon: const Icon(Icons.display_settings_rounded),
          prefixIcon: const Icon(Icons.search),
          suffixIconConstraints: const BoxConstraints(),
          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.w),
          hintText: "Search",
          hintStyle: TextStyle(color: Constants.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  Widget _topListWidget() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _topList.length,
        itemBuilder: (context, index) {
          final item = _topList[index];

          return Text(item);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 4.w);
        },
      ),
    );
  }

  Widget _cardWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UAE pays tribute to life and gegacy of Sheikh Khalifa",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 1.5.h,
            ),
          ),
          Text(
            "UAE remember Sheikh Khaliafa bin Zayed AI Nahyan on anniversary of his death",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 1.3.h,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Image.network(
              "https://allpicts.in/wp-content/uploads/2018/03/Natural-Images-HD-1080p-Download-with-Keyhole-Arch-at-Pfeiffer-Beach.jpg"),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "UAE remember Sheikh Khaliafa bin Zayed AI Nahyan on anniversary of his death",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 1.3.h,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Image.network(
              "https://allpicts.in/wp-content/uploads/2018/03/Natural-Images-HD-1080p-Download-with-Keyhole-Arch-at-Pfeiffer-Beach.jpg"),
        ],
      ),
    );
  }
}
