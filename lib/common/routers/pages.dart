import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youyi_wallet/common/index.dart';
import 'package:youyi_wallet/common/widgets/webview/webView.dart';
import 'package:youyi_wallet/pages/Application/index.dart';
import 'package:youyi_wallet/pages/basicinformation/index.dart';
import 'package:youyi_wallet/pages/basicinformation2/index.dart';
import 'package:youyi_wallet/pages/bindBank/bindinBankCard.dart';
import 'package:youyi_wallet/pages/confirmationloan/comfiremationSuccess/comfiremationSuccess.dart';
import 'package:youyi_wallet/pages/confirmationloan/comfirmationLoading/comfiremationLoadingController.dart';
import 'package:youyi_wallet/pages/confirmationloan/comfirmationLoading/comfirmationLoading.dart';
import 'package:youyi_wallet/pages/confirmationloan/index.dart';
import 'package:youyi_wallet/pages/confirmationloan/monthlyRepaymentDue/monthlyRepaymentDueController.dart';
import 'package:youyi_wallet/pages/confirmationloan/monthlyRepaymentDue/monthlyRepaymentDuePage.dart';
import 'package:youyi_wallet/pages/contact/index.dart';
import 'package:youyi_wallet/pages/facesuccess/index.dart';
import 'package:youyi_wallet/pages/fast/index.dart';
import 'package:youyi_wallet/pages/large/index.dart';
import 'package:youyi_wallet/pages/fastApply/controller.dart';
import 'package:youyi_wallet/pages/fastApply/view.dart';
import 'package:youyi_wallet/pages/largeApply/larageApplyEndPage.dart';
import 'package:youyi_wallet/pages/largeApply/largeApplyController.dart';
import 'package:youyi_wallet/pages/largeApply/largeApplypage.dart';
import 'package:youyi_wallet/pages/loanBasicInformation/index.dart';
import 'package:youyi_wallet/pages/main/index.dart';
import 'package:youyi_wallet/pages/frame/sign_in/index.dart';
import 'package:youyi_wallet/pages/realname/index.dart';
import 'package:youyi_wallet/pages/repayment/bindings.dart';
import 'package:youyi_wallet/pages/repayment/makeRepayment/makeRepaymentBindings.dart';
import 'package:youyi_wallet/pages/repayment/makeRepayment/makeRepaymentPage.dart';
import 'package:youyi_wallet/pages/repayment/repaymentEnd/repaymentSucces.dart';
import 'package:youyi_wallet/pages/repayment/repaymentInfo/repaymentInfoBindings.dart';
import 'package:youyi_wallet/pages/repayment/repaymentInfo/repaymentInfoView.dart';
import 'package:youyi_wallet/pages/repayment/view.dart';
import 'package:youyi_wallet/pages/reviewfail/index.dart';
import 'package:youyi_wallet/pages/reviewloading/index.dart';
import 'package:youyi_wallet/pages/reviewloading2/index.dart';
import 'package:youyi_wallet/pages/reviewsuccess/index.dart';
import 'package:youyi_wallet/pages/setting/index.dart';
import 'observers.dart';

class RoutePages {
  static const INITIAL = RouteNames.main;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
  // 列表
  static List<GetPage> routes = [
    GetPage(name: RouteNames.main, page: () => const MainPage(), binding: MainBinding()),
    GetPage(name: RouteNames.application, page: () => const ApplicationPage(), binding: ApplicationBinding()),
    GetPage(name: RouteNames.frameSignIn, page: () => SignInPage(), binding: SignInBinding()),
    GetPage(name: RouteNames.webviewPage, page: () => const WebviewPage()),
    GetPage(name: RouteNames.realname, page: () => const RealnamePage(), binding: RealnameBinding()),
    GetPage(name: RouteNames.setting, page: () => const SettingPage(), binding: SettingBinding()),
    GetPage(name: RouteNames.facesuccess, page: () => const FacesuccessPage(), binding: FacesuccessBinding()),
    GetPage(name: RouteNames.basicinformation, page: () => const BasicinformationPage(), binding: BasicinformationBinding()),
    GetPage(name: RouteNames.basicinformation2, page: () => const Basicinformation2Page(), binding: Basicinformation2Binding()),
    GetPage(name: RouteNames.reviewloading, page: () => const ReviewloadingPage(), binding: ReviewloadingBinding()),
    GetPage(name: RouteNames.reviewsuccess, page: () => const ReviewsuccessPage(), binding: ReviewsuccessBinding()),
    GetPage(name: RouteNames.reviewfail, page: () => const ReviewfailPage(), binding: ReviewfailBinding()),
    GetPage(name: RouteNames.confirmationloan, page: () => ConfirmationloanPage(), binding: ConfirmationloanBinding()),
    GetPage(name: RouteNames.repaymentMain, page: () => const RepaymentPage(), binding: RepaymentBinding()),
    GetPage(name: RouteNames.repaymentInfo, page: () => const RepaymentInfoPage(), binding: RepaymentInfoBinding()),
    GetPage(name: RouteNames.repaymentMake, page: () => const RepaymentMakePage(), binding: RepaymentMakeBindings()),
    GetPage(name: RouteNames.repaymentSuccess, page: () => const HFQRepaymentSuccessPage()),
    GetPage(name: RouteNames.bindinBankCard, page: () => const HFQBindinBankCardpage()),
    GetPage(name: RouteNames.comfirmationLoad, page: () => const HFQComfirmationLoadPage(), binding: ComfiremationLoadingBinding()),
    GetPage(name: RouteNames.comfirmationSuccess, page: () => const HFQComfiremationSuccessPage()),
    GetPage(name: RouteNames.fast, page: () => const FastPage(), binding: FastBinding()),
    GetPage(name: RouteNames.large, page: () => const LargePage(), binding: LargeBinding()),
    GetPage(name: RouteNames.fastApply, page: () => const HFQFastApplyPage(), binding: HFQFastApplyBinding()),
    GetPage(name: RouteNames.largeApply, page: () => const HFQlargeApplyPage(), binding: HFQLargeApplyBindin()),
    GetPage(name: RouteNames.comfiremationMonthlyRepaymentDue, page: () => const HFQMonethlyRepaymentDuePage(), binding: MonthlyrepaymentdueBindings()),
    GetPage(name: RouteNames.larageApplyEndPage, page: () => const HFQLargeApplyEndPage()),
    GetPage(name: RouteNames.contact, page: () => const ContactPage(), binding: ContactBinding()),
    GetPage(name: RouteNames.htmlpage, page: () => const HtmlPage()),
    GetPage(name: RouteNames.cusWebViewpage, page: () => const CusWevView(), binding: CusWeBviewBinding()),
    GetPage(name: RouteNames.loanbasicinformation, page: () => const LoanbasicinformationPage(), binding: LoanbasicinformationBinding()),
    GetPage(name: RouteNames.reviewloading2, page: () => const Reviewloading2Page(), binding: Reviewloading2Binding()),
  ];
}
