import '../../gen/assets.gen.dart';
import 'data/developing_alibi.dart';
import 'data/fixing_fvm.dart';
import 'data/fluid_ui_in_practice.dart';
import 'data/flutter_recap_2023.dart';
import 'data/fluttercon_2023.dart';
import 'data/responsive_design_fluid_ui.dart';
import 'data/rick_rrrr.dart';
import 'data/widgetbook_testing.dart';

enum Blog {
  rickRRRR(
      markdownContent: rickRRRRContent,
      title: 'Rick RRRR - Rick Rolling your app users in a vibrating new dimension!',
      slug: 'rick-rrrr',
      bannerLocation: AssetGenImage('assets/blogpost/rick-rrrr/rick.png'),
      publicationDate: '01 / 04 / 2024',
      summary: 'Did you ever want to silently Rick Roll your app users? Then Rick RRRR is for you!'),
  fixingFVM(
      markdownContent: fixingFVMContent,
      title: 'Fixing FVM With an open source mindset!',
      slug: 'fixing-fvm',
      bannerLocation: AssetGenImage('assets/blogpost/fixing-fvm/tweet.png'),
      publicationDate: '29 / 02 / 2024',
      summary: 'After encoutering problems in FVM 3, I contributed in fixing the problem!'),
  flutterRecap2023(
      markdownContent: flutterRecap2023Content,
      title: 'A Flutter Developer’s Recap of 2023',
      slug: 'flutter-recap-2023',
      bannerLocation: AssetGenImage('assets/blogpost/flutter-recap-2023/bas1.jpg'),
      publicationDate: '11 / 01 / 2024',
      summary: 'I describe my experience as a Flutter Developer in the past year.'),
  fluidUiInPractice(
      markdownContent: fluidUiInPracticeContent,
      title: 'Putting Fluid UI into practice',
      slug: 'fluid-ui-in-practice',
      bannerLocation: AssetGenImage('assets/blogpost/developing-alibi/header-bas.jpg'),
      publicationDate: '5 / 10 / 2023',
      summary:
          'Putting the Fluid UI package, introduced in an earlier blogpost, into practice on my personal website!'),
  widgetbookTesting(
      markdownContent: widgetbookTestingContent,
      title: 'How to transform your widget testing setup into a widget library with Widgetbook',
      slug: 'widgetbook-testing',
      bannerLocation: AssetGenImage('assets/blogpost/widgetbook-testing/widgetbook-banner.jpg'),
      publicationDate: '8 / 8 / 2023',
      summary:
          'Recently, I was inspired by a talk from Lucas about Widgetbook. This inspired me to try using Widgetbook in our current projects, while minimising the amount of new code and keeping maintenance costs to a minimum. In this blog post, I will share the approach I came up with.'),
  fluttercon2023(
      markdownContent: fluttercon2023Content,
      title: 'Fluttercon 2023 Recap 🐦',
      slug: 'fluttercon-2023',
      bannerLocation: AssetGenImage('assets/blogpost/fluttercon-2023/fluttercon-banner.png'),
      publicationDate: '20 / 7 / 2023',
      summary:
          'Innovation and learning are key! We sent our entire app team (Niels, Job, Nick and myself) to Fluttercon/Droidcon Berlin to learn about the newest technologies in Flutter and Android development. It was three days packed with cutting-edge tech, tips, tricks, and best practices that we can apply in our daily work. We learned a lot and, most importantly, had a fun week meeting many Flutter developers and companies from around the world. Let us take you through our experience in this Fluttercon Recap!'),
  responsiveDesignFluidUi(
      markdownContent: responsiveDesignFluidUiContent,
      title: 'Responsive Design in Flutter: meet Fluid UI!',
      slug: 'responsive-design-fluid-ui',
      bannerLocation: AssetGenImage('assets/blogpost/fluid-ui/fluid-ui-banner.jpg'),
      publicationDate: '12 / 6 / 2023',
      summary:
          'At Dutch Coding Company we build more and more apps that are suitable for a wide variety of devices. We’ve of course built a lot of apps for smartphones, but web-apps that need to be visible on bigger screens, smaller screens or next to other windows on a screen are commonplace for our app team now. And let’s not forget smartwatches and tablets! All these devices are incredibly powerful but need to show UI in a different way and with different screen space.'),
  developingAlibi(
      markdownContent: developingAlibiContent,
      title: 'Developing Alibi with Flutter for Web: Our Success Story',
      slug: 'developing-alibi',
      bannerLocation: AssetGenImage('assets/blogpost/developing-alibi/header-bas.jpg'),
      publicationDate: '18 / 4 / 2023',
      summary:
          'Alibi is a web tool that helps plan busy workdays. Fill in all the projects you are currently working on, with an estimation of how long each phase is going to take and in what time frame it needs to be finished, and Alibi does the rest. With Alibi, you’ll get a good overview of what work needs to be done, and it will plan your workload for you.');

  const Blog(
      {required this.markdownContent,
      required this.title,
      required this.slug,
      required this.bannerLocation,
      required this.publicationDate,
      required this.summary});

  static Blog getBlogForSlug(String slug) =>
      Blog.values.where((blog) => blog.slug == slug).firstOrNull ?? Blog.responsiveDesignFluidUi;

  final String markdownContent;
  final String title;
  final String slug;
  final String publicationDate;
  final String summary;

  final AssetGenImage bannerLocation;
}
