const String rickRRRRContent = r'''
Did you ever want to silently Rick Roll your app users? Want to use the best of haptic motors in smartphones for a cool easter egg in your app? Then Rick RRRR is for you! It is easy as one - two - three! In this blogpost I will tell you what Rick RRRR is, why you want it and how it’s made!

### Key Takeaways

- Rick RRRR is a fun way to Rick Roll your Flutter app users
- Flutter Gaimon is a nice package to implement haptic feedback into your experience
- Open Source collaboration lets us reach new heights! 🚀


# Rick RRRR

Rick Rolling is a years old joke at this point. But have you ever given other dimensions to this joke? I have seen an [animated qr code of Rick Astley](https://www.reddit.com/r/ProgrammerHumor/comments/kt1zz8/i_created_the_worlds_first_scannable_qr_gif/) some years ago for example (Yes, it dances and it scans!).

Experimenting with Haptic Feedback gave me the inspiration to developer Rick RRRR, a revolutionary package that brings a vibrating version of Never Gonna Give You Up to you flutter app!

[Check out Rick RRRR on pub.dev!](https://pub.dev/packages/rick_rrrr)

## Getting started

First, you will need to add 'rick_rrrr' to your 'pubspec.yaml'.

```
dependencies:
  flutter:
    sdk: flutter
  rick_rrrr: 1.0.0
```

Then, run 'flutter pub get' in your terminal.

### Usage

Usage is very simple, just import and run;

```
Rick.rrrr();
```

Adding a easter egg is not going to get easier!

# Gaimon

![gaimon.jpg](assets/assets/blogpost/rick-rrrr/gaimon.jpg)

When researching different haptic feedback solutions in Flutter, I encountered [Flutter Gaimon.](https://pub.dev/packages/gaimon) Gaimon is a package to add Haptic Feedback in a very easy way. It supports different basic events in a very simple way. This makes adding Haptic Feedback to your app nice and easy!

The application even supported custom patterns for designing your own Haptic Feedback designs! But…

## Ahap support for Android

![Untitled](assets/assets/blogpost/rick-rrrr/faq.png)

… unfortunately, Gaimon was missing support for custom patterns on Android! For another app project I really wanted to have access to advanced custom patterns for Haptic Feedback, preferably with comparable experiences on all types of phones. 

The author was asking for help on supporting custom patterns for Android, and this felt to me like a beacon of light, calling me to please contribute to this package. I wanted to have access to it anyway, so why not build it in a public space where more people can take advantage?

## What is an AHAP

.ahap is a file extension for specifiying haptic feedback, and it’s an abbreviation for Apple Haptic and Audio Pattern. Designed by Apple specifically for controlling Haptic Feedback on Apple devices, it should come as a obvious thing that it works great for iPhones. 

Android is a whole different biscuit, as they say. Since even the motor in the devices has a completely different way of operating (A tapping vs a rotating vibration motor), triggering it is completely different.

Fortunately, [the documentation of the .ahap standard](https://developer.apple.com/documentation/corehaptics/representing-haptic-patterns-in-ahap-files) is very clear. By using this documentation, I was able to convert some of the details that were put in the .ahap spec to a waveform of timings and amplitudes. This gave a similar experience, at least similar enough that most .ahap files of vibrations could be recognized compared to their iOS counterpart. 

![Untitled](assets/assets/blogpost/rick-rrrr/comments.png)

Before finishing up the pull request, I already created some traction for this new feature! The creator of the gaimon package was fast to check the code out and merge it.

There are still some extra features we want to implement, but this sounds like a good beginning for .ahap support in Android!

## Looping back to Rick RRRR

The final test for me would be to get a very advanced vibration file and test it on an Android device. I found the [sound2ahap](https://github.com/ryendu/sound2ahap) repository which made me aware of the ability to convert music to vibrations 🤯. This gave me the ultimate idea of Rick Rolling someone with vibration!

The sound2ahap package didn’t give me enough tools to actually convert the song to vibrations, so I bought an extra software toolkit called Haptrix, specifically designed to design your own vibrations and share them with the Haptrix community. This tool had a sound to haptics converter to create the perfect .ahap file. 

I put all this together and this way, the Rick RRRR package was born!

## Wrapping up

Writing this package has been a whole lot of fun, and the end result is very funny. But behind it is a open source collaboration I am proud of and that I’m going to use for clients in the future. 

If you want to read more about my open source adventures, check out my previous blogs on here, or follow me on [X](https://x.com/bassiuz) (https://x.com/bassiuz)

''';
