import '../../gen/assets.gen.dart';
import 'data/responsive_design_fluid_ui.dart';

enum Blog {
  responsiveDesignFluidUi(
      markdownContent: responsiveDesignFluidUiContent,
      title: 'Responsive Design in Flutter: meet Fluid UI!',
      slug: 'responsive-design-fluid-ui',
      bannerLocation: AssetGenImage('assets/blogpost/fluid-ui/fluid-ui-banner.jpg'));

  const Blog({required this.markdownContent, required this.title, required this.slug, required this.bannerLocation});

  static Blog getBlogForSlug(String slug) =>
      Blog.values.where((blog) => blog.slug == slug).firstOrNull ?? Blog.responsiveDesignFluidUi;

  final String markdownContent;
  final String title;
  final String slug;

  final AssetGenImage bannerLocation;
}
