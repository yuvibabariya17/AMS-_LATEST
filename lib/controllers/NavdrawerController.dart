import 'package:booking_app/controllers/theme_controller.dart';
import 'package:booking_app/core/utils/log.dart';
import 'package:booking_app/preference/UserPreference.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Models/expert.dart';
import '../Models/expert_model.dart';
import '../Models/offers.dart';
import '../Models/offers_model.dart';
import '../Models/service_item_model.dart';
import 'package:booking_app/models/SignInModel.dart';
import '../Models/service_name.dart';
import 'internet_controller.dart';

enum ScreenState { apiLoading, apiError, apiSuccess, noNetwork, noDataFound }

class NavdrawerController extends GetxController {
  var currentPage = 0;

  List pageNavigation = [];
  RxInt currentTreeView = 2.obs;

  RxBool isExpanded = false.obs;
  RxBool isTreeModeVertical = true.obs;
  var theme = Get.put(ThemeController());
  RxBool accessToDrawer = false.obs;
  DateTime selectedValue = DateTime.now();
  bool switch_state = false;
  bool switch_state1 = false;

  var icon;
  var leading;
  var isfilter;
  var title;
  DatePickerController datePickerController = DatePickerController();
  List<Service_Item> staticData = ServicesItems;
  List<ExpertItem> staticData1 = expertItems;
  List<OfferItem> staticData2 = offersItems;
  RxString picDate = "".obs;
  RxList treeList = [].obs;
  String name = '';
  String number = '';

  changeIndex(int index) async {
    currentPage = index;
    update();
  }

  final GlobalKey<ScaffoldState> drawer_key = GlobalKey();

  void drawerAction() {
    drawer_key.currentState!.openDrawer();
    update();
  }

  void closeDrawer() {
    drawer_key.currentState!.closeDrawer();
  }

  // void updateDate(date) {
  //   picDate.value = date;
  //   print("PICKED_DATE${picDate.value}");
  //   update();
  // }

  @override
  void onInit() {
    picDate.value = DateFormat.yMMMMd().format(DateTime.now());
    super.onInit();
  }

  Rx<ScreenState> state = ScreenState.apiLoading.obs;
  RxString message = "".obs;
  final InternetController networkManager = Get.find<InternetController>();

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void initDataSet(BuildContext context) async {
    logcat("Name", name.toString());
    logcat("Number", number.toString());
    SignInData? retrievedObject = await UserPreferences().getSignInInfo();

    name = retrievedObject!.userName.toString();
    number = retrievedObject.contactNo1.toString();

    //controller.statectr.text = retrievedObject.stateId.toString();
    //controller.cityctr.text = retrievedObject.cityId.toString();
    update();
  }
}
