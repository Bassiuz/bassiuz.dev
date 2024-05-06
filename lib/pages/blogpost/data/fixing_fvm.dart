const String fixingFVMContent = r'''
# Fixing FVM with an open source mindset!

FVM 3.0.0 was released to the public this month, and before trying it out myself I read a couple of warning signs on Twitter, Slack and Discord of people having issue with their FVM installations.I was cautious about this myself. Instead of confronting the problems, I opted to continue using FVM 2 for the time being and planned to upgrade when most issues were resolved. This is typically a sensible approach.

![Untitled](/assets/blogpost/fixing-fvm/slack.png)

However, our genius infra wizard Tom, as per our agreement, upgraded our CI machine and with that, he updated FVM to FVM 3 without even knowing about it! Then it happened, ‘the morning after’, all of our Flutter pipelines just went red! ❌

The easy solution would be putting my head in the sand again and reverting back to FVM 2.x.x, but that didn’t sound like the best solution. Eventually we wanted to migrate to FVM 3, so fix the issue rather then go back to the old version sounds like the better solution. So lets do a good stretch and dive right in!

## The problem

Whenever we ran FVM in our CI, it weirdly kept prompting us with a problem:

```java
 No pubspec.yaml detected in this directory
 ```

But I was actually pretty sure we ran the FVM function in a folder with a pubspec.yaml file! After triple checking this on our build machine and trying some manual FVM usages, I started researching this issue and found a open ticket on the FVM Github page: 

[https://github.com/leoafarias/fvm/issues/638](https://github.com/leoafarias/fvm/issues/638)

The problem's description was somewhat unclear, but it seemed to match the issue I was experiencing. At the time of researching it was an open issue, so I added to the issue that I also encountered this problem and was able to help reproducing it if possible. But at that moment the yearly goal of Dutch Coding Company struck to my head; open source contributions! This was my moment to shine and help out figuring out what was happening.

I cloned FVM locally to my machine and started searching around. I figured out it had to do with a commented out function in the findAncestor function that finds where the FVM project is actually located. When re-enabling this line, FVM worked for me again so I submitted a pr to re-enable this. However; Leo Farias, the main developer of FVM was quick to reply that this would disable mono repository support. 

After some back and forth between me and Leo (you can read the exact messages in the Github issue), we found out that this was caused by a FVM configuration somewhere higher in the hierarchy of my folder structure! By removing this FVM configuration, the pipeline worked again! Leo also made an extra fix to prevent some of these problems in the future and remove the out commented functions. Great! 🎉 

And with that I thought all our problems were fixed and I could go on my merry way. Until the 3rd step of our pipeline failed and made me type this message out of disbelief;

![Untitled](/assets/blogpost/fixing-fvm/aaahhhhh.png)

AAAAAAAH! Flutter SDK 3.19.0_x86_64 is not valid Flutter version! Back to square one!

## The Problem 2: Electric Boogaloo

Let me first explain a bit more about this specific Flutter version. In our Flutter projects we make use of Golden Tests. Golden Tests are tests where a part of the app gets rendered in the test engine and compared to a screenshot of that rendering. This makes sure that a widget looks exactly like intended, and we can check it against verification images. If a widget changed, we can change those verification images as well. However; due to a very *very* small difference in how Flutter renders widgets in x86_64 processor architectures and Apple Silicon processor architectures, we kept having issues with slightly different images.

This is why we wrote a script that installs a x86_64 version of Flutter during the testing step of our pipeline and uses that, even if the machine is a Apple Silicon machine. This way, it uses the exact same version of Flutter to render and check the images. We managed this by downloading the zip and putting it in a folder where FVM managed its versions. This worked great for us!

.. Until FVM 3!

FVM 3.0.0 had a lot of quality of life upgrades; including this one. Whenever you select a certain Flutter version, it checks if the provided Flutter version ‘makes sense’. Our weird Flutter version name was of course not a valid Flutter version; but a custom thing. And custom here is the key word, I figured out it was possible to add 'custom_' as a prefix to the Flutter version and FVM would see it as a custom installation! Which sounded great for this solution; as you would expect that it wouldn’t check a custom version on its naming right? ❌ Wrong! It still did that. Weird! And what if you add a '--force' parameter to force it through the questions. This wouldn't prompt you with a question, right? Right?

![Untitled](/assets/blogpost/fixing-fvm/meme.png)

Well you would’ve probably guessed it, this was unfortunately not the solution to our problem.

However, I personally thought that it should work this way. So I [opened another issue on Github](https://github.com/leoafarias/fvm/issues/653), created a fork of FVM and started working on a fix! After a couple of hours tinkering, I found a good solution and [created the pull request to fix the problem 🙂!](https://github.com/leoafarias/fvm/pull/654)

This started the waiting process. Leo is a very quick responder on Github, but we were operating in totally different timezones. So Leo was still asleep! In the meanwhile I installed my FVM fork on our build machine to test and all our pipelines were back up again!

After fixing some sensible review comments, Leo [approved the pull request](https://github.com/leoafarias/fvm/pull/654#pullrequestreview-1903513148) and just a couple of days later the fix is available for everybody :)

It was very cool to work on tooling I think is essential in the Flutter developer space. I literally use FVM every day and it makes working on multiple projects with multiple different Flutter versions bearable!

![Screenshot 2024-02-28 at 13.33.28.png](/assets/blogpost/fixing-fvm/contributors.png)

## Bonus Problem - helpful prompts

Before we go I have a bonus problem I encountered while writing this blogpost! I was releasing a project that was ready to be merged for some time now; so all pipelines were green, everything was ready to go! But in the meantime FVM got updated, but we fixed that, right… right?

![Untitled](/assets/blogpost/fixing-fvm/asdf.png)

Don’t forget to add '.fvm' to your '.gitignore' ;)

Big thanks to all you readers for getting to the bottom of my blog! If you have any questions about my contribution to FVM or anything else, feel free to reach out on X ([@Bassiuz](https://twitter.com/Bassiuz)), and if you like to read about my adventures within Flutter feel free to follow me as well!

''';
