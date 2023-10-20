import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:monitoringdata_excel/core/constant/appNameRouts.dart';
import 'package:monitoringdata_excel/view/screens/about_us/about_us.dart';
import 'package:monitoringdata_excel/view/screens/auth/login.dart';
import 'package:monitoringdata_excel/view/screens/auth/signin.dart';
import 'package:monitoringdata_excel/view/screens/home/home.dart';
import 'package:monitoringdata_excel/view/screens/profile/profilescreen.dart';
import 'package:monitoringdata_excel/view/screens/splash/splash.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: "/",
  //   page: () => const Home(),
  // ),
  GetPage(
    name: "/",
    page: () => const SplashScreen(),
  ),
  // GetPage(
  //     name: AppRoutsName.choceLang,
  //     page: () => const ChooseLanguage(),
  //     middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoutsName.login, page: () => const LogIn()),
  // GetPage(name: AppRoutsName.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutsName.signUp, page: () => const SignIn()),
  // GetPage(
  //     name: AppRoutsName.forgetPassword, page: () => const ForgetPassword()),
  // GetPage(name: AppRoutsName.veryfiCode, page: () => const VeryfiCode()),
  // GetPage(name: AppRoutsName.resetPassword, page: () => const ResetPassword()),
  // GetPage(
  //     name: AppRoutsName.veryfiCodeSignAndLogIn,
  //     page: () => const VerFiriCodeSignAndLOgIn()),
  GetPage(name: AppRoutsName.home, page: () => const Home()),
  // GetPage(
  //     name: AppRoutsName.resturantScreen, page: () => const ResturantScreen()),
  // GetPage(name: AppRoutsName.settings, page: () => const Setting()),
//  GetPage(name: AppRoutsName.profile, page: () => const Profile()),
  // GetPage(name: AppRoutsName.chanePassword, page: () => const ChangePassword()),
  GetPage(name: AppRoutsName.profilescreen, page: () => const ProfileScrren()),
  // GetPage(name: AppRoutsName.order, page: () => const YourOrders()),
  // GetPage(
  //     name: AppRoutsName.homebuttonApbar,
  //     page: () => const CustomBottomNavBar()),
  // GetPage(
  //     name: AppRoutsName.bottmapbarcategories,
  //     page: () => const CustomCategoriesBotomApbar()),
  // GetPage(
  //     name: AppRoutsName.resturantbotomapbar,
  //     page: () => const CustomResturantBotomApbar()),
  // GetPage(
  //     name: AppRoutsName.resturantdescscreen,
  //     page: () => const ResturantDescScreen()),

  // GetPage(
  //     name: AppRoutsName.resturandisctbotomapbar,
  //     page: () => const CustomResturantDisBotomApbar()),
  // GetPage(
  //     name: AppRoutsName.bottmapbarcategoriesdescr,
  //     page: () => const CustomCategoriesDisBotomApbar()),

  // GetPage(name: AppRoutsName.itemsDetails, page: () => const ItemDetails()),
  // GetPage(name: AppRoutsName.viewAddress, page: () => const ViewAddress()),
  // GetPage(name: AppRoutsName.addAddress, page: () => const AddAddress()),

  // GetPage(name: AppRoutsName.notification, page: () => const Notifications()),
  // GetPage(name: AppRoutsName.carttest, page: () => const CartTest()),
  // GetPage(
  //     name: AppRoutsName.addAddressPartTow,
  //     page: () => const AddAddressParTow()),
  // GetPage(name: AppRoutsName.editProfile, page: () => const EditeProfile()),
  // GetPage(name: AppRoutsName.cartId, page: () => const CartId()),
  // GetPage(name: AppRoutsName.checkOut, page: () => const CheckOut()),
  // GetPage(name: AppRoutsName.orderId, page: () => const OrderId()),
  GetPage(name: AppRoutsName.aboutUs, page: () => const AboutUs()),
  // GetPage(name: AppRoutsName.trackingOrder, page: () => const Trackingorder()),
];
