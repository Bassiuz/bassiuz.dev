const String fluidUiInPracticeContent = r'''
# Putting it into practice - Fluid UI

A couple of months ago, [I wrote about Fluid UI](https://www.basdevaan.nl/#/b/responsive-design-fluid-ui); a package that our team developed for Flutter to create better responsive user interfaces. If you haven't read my previous post yet, I recommend reading it before continuing with this one. The previous post explains how Fluid UI dynamically determines sizes and typeface sizes based on the width of the screen within a certain range. Typically, you would create a couple of breakpoints to change sizing and layouts, but by using Fluid UI, you create infinite breakpoints, resulting in a highly responsive layout on all different screen sizes.

Lately, I have been wanting to put some of my newly acquired techniques into practice in an actual project without diluting projects for customers with experimental work. That's why I rebuilt my personal website in Flutter! In fact, you are checking it out right now! This website is entirely built with Flutter and will be the place where I post my blogs and playground widgets to fiddle around with. It's also a safe environment for me to try out some new techniques. 🙏

## Fluid UI 0.0.2

Of course, the first thing I wanted to try out was Fluid UI in practice! For its implementation on my website, I made some minor improvements:

- Improved performance by using the new syntax MediaQuery.sizeOf(context) instead of MediaQuery.of(context).size to get the size from MediaQuery. This only rebuilds the widget when the size is adjusted, and not when something else within the MediaQuery data is adjusted.
- Improved syntax for Fluid Space Pairs. Previously, there wasn't a nice shorthand way to create a space pair, but now you can create one by adding '.to' to a Fluid Size. In practice, a Size Pair looks like this:

```dart
SizedBox(
	width: context.fluid.size.m.to.l,
);
```

Clear, concise and easy to remember ☺️.

After making some small changes to the Fluid UI package, I began implementing it on my website. Initially, I was concerned that the constant polling of MediaQuery data would slow down the website. However, for a Flutter for Web webpage, it still performs quite well. I must admit that Flutter for Web may not be the best tool for this type of website yet. Nonetheless, it provides a good opportunity to monitor its performance.

While using it, I have not encountered any major drawbacks yet, which is a good sign. Additionally, the sizings are set in a simple way. If we decide to move away from fluid later, it is straightforward to replace all Context.fluid.size objects with static Size objects. Therefore, the risk of implementing this is smaller than expected.

## Playground

The package I wrote has a nice playground but the examples are really simple. That's why I wanted to create a playground page on my own website to experiment with it. You can also find this playground page at [https://www.basdevaan.nl/#/playground/fluidui](https://www.basdevaan.nl/#/playground/fluidui). Technically, you can even read this blog inside the playground 😃.

![Untitled](assets/assets/blogpost/fluid-ui-in-practice/example.png)

The funny thing is that this playground loads the entire Material app inside the playground page, mimicking the routing and other aspects of the app. Technically, this is a kind of Flutter app within a Flutter app, a Matryoshka 🪆.

The great thing about this playground is that you can modify the Fluid config and see the changes in an applied context. This is not just a sample page, but a real app where you can observe how it is used. You can also check out the [code of my website on Github](https://github.com/Bassiuz/bassiuz.dev) to get a better idea. By tweaking the Fluid UI config, you can determine the configuration that suits your own application and see which changes affect what screen sizes.

## Current findings and way forwardoh nee

As it currently stands, I like Fluid UI! I enjoyed putting it into practice and have not encountered any major downsides yet. However, there are still some things I want to verify:

- Check how Fluid UI performs with numerous widgets on the screen that change based on Fluid sizing.
- Test and verify that Fluid UI does not have a significant performance impact on an app that rarely changes screen size. For example, a phone app that rarely changes in size should not suffer any performance loss due to having a responsive UI.
- Examine the impact of Fluid UI on Widget and Golden tests.
- Work with a designer to implement and use Fluid UI in an actual project.

Additionally, there have been many recent changes to Figma, our design tool of choice. For the past few months, it has been possible to use variables in Figma, and I will be on the lookout for a good integration of this system. Imagine a world where a designer can simply pick a random screen size and immediately have all their spaces and font types perfectly sized for that design 🤯

## Closing words

This is definitely not the last time I will write about Fluid UI, so keep an eye out for future posts on this subject. In my upcoming Putting it into Practice blog, I will also cover Widget/Golden testing and Widgetbook. This is a subject I recently wrote about that I want to put into practice, and it will also test one of the things I want to verify for Fluid UI. If you're interested, stay tuned as I test all widgets on my website and add them to Widgetbook 📓.

''';
