---
layout: post
title: "File Transfer"
date: 2020-12-16
tags: [Linux, Tips]
---

I think my favorite xkcd comic is [#949](https://imgs.xkcd.com/comics/file_transfer.png).
Moving data around is sometimes harder than it should be! Really, I think the
hardest part is trying to make a split-second decision about what the most
efficient transfer method is: Do I need to walk the sender/receiver through
a custom installation? Overcome network restrictions? Work within security some
security parameters?

<h3 style="text-align: center;">File Transfer (xkcd #949)</h3>

![](https://imgs.xkcd.com/comics/file_transfer.png "Everytime you email a file to yourself so you can pull it up on your friend's laptop, Tim Berners-Lee sheds a single tear.")

As the calendar year comes to a close, I thought I'd start compiling a list of
ways I share files-- some good, some bad, some ridiculous. I'm not going to
have any especially novel insights here, but think it will be a fun collection
to grow over time.

---

_Presented in alphabetical order. Also, to increase the ridiculous-factor,
I've decided to be very loose with the definition of "file" and what it means
to "transfer" one. 🐒_

## 🙁 BitTorrent

I've shared some videos this way with friends, but it's a huge hassle to send
the file, and sometimes even difficult to get the other person to figure out
the torrent client setup they need to download the file.

## 😍 [croc](https://github.com/schollz/croc)

I started using croc this year as an alternative to SCP. While it does require
an installation (compared to SCP, which tends to be pre-installed on Linux
distributions and macOS), it's very easy to send a fellow developer this
snippet...

```bash
curl https://getcroc.schollz.com | bash
```

...and ask them to run it. Once it's installed, it's my preferred way to send
large(ish) files or send files to remote servers. I find its use of PAKE (i.e.,
short passphrases) much more convenient that having to make sure SSH is
configured correctly on two different machines to use Rsync or SCP. Even the
commands (`croc send file.ext` and `croc short-pass-phrase` end up being
significantly shorter to type out).

## 😣 [Dropbox](https://www.dropbox.com/)

I almost never use it. Actually, I think I might have even deleted my account
a few years back. I really don't see the benefit of it over uploading a file to
Google Drive and sharing a link (and it's been my experience that Google Drive
is more ubiquitous anyway).

## 😂 Email

Sometimes you just have to give in to the beast.

## 🙁 External storage

The obvious downside is that it's slow, but working in a corporate environment,
plugging an arbitrary USB stick or hard drive into a laptop isn't always
a fool-proof solution (because of security restrictions).

## 😩 [Facebook Messenger](https://www.messenger.com/)

I cannot think of a time where I would ever prefer to use this.

## 🙁 FTP

It's still pretty common, to the point that lots of clients still request to
share their data via FTP, but I consider it bad because:

- I don't remember how to set up a server.
- Chrome, Firefox, and other browsers are deprecating support.
- I don't remember how to download files without using aforementioned
  browsers.

In theory, I do think it serves a good use case, though: Wanting to
_asynchronously_ share files (i.e., send now, and then let receiver access at
a later time) without needing to use some commercial, intermediate service like
Google Drive.

## 😄 GitHub (and other Git remotes)

Clearly the best way to share code (except _maybe_ tiny snippets, since
I haven't really found people using Gists in the workplace); pretty much
a standard for that use case. You can get by sharing some small(ish) datasets
as Git repositories as well, but non-code, non-documentation is usually best
shared by other means.

## 🙂 Google Drive

There are four good things about Google Drive:

- Many people already have ready access to it.
- The built-in editor/viewers for documents, spreadsheets, and presentations
  are pretty good.
- Link sharing, especially in a corporate environment, works well.
- Its integration with Gmail (i.e., large files you attempt to send in email
  are automatically sent to Drive instead) means less people sending large data
  through email.

For these reasons I use it a lot, but the lack of organization structure is
annoying, and I would generally prefer to not use an intermediate, commercial
service where possible.

## 😣 Microsoft Teams

Convenient enough for sharing screenshots, but that's about it. Sometimes
teammates will send me tailed logs using Teams and it's an awful experience;
like most other commercial communication apps, Microsoft tries really hard to
keep you inside their ecosystem, so don't actually make it very seamless to
just use the platform to move data from once place to another. I guess it's
okay for sending _tiny_ (mind this emphasis!) code snippets too. It's not
a good way to share files, but can work if you're on a team that is already
using it.

## 😄 Rsync

Before croc, this was my preferred way to share _very large_ files (i.e., for
transfer times that would make me scream if the connection was to go down
mid-transfer). It's not always installed on servers by default, but easy enough
to get. I like how it's easy to use SSH, but that means it comes with all of
the baggage of keys as well.

## 😄 SCP

Before croc, SCP was my preferred way to move data around in these cases:

- Sending data to myself on another machine
- Sending data to other developers

The biggest hassle, though, is that it requires you to have SSH configured
correctly on both machines, which isn't always the case, and is much harder to
achieve safely when you're working with another developer.

## 😣 Slack

Same limited use case as Microsoft Teams. It's not a good way to share files,
but can work if you're on a team that is already using it.

---

Here are some other methods I know about and have maybe occasionally used,
but need to try out in the "real world" a bit more...

- [Balena]()
- [GitHub Gists](https://gist.github.com/)
- Internet Relay Chat (IRC)
- [InterPlanetary File System (IPFS)](https://github.com/ipfs/ipfs)
- [Kaggle Datasets](https://www.kaggle.com/datasets)
- [Magic Wormhole](https://github.com/warner/magic-wormhole)
