import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AURA App'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @intelligentPortfolioReady.
  ///
  /// In en, this message translates to:
  /// **'Your intelligent investment portfolio is ready'**
  String get intelligentPortfolioReady;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @emailExample.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get emailExample;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgetPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// No description provided for @stocks.
  ///
  /// In en, this message translates to:
  /// **'Stocks'**
  String get stocks;

  /// No description provided for @aiRecommendations.
  ///
  /// In en, this message translates to:
  /// **'AI Recommendations'**
  String get aiRecommendations;

  /// No description provided for @analyzes.
  ///
  /// In en, this message translates to:
  /// **'Analyzes'**
  String get analyzes;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get noInternet;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @riskDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Risk Disclaimer'**
  String get riskDisclaimer;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @investmentPreferences.
  ///
  /// In en, this message translates to:
  /// **'Investment Preferences'**
  String get investmentPreferences;

  /// No description provided for @notificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettings;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @reportBug.
  ///
  /// In en, this message translates to:
  /// **'Report a Bug'**
  String get reportBug;

  /// No description provided for @atLeastEightCharacters.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get atLeastEightCharacters;

  /// No description provided for @oneUppercaseLetter.
  ///
  /// In en, this message translates to:
  /// **'One uppercase letter'**
  String get oneUppercaseLetter;

  /// No description provided for @oneNumber.
  ///
  /// In en, this message translates to:
  /// **'One number'**
  String get oneNumber;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// No description provided for @signInWithFaceId.
  ///
  /// In en, this message translates to:
  /// **'Sign in with FaceID'**
  String get signInWithFaceId;

  /// No description provided for @createYourAura.
  ///
  /// In en, this message translates to:
  /// **'Create your Aura'**
  String get createYourAura;

  /// No description provided for @startAiPoweredInvestmentJourney.
  ///
  /// In en, this message translates to:
  /// **'Start your AI-powered investment journey'**
  String get startAiPoweredInvestmentJourney;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// No description provided for @orSignUpWith.
  ///
  /// In en, this message translates to:
  /// **'Or sign up with'**
  String get orSignUpWith;

  /// No description provided for @agreeToThe.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get agreeToThe;

  /// No description provided for @andWord.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get andWord;

  /// No description provided for @marketOverview.
  ///
  /// In en, this message translates to:
  /// **'Market Overview'**
  String get marketOverview;

  /// No description provided for @topAiPicks.
  ///
  /// In en, this message translates to:
  /// **'Top AI Picks'**
  String get topAiPicks;

  /// No description provided for @goodMorningYoussef.
  ///
  /// In en, this message translates to:
  /// **'Good Morning, Youssef'**
  String get goodMorningYoussef;

  /// No description provided for @portfolioUpToday.
  ///
  /// In en, this message translates to:
  /// **'Your portfolio is up 2.4% today'**
  String get portfolioUpToday;

  /// No description provided for @dailyAiInsight.
  ///
  /// In en, this message translates to:
  /// **'Daily AI Insight'**
  String get dailyAiInsight;

  /// No description provided for @confidence87.
  ///
  /// In en, this message translates to:
  /// **'Confidence 87%'**
  String get confidence87;

  /// No description provided for @techSectorRallyPredicted.
  ///
  /// In en, this message translates to:
  /// **'Tech Sector Rally Predicted'**
  String get techSectorRallyPredicted;

  /// No description provided for @aiModelsBullishSemiconductors.
  ///
  /// In en, this message translates to:
  /// **'AI models indicate a strong bullish trend in semiconductor stocks today based on pre-market volume.'**
  String get aiModelsBullishSemiconductors;

  /// No description provided for @readAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Read Analysis'**
  String get readAnalysis;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @currentHoldings.
  ///
  /// In en, this message translates to:
  /// **'Current Holdings'**
  String get currentHoldings;

  /// No description provided for @welcomeBackComma.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get welcomeBackComma;

  /// No description provided for @totalNetWorth.
  ///
  /// In en, this message translates to:
  /// **'TOTAL NET WORTH'**
  String get totalNetWorth;

  /// No description provided for @percentTodayLabel.
  ///
  /// In en, this message translates to:
  /// **'(+1.2%) Today'**
  String get percentTodayLabel;

  /// No description provided for @auraInsight.
  ///
  /// In en, this message translates to:
  /// **'Aura Insight'**
  String get auraInsight;

  /// No description provided for @portfolioTechHeavyInsight.
  ///
  /// In en, this message translates to:
  /// **'Your portfolio is heavily weighted in Tech (65%). Consider diversifying into Energy or Bonds to reduce volatility risk.'**
  String get portfolioTechHeavyInsight;

  /// No description provided for @viewAnalysis.
  ///
  /// In en, this message translates to:
  /// **'View Analysis ->'**
  String get viewAnalysis;

  /// No description provided for @assetAllocation.
  ///
  /// In en, this message translates to:
  /// **'Asset Allocation'**
  String get assetAllocation;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @crypto.
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// No description provided for @bonds.
  ///
  /// In en, this message translates to:
  /// **'Bonds'**
  String get bonds;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @highConfidencePicks.
  ///
  /// In en, this message translates to:
  /// **'High Confidence Picks'**
  String get highConfidencePicks;

  /// No description provided for @hotAiSignals.
  ///
  /// In en, this message translates to:
  /// **'Hot AI Signals'**
  String get hotAiSignals;

  /// No description provided for @highVolatilityAlerts.
  ///
  /// In en, this message translates to:
  /// **'High Volatility Alerts'**
  String get highVolatilityAlerts;

  /// No description provided for @auraAi.
  ///
  /// In en, this message translates to:
  /// **'Aura AI'**
  String get auraAi;

  /// No description provided for @marketAnalysisUpdated2mAgo.
  ///
  /// In en, this message translates to:
  /// **'MARKET ANALYSIS UPDATED 2M AGO'**
  String get marketAnalysisUpdated2mAgo;

  /// No description provided for @allPicks.
  ///
  /// In en, this message translates to:
  /// **'All Picks'**
  String get allPicks;

  /// No description provided for @longTerm.
  ///
  /// In en, this message translates to:
  /// **'Long Term'**
  String get longTerm;

  /// No description provided for @shortSqueeze.
  ///
  /// In en, this message translates to:
  /// **'Short Squeeze'**
  String get shortSqueeze;

  /// No description provided for @aiPickOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'AI PICK OF THE DAY'**
  String get aiPickOfTheDay;

  /// No description provided for @strongBuySignal.
  ///
  /// In en, this message translates to:
  /// **'Strong Buy Signal'**
  String get strongBuySignal;

  /// No description provided for @aiConfidenceScore.
  ///
  /// In en, this message translates to:
  /// **'AI Confidence Score'**
  String get aiConfidenceScore;

  /// No description provided for @bullish.
  ///
  /// In en, this message translates to:
  /// **'Bullish'**
  String get bullish;

  /// No description provided for @unusualVolumeDetected.
  ///
  /// In en, this message translates to:
  /// **'Unusual Volume Detected'**
  String get unusualVolumeDetected;

  /// No description provided for @volumeAboveAverage.
  ///
  /// In en, this message translates to:
  /// **'Volume is 450% above average'**
  String get volumeAboveAverage;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'ALERT'**
  String get alert;

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// No description provided for @trendingNow.
  ///
  /// In en, this message translates to:
  /// **'Trending Now'**
  String get trendingNow;

  /// No description provided for @auraInsightHeader.
  ///
  /// In en, this message translates to:
  /// **'AURA INSIGHT'**
  String get auraInsightHeader;

  /// No description provided for @watchTechHardware.
  ///
  /// In en, this message translates to:
  /// **'Watch Tech Hardware'**
  String get watchTechHardware;

  /// No description provided for @sectorMomentumUp42.
  ///
  /// In en, this message translates to:
  /// **'Sector momentum is up 4.2% today driven by new chip announcements.'**
  String get sectorMomentumUp42;

  /// No description provided for @stocksSelected.
  ///
  /// In en, this message translates to:
  /// **'Stocks Selected'**
  String get stocksSelected;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @compareNow.
  ///
  /// In en, this message translates to:
  /// **'Compare Now'**
  String get compareNow;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @yourJourneyStartsHere.
  ///
  /// In en, this message translates to:
  /// **'Your journey\nstarts here.'**
  String get yourJourneyStartsHere;

  /// No description provided for @startVirtualPortfolioPrompt.
  ///
  /// In en, this message translates to:
  /// **'Start your virtual portfolio to see AI-powered growth and insights.'**
  String get startVirtualPortfolioPrompt;

  /// No description provided for @addYourFirstStock.
  ///
  /// In en, this message translates to:
  /// **'Add Your First Stock'**
  String get addYourFirstStock;

  /// No description provided for @managePersonalInformation.
  ///
  /// In en, this message translates to:
  /// **'Manage your personal information'**
  String get managePersonalInformation;

  /// No description provided for @viewAnalysisHistory.
  ///
  /// In en, this message translates to:
  /// **'View your analysis history'**
  String get viewAnalysisHistory;

  /// No description provided for @transactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistory;

  /// No description provided for @trackAllTransactions.
  ///
  /// In en, this message translates to:
  /// **'Track all your transactions'**
  String get trackAllTransactions;

  /// No description provided for @customizeInvestmentSettings.
  ///
  /// In en, this message translates to:
  /// **'Customize your investment settings'**
  String get customizeInvestmentSettings;

  /// No description provided for @smartAutomations.
  ///
  /// In en, this message translates to:
  /// **'Smart Automations'**
  String get smartAutomations;

  /// No description provided for @setAutomatedInvestmentStrategies.
  ///
  /// In en, this message translates to:
  /// **'Set up automated investment strategies'**
  String get setAutomatedInvestmentStrategies;

  /// No description provided for @manageNotificationPreferences.
  ///
  /// In en, this message translates to:
  /// **'Manage your notification preferences'**
  String get manageNotificationPreferences;

  /// No description provided for @legalAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Legal & Support'**
  String get legalAndSupport;

  /// No description provided for @termsPrivacyAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Terms, privacy, and support'**
  String get termsPrivacyAndSupport;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get account;

  /// No description provided for @appVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Aura App v1.0.0'**
  String get appVersionLabel;

  /// No description provided for @todayLabel.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get todayLabel;

  /// No description provided for @yesterdayLabel.
  ///
  /// In en, this message translates to:
  /// **'YESTERDAY'**
  String get yesterdayLabel;

  /// No description provided for @endOfNotifications.
  ///
  /// In en, this message translates to:
  /// **'End of notifications'**
  String get endOfNotifications;

  /// No description provided for @markAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get markAllRead;

  /// No description provided for @aiAlertsTab.
  ///
  /// In en, this message translates to:
  /// **'AI Alerts'**
  String get aiAlertsTab;

  /// No description provided for @marketNewsTab.
  ///
  /// In en, this message translates to:
  /// **'Market News'**
  String get marketNewsTab;

  /// No description provided for @strongBuyBadge.
  ///
  /// In en, this message translates to:
  /// **'STRONG BUY'**
  String get strongBuyBadge;

  /// No description provided for @stopLossBadge.
  ///
  /// In en, this message translates to:
  /// **'STOPLOSS'**
  String get stopLossBadge;

  /// No description provided for @volatileBadge.
  ///
  /// In en, this message translates to:
  /// **'VOLATILE'**
  String get volatileBadge;

  /// No description provided for @tslaBullishBreakoutDescription.
  ///
  /// In en, this message translates to:
  /// **'AI detects a bullish breakout pattern. Volume spike confirmed.'**
  String get tslaBullishBreakoutDescription;

  /// No description provided for @nvdaSupportBreakDescription.
  ///
  /// In en, this message translates to:
  /// **'Price dropped below \$450 support level. Recommended exit.'**
  String get nvdaSupportBreakDescription;

  /// No description provided for @amdOptionsActivityDescription.
  ///
  /// In en, this message translates to:
  /// **'Unusual options activity detected...'**
  String get amdOptionsActivityDescription;

  /// No description provided for @match98.
  ///
  /// In en, this message translates to:
  /// **'98% Match'**
  String get match98;

  /// No description provided for @match92.
  ///
  /// In en, this message translates to:
  /// **'92% Match'**
  String get match92;

  /// No description provided for @time2mAgo.
  ///
  /// In en, this message translates to:
  /// **'2m ago'**
  String get time2mAgo;

  /// No description provided for @time1hAgo.
  ///
  /// In en, this message translates to:
  /// **'1h ago'**
  String get time1hAgo;

  /// No description provided for @time4hAgo.
  ///
  /// In en, this message translates to:
  /// **'4h ago'**
  String get time4hAgo;

  /// No description provided for @watchlist.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get watchlist;

  /// No description provided for @marketBearishSentimentDescription.
  ///
  /// In en, this message translates to:
  /// **'Market closed with bearish sentiment. Moving averages crossing.'**
  String get marketBearishSentimentDescription;

  /// No description provided for @weeklyReportAvailable.
  ///
  /// In en, this message translates to:
  /// **'Weekly report available for your AI...'**
  String get weeklyReportAvailable;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @sell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get sell;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @october2023.
  ///
  /// In en, this message translates to:
  /// **'OCTOBER 2023'**
  String get october2023;

  /// No description provided for @september2023.
  ///
  /// In en, this message translates to:
  /// **'SEPTEMBER 2023'**
  String get september2023;

  /// No description provided for @buyMarketOrder.
  ///
  /// In en, this message translates to:
  /// **'Buy Market Order'**
  String get buyMarketOrder;

  /// No description provided for @sellLimitOrder.
  ///
  /// In en, this message translates to:
  /// **'Sell Limit Order'**
  String get sellLimitOrder;

  /// No description provided for @buyLimitOrder.
  ///
  /// In en, this message translates to:
  /// **'Buy Limit Order'**
  String get buyLimitOrder;

  /// No description provided for @dividendReceived.
  ///
  /// In en, this message translates to:
  /// **'Dividend Received'**
  String get dividendReceived;

  /// No description provided for @bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bankTransfer;

  /// No description provided for @sellMarketOrder.
  ///
  /// In en, this message translates to:
  /// **'Sell Market Order'**
  String get sellMarketOrder;

  /// No description provided for @filled.
  ///
  /// In en, this message translates to:
  /// **'Filled'**
  String get filled;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @auraPick.
  ///
  /// In en, this message translates to:
  /// **'AURA PICK'**
  String get auraPick;

  /// No description provided for @oct24.
  ///
  /// In en, this message translates to:
  /// **'Oct 24'**
  String get oct24;

  /// No description provided for @oct22.
  ///
  /// In en, this message translates to:
  /// **'Oct 22'**
  String get oct22;

  /// No description provided for @oct18.
  ///
  /// In en, this message translates to:
  /// **'Oct 18'**
  String get oct18;

  /// No description provided for @oct15.
  ///
  /// In en, this message translates to:
  /// **'Oct 15'**
  String get oct15;

  /// No description provided for @sep28.
  ///
  /// In en, this message translates to:
  /// **'Sep 28'**
  String get sep28;

  /// No description provided for @sep20.
  ///
  /// In en, this message translates to:
  /// **'Sep 20'**
  String get sep20;

  /// No description provided for @sep12.
  ///
  /// In en, this message translates to:
  /// **'Sep 12'**
  String get sep12;

  /// No description provided for @todayShort.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayShort;

  /// No description provided for @auraSignal.
  ///
  /// In en, this message translates to:
  /// **'Aura Signal'**
  String get auraSignal;

  /// No description provided for @scoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get scoreLabel;

  /// No description provided for @whyThisRecommendation.
  ///
  /// In en, this message translates to:
  /// **'WHY THIS RECOMMENDATION?'**
  String get whyThisRecommendation;

  /// No description provided for @revenueGrowthPrefix.
  ///
  /// In en, this message translates to:
  /// **'Revenue growth exceeds sector average by '**
  String get revenueGrowthPrefix;

  /// No description provided for @revenueGrowthValue.
  ///
  /// In en, this message translates to:
  /// **'15%'**
  String get revenueGrowthValue;

  /// No description provided for @revenueGrowthSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get revenueGrowthSuffix;

  /// No description provided for @viewFullAnalysis.
  ///
  /// In en, this message translates to:
  /// **'View full analysis'**
  String get viewFullAnalysis;

  /// No description provided for @keyStatistics.
  ///
  /// In en, this message translates to:
  /// **'Key Statistics'**
  String get keyStatistics;

  /// No description provided for @marketCapLabel.
  ///
  /// In en, this message translates to:
  /// **'Market Cap'**
  String get marketCapLabel;

  /// No description provided for @peRatioLabel.
  ///
  /// In en, this message translates to:
  /// **'P/E Ratio'**
  String get peRatioLabel;

  /// No description provided for @divYieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Div Yield'**
  String get divYieldLabel;

  /// No description provided for @avgVolumeLabel.
  ///
  /// In en, this message translates to:
  /// **'Avg Volume'**
  String get avgVolumeLabel;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'[Show less]'**
  String get showLess;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'[Read more]'**
  String get readMore;

  /// No description provided for @stockTime1d.
  ///
  /// In en, this message translates to:
  /// **'1D'**
  String get stockTime1d;

  /// No description provided for @stockTime1w.
  ///
  /// In en, this message translates to:
  /// **'1W'**
  String get stockTime1w;

  /// No description provided for @stockTime1m.
  ///
  /// In en, this message translates to:
  /// **'1M'**
  String get stockTime1m;

  /// No description provided for @stockTime1y.
  ///
  /// In en, this message translates to:
  /// **'1Y'**
  String get stockTime1y;

  /// No description provided for @signalStrongBuy.
  ///
  /// In en, this message translates to:
  /// **'STRONG BUY'**
  String get signalStrongBuy;

  /// No description provided for @signalBuy.
  ///
  /// In en, this message translates to:
  /// **'BUY'**
  String get signalBuy;

  /// No description provided for @signalHold.
  ///
  /// In en, this message translates to:
  /// **'HOLD'**
  String get signalHold;

  /// No description provided for @signalSell.
  ///
  /// In en, this message translates to:
  /// **'SELL'**
  String get signalSell;

  /// No description provided for @signalStrongSell.
  ///
  /// In en, this message translates to:
  /// **'STRONG SELL'**
  String get signalStrongSell;

  /// No description provided for @insightDetails.
  ///
  /// In en, this message translates to:
  /// **'Insight Details'**
  String get insightDetails;

  /// No description provided for @auraAiAnalysis.
  ///
  /// In en, this message translates to:
  /// **'AURA AI ANALYSIS'**
  String get auraAiAnalysis;

  /// No description provided for @updated2mAgo.
  ///
  /// In en, this message translates to:
  /// **'Updated 2m ago'**
  String get updated2mAgo;

  /// No description provided for @auraAiDetectsPrefix.
  ///
  /// In en, this message translates to:
  /// **'Aura AI detects '**
  String get auraAiDetectsPrefix;

  /// No description provided for @strongBreakoutPattern.
  ///
  /// In en, this message translates to:
  /// **'a strong breakout pattern'**
  String get strongBreakoutPattern;

  /// No description provided for @analysisTailText.
  ///
  /// In en, this message translates to:
  /// **' for {symbol} combined with unusually positive institutional sentiment. Volume surge confirms the uptrend validity.'**
  String analysisTailText(Object symbol);

  /// No description provided for @technicalIndicators.
  ///
  /// In en, this message translates to:
  /// **'Technical Indicators'**
  String get technicalIndicators;

  /// No description provided for @viewChart.
  ///
  /// In en, this message translates to:
  /// **'View Chart'**
  String get viewChart;

  /// No description provided for @priceDrivers.
  ///
  /// In en, this message translates to:
  /// **'Price Drivers'**
  String get priceDrivers;

  /// No description provided for @sectorMomentumTitle.
  ///
  /// In en, this message translates to:
  /// **'Sector Momentum'**
  String get sectorMomentumTitle;

  /// No description provided for @sectorMomentumSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tech stocks are outperforming the S&P 500 this week, creating a tailwind for {symbol}.'**
  String sectorMomentumSubtitle(Object symbol);

  /// No description provided for @newsVolumeTitle.
  ///
  /// In en, this message translates to:
  /// **'News Volume'**
  String get newsVolumeTitle;

  /// No description provided for @newsVolumeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Mention volume has increased 200% in the last 24 hours driven by new product launches.'**
  String get newsVolumeSubtitle;

  /// No description provided for @institutionalFlowTitle.
  ///
  /// In en, this message translates to:
  /// **'Institutional Flow'**
  String get institutionalFlowTitle;

  /// No description provided for @institutionalFlowSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Significant block buying detected in dark pools over the last 3 trading sessions.'**
  String get institutionalFlowSubtitle;

  /// No description provided for @neutralHigh.
  ///
  /// In en, this message translates to:
  /// **'Neutral-High'**
  String get neutralHigh;

  /// No description provided for @bullishSignal.
  ///
  /// In en, this message translates to:
  /// **'Bullish Signal'**
  String get bullishSignal;

  /// No description provided for @aboveMa.
  ///
  /// In en, this message translates to:
  /// **'Above MA'**
  String get aboveMa;

  /// No description provided for @volVolatility.
  ///
  /// In en, this message translates to:
  /// **'VOL VOLATILITY'**
  String get volVolatility;

  /// No description provided for @highInterest.
  ///
  /// In en, this message translates to:
  /// **'High interest'**
  String get highInterest;

  /// No description provided for @sentimentScore.
  ///
  /// In en, this message translates to:
  /// **'Sentiment Score'**
  String get sentimentScore;

  /// No description provided for @marketMood.
  ///
  /// In en, this message translates to:
  /// **'Market Mood'**
  String get marketMood;

  /// No description provided for @bearish.
  ///
  /// In en, this message translates to:
  /// **'Bearish'**
  String get bearish;

  /// No description provided for @neutralLabel.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get neutralLabel;

  /// No description provided for @veryBullish.
  ///
  /// In en, this message translates to:
  /// **'Very Bullish'**
  String get veryBullish;

  /// No description provided for @watchAction.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watchAction;

  /// No description provided for @tradeSymbol.
  ///
  /// In en, this message translates to:
  /// **'Trade {symbol}'**
  String tradeSymbol(Object symbol);

  /// No description provided for @compareStocks.
  ///
  /// In en, this message translates to:
  /// **'Compare Stocks'**
  String get compareStocks;

  /// No description provided for @keyRatios.
  ///
  /// In en, this message translates to:
  /// **'Key Ratios'**
  String get keyRatios;

  /// No description provided for @setPriceAlertForBoth.
  ///
  /// In en, this message translates to:
  /// **'Set Price Alert for Both'**
  String get setPriceAlertForBoth;

  /// No description provided for @currentPrice.
  ///
  /// In en, this message translates to:
  /// **'Current Price'**
  String get currentPrice;

  /// No description provided for @riskLabel.
  ///
  /// In en, this message translates to:
  /// **'Risk'**
  String get riskLabel;

  /// No description provided for @lowRisk.
  ///
  /// In en, this message translates to:
  /// **'Low Risk'**
  String get lowRisk;

  /// No description provided for @mediumRisk.
  ///
  /// In en, this message translates to:
  /// **'Medium Risk'**
  String get mediumRisk;

  /// No description provided for @highRisk.
  ///
  /// In en, this message translates to:
  /// **'High Risk'**
  String get highRisk;

  /// No description provided for @riskTolerance.
  ///
  /// In en, this message translates to:
  /// **'Risk Tolerance'**
  String get riskTolerance;

  /// No description provided for @whatIsYourRiskAppetite.
  ///
  /// In en, this message translates to:
  /// **'What is your risk appetite?'**
  String get whatIsYourRiskAppetite;

  /// No description provided for @marketInterests.
  ///
  /// In en, this message translates to:
  /// **'Market Interests'**
  String get marketInterests;

  /// No description provided for @selectSectorsForAuraToPrioritize.
  ///
  /// In en, this message translates to:
  /// **'Select sectors for Aura to prioritize.'**
  String get selectSectorsForAuraToPrioritize;

  /// No description provided for @primaryGoal.
  ///
  /// In en, this message translates to:
  /// **'Primary Goal'**
  String get primaryGoal;

  /// No description provided for @whatIsYourMainObjective.
  ///
  /// In en, this message translates to:
  /// **'What is your main objective?'**
  String get whatIsYourMainObjective;

  /// No description provided for @goalGrowth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get goalGrowth;

  /// No description provided for @goalDividends.
  ///
  /// In en, this message translates to:
  /// **'Dividends'**
  String get goalDividends;

  /// No description provided for @goalCapitalPreservation.
  ///
  /// In en, this message translates to:
  /// **'Capital Preservation'**
  String get goalCapitalPreservation;

  /// No description provided for @maximizingCapitalAppreciationOverTime.
  ///
  /// In en, this message translates to:
  /// **'Maximizing capital appreciation over time.'**
  String get maximizingCapitalAppreciationOverTime;

  /// No description provided for @generatingSteadyPassiveIncome.
  ///
  /// In en, this message translates to:
  /// **'Generating steady passive income.'**
  String get generatingSteadyPassiveIncome;

  /// No description provided for @protectingCurrentAssetsWithMinimalRisk.
  ///
  /// In en, this message translates to:
  /// **'Protecting current assets with minimal risk.'**
  String get protectingCurrentAssetsWithMinimalRisk;

  /// No description provided for @riskOptionLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get riskOptionLow;

  /// No description provided for @riskOptionMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get riskOptionMedium;

  /// No description provided for @riskOptionHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get riskOptionHigh;

  /// No description provided for @marketTechnology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get marketTechnology;

  /// No description provided for @marketGreenEnergy.
  ///
  /// In en, this message translates to:
  /// **'Green Energy'**
  String get marketGreenEnergy;

  /// No description provided for @marketHealthcare.
  ///
  /// In en, this message translates to:
  /// **'Healthcare'**
  String get marketHealthcare;

  /// No description provided for @marketRealEstate.
  ///
  /// In en, this message translates to:
  /// **'Real Estate'**
  String get marketRealEstate;

  /// No description provided for @marketConsumerGoods.
  ///
  /// In en, this message translates to:
  /// **'Consumer Goods'**
  String get marketConsumerGoods;

  /// No description provided for @updateStrategy.
  ///
  /// In en, this message translates to:
  /// **'Update Strategy'**
  String get updateStrategy;

  /// No description provided for @smartAutomationTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Automation'**
  String get smartAutomationTitle;

  /// No description provided for @stockSelector.
  ///
  /// In en, this message translates to:
  /// **'Stock Selector'**
  String get stockSelector;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @targetPrice.
  ///
  /// In en, this message translates to:
  /// **'Target Price'**
  String get targetPrice;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @bySettingThisAutomationAuraAiWillMonitorMarketConditionsToExecuteYourOrderAtTheTargetPrice.
  ///
  /// In en, this message translates to:
  /// **'By setting this automation, Aura AI will monitor market conditions to execute your order at the target price.'**
  String
  get bySettingThisAutomationAuraAiWillMonitorMarketConditionsToExecuteYourOrderAtTheTargetPrice;

  /// No description provided for @shares.
  ///
  /// In en, this message translates to:
  /// **'Shares'**
  String get shares;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'MAX'**
  String get max;

  /// No description provided for @estOrderValue.
  ///
  /// In en, this message translates to:
  /// **'EST. ORDER VALUE'**
  String get estOrderValue;

  /// No description provided for @auraAiExecutionOptimizedForLowSlippage.
  ///
  /// In en, this message translates to:
  /// **'Aura AI execution optimized for low slippage'**
  String get auraAiExecutionOptimizedForLowSlippage;

  /// No description provided for @setAutomation.
  ///
  /// In en, this message translates to:
  /// **'Set Automation'**
  String get setAutomation;

  /// No description provided for @auraTermsOfServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Aura Terms of Service'**
  String get auraTermsOfServiceTitle;

  /// No description provided for @termsLastUpdatedVersion24.
  ///
  /// In en, this message translates to:
  /// **'Last Updated: October 2023 - Version 2.4'**
  String get termsLastUpdatedVersion24;

  /// No description provided for @termsWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Aura. Please read these Terms of Service carefully before using the Aura mobile application and associated services operated by Aura Inc.'**
  String get termsWelcomeMessage;

  /// No description provided for @acceptanceOfTerms.
  ///
  /// In en, this message translates to:
  /// **'Acceptance of Terms'**
  String get acceptanceOfTerms;

  /// No description provided for @acceptanceOfTermsBody.
  ///
  /// In en, this message translates to:
  /// **'By downloading, accessing, or using the Aura application, you agree to be bound by these Terms of Service and all applicable laws and regulations. If you do not agree with any of these terms, you are prohibited from using or accessing this application.'**
  String get acceptanceOfTermsBody;

  /// No description provided for @acceptanceNote.
  ///
  /// In en, this message translates to:
  /// **'Note: Continued use of the app constitutes your ongoing agreement to any future modifications of these terms.'**
  String get acceptanceNote;

  /// No description provided for @privacyPolicyTermsBody.
  ///
  /// In en, this message translates to:
  /// **'Your privacy is important to us. Our Privacy Policy, which describes how we handle the personal information you provide to us, is incorporated into these Terms. By using Aura, you consent to the collection and use of this information as set forth in the Privacy Policy.'**
  String get privacyPolicyTermsBody;

  /// No description provided for @viewPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'View Privacy Policy'**
  String get viewPrivacyPolicy;

  /// No description provided for @userConduct.
  ///
  /// In en, this message translates to:
  /// **'User Conduct'**
  String get userConduct;

  /// No description provided for @prohibitedActivitiesIntro.
  ///
  /// In en, this message translates to:
  /// **'You agree not to engage in any of the following prohibited activities:'**
  String get prohibitedActivitiesIntro;

  /// No description provided for @copyingDistributingText.
  ///
  /// In en, this message translates to:
  /// **'Copying, distributing, or disclosing any part of the Service in any medium.'**
  String get copyingDistributingText;

  /// No description provided for @interferingSecurityText.
  ///
  /// In en, this message translates to:
  /// **'Attempting to interfere with, compromise the system integrity or security of the Service.'**
  String get interferingSecurityText;

  /// No description provided for @unreasonableLoadText.
  ///
  /// In en, this message translates to:
  /// **'Taking any action that imposes an unreasonable or disproportionately large load on our infrastructure.'**
  String get unreasonableLoadText;

  /// No description provided for @intellectualProperty.
  ///
  /// In en, this message translates to:
  /// **'Intellectual Property'**
  String get intellectualProperty;

  /// No description provided for @intellectualPropertyBody.
  ///
  /// In en, this message translates to:
  /// **'The Service and its original content, features, and functionality are and will remain the exclusive property of Aura Inc. and its licensors. The Service is protected by copyright, trademark, and other laws of both the United States and foreign countries.'**
  String get intellectualPropertyBody;

  /// No description provided for @limitationOfLiability.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get limitationOfLiability;

  /// No description provided for @limitationOfLiabilityBody.
  ///
  /// In en, this message translates to:
  /// **'In no event shall Aura Inc., nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.'**
  String get limitationOfLiabilityBody;

  /// No description provided for @haveQuestionsAboutTheseTerms.
  ///
  /// In en, this message translates to:
  /// **'Have questions about these Terms?'**
  String get haveQuestionsAboutTheseTerms;

  /// No description provided for @legalTeamHelpClarifyTerms.
  ///
  /// In en, this message translates to:
  /// **'Our legal team is here to help clarify any terms or conditions.'**
  String get legalTeamHelpClarifyTerms;

  /// No description provided for @emailSupport.
  ///
  /// In en, this message translates to:
  /// **'Email Support'**
  String get emailSupport;

  /// No description provided for @contactLegal.
  ///
  /// In en, this message translates to:
  /// **'Contact Legal'**
  String get contactLegal;

  /// No description provided for @auraPrivacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Aura Privacy Policy'**
  String get auraPrivacyPolicyTitle;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: October 24, 2023'**
  String get privacyLastUpdated;

  /// No description provided for @privacyWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Aura. We are committed to protecting your personal information and your right to privacy. This Privacy Policy describes how your personal information is collected, used, and shared when you use our mobile application and services.'**
  String get privacyWelcomeMessage;

  /// No description provided for @introduction.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get introduction;

  /// No description provided for @privacyIntroductionBody.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Aura. We are committed to protecting your personal information and your right to privacy. This Privacy Policy describes how your personal information is collected, used, and shared when you use our mobile application and services.'**
  String get privacyIntroductionBody;

  /// No description provided for @contactPrivacyTeam.
  ///
  /// In en, this message translates to:
  /// **'Contact Privacy Team'**
  String get contactPrivacyTeam;

  /// No description provided for @informationWeCollect.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect'**
  String get informationWeCollect;

  /// No description provided for @informationWeCollectBody.
  ///
  /// In en, this message translates to:
  /// **'We collect information that you provide directly to us when you create an account, use our services, or communicate with us.'**
  String get informationWeCollectBody;

  /// No description provided for @accountData.
  ///
  /// In en, this message translates to:
  /// **'Account Data'**
  String get accountData;

  /// No description provided for @accountDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Name, email address, and authentication credentials.'**
  String get accountDataDescription;

  /// No description provided for @deviceInformation.
  ///
  /// In en, this message translates to:
  /// **'Device Information'**
  String get deviceInformation;

  /// No description provided for @deviceInformationDescription.
  ///
  /// In en, this message translates to:
  /// **'Hardware model, operating system version, and unique device identifiers.'**
  String get deviceInformationDescription;

  /// No description provided for @usageData.
  ///
  /// In en, this message translates to:
  /// **'Usage Data'**
  String get usageData;

  /// No description provided for @usageDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Information about your interactions with the app, including features used and time spent.'**
  String get usageDataDescription;

  /// No description provided for @howWeUseYourData.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Data'**
  String get howWeUseYourData;

  /// No description provided for @howWeUseYourDataBody.
  ///
  /// In en, this message translates to:
  /// **'We use the information we collect to provide, maintain, and improve our services, including:'**
  String get howWeUseYourDataBody;

  /// No description provided for @personalizeExperienceText.
  ///
  /// In en, this message translates to:
  /// **'To personalize your experience and deliver the type of content and product offerings it suits you are most interested in.'**
  String get personalizeExperienceText;

  /// No description provided for @monitorAnalyzeTrendsText.
  ///
  /// In en, this message translates to:
  /// **'To monitor and analyze trends, usage, and activities in connection with our services.'**
  String get monitorAnalyzeTrendsText;

  /// No description provided for @yourRights.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get yourRights;

  /// No description provided for @yourRightsBody.
  ///
  /// In en, this message translates to:
  /// **'Depending on your location, you may have certain rights under applicable data protection laws, including:'**
  String get yourRightsBody;

  /// No description provided for @rightToAccessData.
  ///
  /// In en, this message translates to:
  /// **'The right to access your personal data.'**
  String get rightToAccessData;

  /// No description provided for @rightToRequestDataDeletion.
  ///
  /// In en, this message translates to:
  /// **'The right to request data deletion.'**
  String get rightToRequestDataDeletion;

  /// No description provided for @rightToDataPortability.
  ///
  /// In en, this message translates to:
  /// **'The right to data portability.'**
  String get rightToDataPortability;

  /// No description provided for @dataProtection.
  ///
  /// In en, this message translates to:
  /// **'Data Protection'**
  String get dataProtection;

  /// No description provided for @dataProtectionBody.
  ///
  /// In en, this message translates to:
  /// **'We implement a variety of security measures to maintain the safety of your personal information. Your personal information is contained behind secured networks and is only accessible by a limited number of persons who have special access rights to such systems.'**
  String get dataProtectionBody;

  /// No description provided for @haveQuestions.
  ///
  /// In en, this message translates to:
  /// **'Have questions?'**
  String get haveQuestions;

  /// No description provided for @privacyTeamHelpUnderstandRights.
  ///
  /// In en, this message translates to:
  /// **'Our privacy team is here to help you understand your rights and our obligations.'**
  String get privacyTeamHelpUnderstandRights;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @copyrightNotice.
  ///
  /// In en, this message translates to:
  /// **'2019 Aura App Inc. All rights reserved.'**
  String get copyrightNotice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
