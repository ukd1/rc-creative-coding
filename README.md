# RC Creative Coding Archive

## What is this?

It's a collection of things RC'er have done (or found) related to creative coding. 🥰

## How do I use it?

Simply open an issue, and attach stuff to it - images, or whatver - and submit. It should then update the website automatically using Github Actions and some magic. 🤓

If you want to remove something, you have to delete the issue. Please ask an administator if you can't do it yourself.

## How does it work?

Github Actions allows you to trigger workflows (aka scripts) when things happen; we trigger when an issue is [created, updated](https://github.com/ukd1/rc-creative-coding/blob/main/.github/workflows/sketch_create_or_update.yml), or [deleted](https://github.com/ukd1/rc-creative-coding/blob/main/.github/workflows/sketch_delete.yml).

We look at what was in the issue, and write it to a file, then commit and push it back to github.

This then triggers Github Actions to [build the website](https://github.com/ukd1/rc-creative-coding/blob/main/.github/workflows/build_web.yml) - which is currently a simple list (see [lol.rb](https://github.com/ukd1/rc-creative-coding/blob/main/lol.rb)) - and publish it to Github Pages.

## Can I help out / change this / hack on it?

Please feel free to make new pages or hack on top of this repo. You can either change lol.rb, or make a new script and a sub-page.

**However, please be careful / avoid changing the data format, as this will likely break other folk's pages.**
