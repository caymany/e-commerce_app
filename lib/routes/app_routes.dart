import 'package:devhub_kenya/features/authentication/screens/login/login.dart';
import 'package:devhub_kenya/features/authentication/screens/onboarding/onboarding.dart';
import 'package:devhub_kenya/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:devhub_kenya/features/authentication/screens/signup/signup.dart';
import 'package:devhub_kenya/features/personalization/screens/address/address.dart';
import 'package:devhub_kenya/features/personalization/screens/profile/profile.dart';
import 'package:devhub_kenya/features/personalization/screens/settings/settings.dart';
import 'package:devhub_kenya/features/shop/screens/cart/cart.dart';
import 'package:devhub_kenya/features/shop/screens/checkout/checkout.dart';
import 'package:devhub_kenya/features/shop/screens/home/home.dart';
import 'package:devhub_kenya/features/shop/screens/orders/orders.dart';
import 'package:devhub_kenya/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:devhub_kenya/features/shop/screens/store/store.dart';
import 'package:devhub_kenya/features/shop/screens/wishlist/wishlist.dart';
import 'package:devhub_kenya/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreeen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}