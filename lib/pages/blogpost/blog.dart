import '../../gen/assets.gen.dart';
import 'data/responsive_design_fluid_ui.dart';

enum Blog {
  responsiveDesignFluidUi(
      markdownContent: responsiveDesignFluidUiContent,
      title: 'Responsive Design in Flutter: meet Fluid UI!',
      slug: 'responsive-design-fluid-ui',
      bannerLocation: AssetGenImage('assets/blogpost/fluid-ui/fluid-ui-banner.jpg'),
      publicationDate: '12 / 6 / 2023',
      summary:
          'At Dutch Coding Company we build more and more apps that are suitable for a wide variety of devices. We’ve of course built a lot of apps for smartphones, but web-apps that need to be visible on bigger screens, smaller screens or next to other windows on a screen are commonplace for our app team now. And let’s not forget smartwatches and tablets! All these devices are incredibly powerful but need to show UI in a different way and with different screen space.');

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
