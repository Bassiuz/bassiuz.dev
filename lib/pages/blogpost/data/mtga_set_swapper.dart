const String mtgaSetSwapperContent = r'''
# From RCQ Prep to Open Source: The Story of the MTG Arena Set Swapper 🕷️

**As a competitive Magic: The Gathering player, I'm always looking for an edge. With a Sealed RCQ for the *Universes Beyond: The Amazing Spider-Man* set on the horizon, I knew my best bet for practice was MTG Arena. But there was a problem: how do you practice for a paper tournament when the digital cards look completely different? This is the story of how that problem led me down a rabbit hole of reverse-engineering, coding, and open-source collaboration.**

MTG Arena is an incredible tool for practice. It lets you jam hundreds of games, learn card interactions, and get a feel for a format at a rapid pace. However, when you're preparing for a paper event with unique art, like a *Universes Beyond* set, Arena's digital-only art becomes a hurdle. The quick, visual recognition you build on Arena doesn't translate to the physical cards. I needed to see Spider-Ham on my screen, not Arboreal Grazer, to avoid fumbling through cards during a high-stakes tournament match.

## The Spark of Inspiration

My first thought was: has someone solved this already? A quick search led me to an awesome open-source project on GitHub: **MTGA_Swapper by BobJr23**. It was proof that modifying the game's assets was possible! BobJr's work provided the core logic for unpacking and repacking the game's asset files.

Seeing that it was an open-source project gave me the spark I needed. I didn't just want to swap a few cards manually; I wanted to build on the idea and create something that could automatically generate the swaps between *any* two sets, specifically for my use case of swapping the Arena-exclusive *Omenpaths* (OM1) set to the paper *Spider-Man* (SPM) set.

## The "Vibecoding" Begins

And so, the "vibecoding" began. Armed with inspiration and a clear goal, I set out to build a user-friendly tool in Python. The plan was to create a script with a simple GUI that could handle the entire process. Here’s a breakdown of the key components:

-   **The Brains (Scryfall API):** First, I needed a way to map the Arena cards to their paper counterparts. The incredible [Scryfall API](https://scryfall.com/docs/api) was the perfect tool. By matching cards based on their unique "Oracle ID," I could create a link between a card like "Arboreal Grazer" and its reskinned version, "Spider-Ham," even though their names were different.

-   **The Magic Touch (UnityPy):** How do you actually *change* the game files? This is where a powerful library called UnityPy comes in. MTG Arena is a Unity game, and UnityPy lets you unpack, modify, and repack the asset bundles that the game uses to store everything from card art to names.

-   **The User Interface (Tkinter):** To make the tool accessible for everyone (including my less technical friends), I built a simple GUI using Python's built-in Tkinter library. This provided a clean interface with buttons to automatically find the game, generate the swap file, apply the changes, and restore backups.

After a lot of trial and error (and a fun debugging journey on both macOS and Windows!), the **MTGA Arena Set Swapper** was born.

![A screenshot of the final application running on Mac, showing a clean user interface.](assets/assets/blogpost/mtga-set-swapper/app-screenshot.png)

## The Final Product

The tool automates the entire process into a few clicks:
1.  It **auto-detects** your MTG Arena installation on Mac or Windows.
2.  It uses the Scryfall API to **generate a swap file** between two sets.
3.  It **backs up** your original game files before making any changes.
4.  It **replaces the art and names** of the source cards with the target cards.
5.  It can **restore your original files** with a single click.

What started as a personal tool to prep for a tournament became a fun open-source project that I hope others can enjoy.

**Disclaimer:** Please be aware that modifying game files is against the Wizards of the Coast Terms of Service. This tool is for educational purposes and personal use. **Use at your own risk.**

If you're interested in trying it out or checking out the code, you can find it on my GitHub!

[**Check out the MTGA Arena Set Swapper on GitHub!**](https://github.com/Bassiuz/MTGA-Arena-Set-Swapper)
''';
