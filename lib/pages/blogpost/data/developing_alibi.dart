const String developingAlibiContent = r'''# Developing Alibi with Flutter for Web: Our Success Story

‌‌ 
As a team, we recently took on our first real web project for a client using Flutter, and we're excited to say that it was a success! The app we developed is called Alibi, and we're thrilled with the outcome. In this blog post, we'll share our experience developing Alibi with Flutter for Web and how it exceeded our expectations.

‌‌ 
## Introducing: Alibi

‌‌ 
Alibi is a web tool that helps plan busy workdays. Fill in all the projects you are currently working on, with an estimation of how long each phase is going to take and in what time frame it needs to be finished, and Alibi does the rest. With Alibi, you’ll get a good overview of what work needs to be done, and it will plan your workload for you.

‌‌ 
For the tool to be functional, it needs to load a lot of data from the user to give an overview of all the possible projects they are managing. Interactivity is also very important, as it should feel like a breeze to use Alibi. Alibi is only going to work if it feels like Alibi is helping you create your planning, instead of having the feeling you have to plan it ‘in’ Alibi yourself.

‌‌ 
Because this tool is so focused on putting in and managing a lot of hours, it is mainly going to be used on desktop computers.

‌‌ 
![Alibi Desktop](assets/blogpost/developing-alibi/alibi-laptop.jpg)

‌‌ 
## Why Flutter?

‌‌ 
Because user interaction is so important for Alibi, we wanted to use a framework that allows us to do that. We’re right at home making complex interactions in Flutter, so using that would make it a lot easier.

‌‌ 
The customer had a mobile app on his plans as a dot on the horizon. So we already made sure we set up to transition to mobile when needed. With Flutter, we could reuse a whole lot of widgets and all the interaction we did with the backend.

‌‌ 
Around the time of launching Alibi, we noticed that Google was putting a lot of emphasis on Flutter Web. It got a lot of attention during keynotes, and more and more features and improvements were brought to Flutter Web since our last experiment with it. This gave us the confidence that Flutter Web is here to stay, and we could build this app in Flutter.

‌‌ 
‌‌ 
## Performance

‌‌ 
Something that immediately comes to mind is performance; is Flutter Web performant enough? The short answer is, if you don’t mind the initial bump, it is!

‌‌ 
The first time you are going to build a Flutter Web app, you’ll notice that starting it from the browser is pretty slow. But it makes sense, right? You are not pre-installing the code on your device and running it; no, you need to download it whenever you load the URL in your browser. This means you basically do a small ‘install’ of your app whenever you open the app.

‌‌ 
But once you are past that initial load, it is actually quite fast! Animations and transitions look smooth, and interactions are just like you are used to on the web!

‌‌ 
So when is performance a problem in Flutter Web? If you need that first couple of seconds on your platform to matter; I think you should stay away. On most webshops, a customer decides to buy something in just a couple of seconds! If your page takes too long to load, they are gone. But if you intend to capture the attention of your user for a longer period of time, Flutter for Web is actually quite a good option.

‌‌ 
Oh, and remember when I said Google was pushing it with Flutter for Web? They’ve announced recently that they are going to support Web Assembly, which will improve performance by a lot!

‌‌ 
‌‌ 
## User Interaction

‌‌ 
A very important view in Alibi is the Project overview, where you can expand and collapse projects, drag, drop and extend phases with nice interactions and scroll through time. This needs to feel very ‘smooth’ for it to have the wanted impact on the application, and it can be in Flutter!

‌‌ 
One of the most challenging parts of this project was to create this view. One single phase bar needed to be interacted with in multiple ways. What happens when;

‌‌ 
- You hover over it?
- You click on it?
- You drag it? Are you dragging from the middle, or are you extending it by dragging from the edges?

‌‌ 
With all kinds of animations of picking the items up, dropping them back in, extending and increasing/decreasing the intensity, a lot needed to be handled on a single input item. Fortunately, this is what Flutter is made for! And this interactive item will look the same on all different devices, if we want to.

‌‌ 
Try the interaction for yourself! Open up a browser, go to [https://app.alibitoday.com](https://app.alibitoday.com/), open up a free example account and feel the magic ✨!

‌‌ 
‌‌ 
## Turn of Events 😱

‌‌ 
After a couple of sprints, we had a launchable MVP; great! We wanted to see what the product would do in the market and navigate our next steps based on feedback from actual production users; this is what agile is all about!

‌‌ 
So our browser-only app entered the hands of our potential new customers, and what did we find out? Most of our visits are from phones! Oh no; our app is only usable on desktop at the moment!

‌‌ 
This made us quickly shift our focus, how can we bring the Alibi experience to mobile. We decided that we were just going to build the Alibi app from the codebase we already have and try and see what we can do in this last sprint. To all of our surprises, we actually managed to build the whole app in **1 sprint!**

‌‌ 
While this will not be the case for most apps, and we had to do some compromises on the interactive experience and more complex views, we actually managed to deliver the Alibi app to the app stores with a working and usable app!

‌‌ 
This would not be possible if we chose to build the app in a web framework in the first place.

‌‌ 
![Alibi Phone](assets/blogpost/developing-alibi/alibi-phone.jpg)

‌‌ 
## Conclusion: What Would We Do Now?

‌‌ 
Of course, the question that closes this story is what we would do with the knowledge we have now. For Alibi, it is obvious; Flutter Web was the right choice!

‌‌ 
While it depends on the kind of app that we would build next, I would not be afraid to propose Flutter Web for a next project. If the initial loading bump is not a problem, and obvious things such as SEO are not that important, it is actually a great choice for our team and for an app that possibly wants a mobile app in the future.

‌‌ 
Flutter for Web is not usable for every application, but in some cases, it gives you a whole lot of extras for free!

‌‌ 
💪🏼 Where it excels

‌‌ 
- Mobile and web in one codebase
- Great cross-platform UI building

‌‌ 
🫤 Where it doesn't shine

‌‌ 
- Bad initial loading time
- Not SEO-friendly (yet!)

‌‌ 
I hope this gave you a good insight into our experience with Flutter for Web. If you have any questions about whether you should use it or need in-depth technical information, feel free to contact me, and I'll see what I can do for you!
''';
