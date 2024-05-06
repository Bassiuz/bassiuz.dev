const String flutterRecap2023Content = r'''
# A Flutter Developer’s Recap of 2023

### Key Takeaways

- Our automated testing improved majorly in 2023
- We attended some amazing events, met a lot of cool people and learned a lot!
- Contributing to open source is very important in our opinion, and we will focus even more on doing that.
- Standardising our workflow helps us being consistent

First of all, best wishes for 2024! 2023 marked my first full year working at Dutch Coding Company, and it has been an absolute joy. As an app agency, Dutch Coding Company offers a wide range of projects, providing me with more variety than ever before. In the past, I would typically work on just one or two projects in a year, but at Dutch Coding Company, I have had the chance to contribute to many more. This has made the year exceptionally diverse and filled with new and thrilling experiences. Looking back, I can confidently say that I have accomplished a great deal and have grown tremendously along the way.

Now, let's dive into the highlights of my 2023!

## More and better testing

While testing was always on my radar, it can be quite challenging to properly test Flutter apps. The primary goal of our Mobile App Team was to enhance testing for both existing and new projects. We aimed to learn and utilize various testing techniques to ensure we had the appropriate tools for writing automated tests in different scenarios.

Though standard Unit and Widget tests are generally effective, I began the year by introducing Golden Testing to our testing routine. Golden Testing, also known as Snapshot or Screenshot testing, involves rendering a section of your application/widget tree and capturing a screenshot of the output as a "baseline". Whenever you make changes to your code, you can verify if the resulting output still matches the baseline screenshot. The widget should appear the same unless you intended to modify it. If you did make intentional changes, you can simply generate a new baseline allowing the tests to pass.

![Untitled](assets/blogpost/flutter-recap-2023/alibi.png)

![Untitled](assets/blogpost/flutter-recap-2023/hours.png)

Check out some of our golden test images here. As you can see, there are tests for very small elements as well as somewhat bigger pages. This makes it really easy to test the full tree of widgets and observe the impact that a small change can have on them.

After a year of heavy usage, I can conclude the pros and cons of using golden tests!

### Amazing

- Golden tests are incredibly effective for testing the what is actually rendered on screen.
- Maintaining golden tests is very simple. Just generate new images, verify if they match your intentions, and commit them. Most of the time, no code changes are necessary.
- Including golden images in your Merge Requests allows reviewers to easily identify visual changes made in a MR. It also facilitates collaboration with designers, as they can quickly assess if the new design or UI changes align with their expectations. Additionally, it clarifies the scope of testing.

### Could be better

- Golden tests are not the ultimate solution. They often require mocking various components, which may result in missing out on testing actual functionality. It is still necessary to write additional tests to test the core functionality of your application.
- Merge requests for small features can sometimes result in hundreds of image changes. For example, if you only change the color of a frequently used text style, your colleague would have to review every image of a widget that uses this text style. This can be overwhelming for them. 🤯

### Bloc Tests

We use Bloc for state management in almost every new project. Using the same core tools consistently helps us manage multiple codebases with a small team. With Bloc, you can write Bloc Tests to track the state changes of a bloc when specific actions are performed.

[Check out the bloc_test package here!](https://pub.dev/packages/bloc_test)

These bloc tests provide a standardized way to thoroughly test all functionality within your blocs and cubits. They not only test the final result of an action, but also all the intermediate steps. By using these tests, you can better understand what your blocs are doing. If you're new to a project, reviewing the bloc tests of complex blocs can provide insight into the core functionality of your application.

If you're using bloc but haven't tried this feature yet, I highly recommend giving it a try!

## Fluttercon and the App Dev Community

![Untitled](assets/blogpost/flutter-recap-2023/team.png)

Earlier this year, I wrote an article about our experience in Berlin. If you want to read more about Fluttercon, make sure to check out the full article here 👇🏼

[https://www.basdevaan.nl/#/b/fluttercon-2023](https://www.basdevaan.nl/#/b/fluttercon-2023)

I also wanted to give a shoutout to the rest of the App Dev community. Through social media and meetups, I've had the opportunity to meet and learn from many new people. I want to extend a special thanks to the FlutterNL Meetup group for hosting most of the meetups I attended last year and providing valuable insights into Flutter.

In addition to focusing on Flutter, I made it a point this year to attend meetups outside of my specific Flutter bubble. In the Eindhoven area, I discovered a Javascript and UX meetup group that I attended multiple times. It was inspiring to be exposed to different perspectives and trends from groups I don't interact with on a daily basis. So, here's a personal tip for you: try attending a meetup outside of your own bubble!

If you happen to be in the Eindhoven area, I encourage you to check out the meetup that we host, called [CHECKOUT](https://checkout.events)! CHECKOUT is known as 'de gezelligste dev meetup' and aims to be an accessible and fun event for everyone working in digital. If you enjoy tech, beer, and pizza, this meetup is definitely worth checking out 🙂

## Contributing to Open Source

Open Source holds a special place in my heart. Even the core framework I use on a daily basis, Flutter, is open source. Many of the packages and tools I rely on for my job are also open sourced. When I first started as a software developer, I couldn't imagine working without these tools, let alone contributing to their development. However, as I gained more experience, I realized that I could indeed contribute to these projects.

This year, I made an effort to help diagnose and solve problems in the tools I use. While most of my contributions involved answering questions on Github Issues or identifying bugs and issues in specific packages, there were times when I was able to contribute to the packages themselves.

![Untitled](assets/blogpost/flutter-recap-2023/widgetbook.png)

### Widgetbook

Widgetbook is a cool Flutter tool inspired by Storybook.js. It allows you to create your own Widget catalog, where each UI element is rendered in an isolated tab within a folder structure. This provides a convenient overview of all the UI elements available for use in your application.

I had the opportunity to meet one of the founders of Widgetbook at a meetup in Utrecht. After he presented about Widgetbook, where he presented this novel way of documenting code, was immediately excited about the opportunities. In particular, I saw synergies in extending the documentation format with testing. This inspiration led me to [create a theoretical test setup and write a blog post about it.](https://dutchcodingcompany.com/en/blog/widget-testing-with-widgetbook) Later, when I met the Widgetbook team at a conference, we had further discussions and eventually collaborated to make this theoretical setup a reality.

Widgetbook even reached out to me later to discuss their new major release and how testing could influence it. I was glad to assist them, and I find it really cool to have the opportunity to work together with these talented individuals who are developing such a marvelous tool for us developers :).

## Repetition helps a lot: templating pipelines and projects

As an app agency, we frequently initiate new projects. Instead of reinventing the wheel each time, our approach is to establish a strong foundation and gradually enhance it. Our foundation is built upon state management using Bloc, dependency injection with GetIt, and web calls with Chopper. This trio forms the basis for all our projects, ensuring that our team possesses a solid understanding of the essential tools. Switching between projects becomes seamless as we don't need to worry about the core workings of a project. This not only strengthens our foundation but also fosters a sense of familiarity across all projects.

This year, we have further standardized our practices:

- We have implemented Very Good Analysis with consistent rules across all projects to maintain uniformity in our code style.
- Our Fastlane setup has been significantly improved to automate the build and publication processes for all projects.
- Every project now includes a Makefile, providing a set of command-line function shortcuts. This enables us to use familiar commands across all projects.s

We are considering publishing this default setup as a project starter package on [pub.dev](http://pub.dev/). This will not only facilitate project initiation for us but also allow us to share our project development approach with the community. However, I believe that deserves another article at a later time :)

## Contributing to the community: Teaching and writing

In recent years, I have developed a passion for teaching, writing, and public speaking. This year, I had the opportunity to put these skills into practice at Dutch Coding Company. I have written multiple articles on various technical subjects, aiming to share our approach to problem-solving and the lessons we have learned through research and experimentation with the community in the IT space.

![Untitled](assets/blogpost/flutter-recap-2023/linkedin.png)

[https://www.linkedin.com/feed/update/urn:li:activity:7125102838216581121/](https://www.linkedin.com/feed/update/urn:li:activity:7125102838216581121/)

One of the most fulfilling experiences this year was teaching at Fontys. I had the privilege to give back to the community by teaching students there about the importance of testing and introducing them to Flutter through an interactive workshop.

## Goals for 2024

I am extremely proud of what our app team accomplished in 2023 - from the exciting projects we completed to the new techniques we learned. We had shared new experiences and implemented new standards in our workflow, all for the better!

![20220902_DutchCodingCompany-0049-9421-min.jpg](assets/blogpost/flutter-recap-2023/bas2.jpg)

In 2024, I aim to continue this path of improvement. The work we started last year is not yet finished, and I will strive to enhance our testing, acquire new knowledge, and share it with the world. However, I want to focus on a couple of specific goals for the upcoming year:f

- Increase my contribution to open-source projects.
- Deliver my first talk at a conference or meetup.
- Inspire even more students and share my knowledge with them!

If you're curious about my goals, I will definitely write about them here, on my [LinkedIn](https://www.linkedin.com/in/bas-de-vaan-31609046/), [or my Twitter/X](https://x.com/Bassiuz). Be sure to follow me, and I'll keep you updated on the exciting year ahead in 2024!

''';
