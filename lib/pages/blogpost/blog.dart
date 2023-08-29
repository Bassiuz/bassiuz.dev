import '../../gen/assets.gen.dart';
import 'data/developing_alibi.dart';
import 'data/responsive_design_fluid_ui.dart';

enum Blog {
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
