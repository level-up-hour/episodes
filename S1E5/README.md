# Season 1 Episode 5: Building the Perfect Tools Container (toolbox)

## Description:
Have you used the `toolbox` container (formerly fedora-toolbox)? Come learn about it and what you can use it for.

## Details
* Air Date: Aug. 26, 2020
* [Watch the episode](https://www.twitch.tv/videos/721970103) (_NOTE: link may expire, see [openshift.tv](https://openshift.tv) if it does._)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

## Show Notes:

### Strict Agenda:
* coreos toolbox
* fedora toolbox

### Show Recap:
We set the stage with a little bit from last week's episode.
We discussed support-tools and where to find more information.
Remember, as always, you can check out the [show notes](../S1E4/README.md) from last week's episode for a bibliography to learn more about a topic.

We then talked a little bit about brand and our slides.
Including a quick shout out to the Red Hat Team & [MCKL (a design studio)](https://mckltype.com/about/) that designed two new, open source fonts.
If you want to check them out they are downloadable at [Red Hat Display](https://fonts.google.com/specimen/Red+Hat+Display) and [Red Hat Text](https://fonts.google.com/specimen/Red+Hat+Text).
You can also check out the [upstream](https://github.com/RedHatOfficial/RedHatFont).

[TLUH S1E5: New Open Source Red Hat Fonts!](https://clips.twitch.tv/PlausibleStylishJaguarDendiFace)

We talked a bit about where to find us.
And, puzzle-ception!

[TLUH S1E5: Puzzle-ception!](https://clips.twitch.tv/ObliviousTrustworthyBillLitty)

A little history on containers including rkt and systemd-nspawn.
systemd-nspawn was a thing by at least 2013, as evidenced by a [HOWTO on LWN](https://lwn.net/Articles/572957/) the year [moby (nee docker) debuted](https://en.wikipedia.org/wiki/Docker_(software)#History).

[TLUH S1E5: Some history (rkt & nspawn)](https://clips.twitch.tv/DistinctBitterUdonM4xHeh)

We also talked about containers that launch on boot.
In order to use containers early in the boot process, you can't use docker because the background process hasn't launched.

Someone asked about the relationship of buildah to podman.
In short, podman is a wrapper around buildah and skopeo.
We then digressed in to a discussion of Podman the  Rapper.
With comparisons to [Run DMC](https://www.rundmc.com/) and [PaRappa the Rapper](https://en.wikipedia.org/wiki/PaRappa_the_Rapper).

[TLUH S1E5: Podman the Rapper](https://clips.twitch.tv/FamousMistyFoxKappaRoss)

Discussed a bit about "bundling" and "vendoring" and using vagrant as an example.
If you haven't used vagrant, you should definitely [check it out](https://vagrantup.com).
Most Linux distributions require binaries to be packaged separately from their dependencies.
However, some of that argument is changing with the advent of containers and compiled languages like go & rust.

We segued then to fedora toolbox and its history and raison d'être.

We then moved on to a discussion of EPEL and how to use it.
If you want to learn a bit more about EPEL and the concepts of "upstream" and "downstream" it is a bit long for a video highlight.
However, you can watch it between minutes 30 and 34.
Or, you know, just watch the whole show :)

During this discussion, someone [hacked](https://www.rushordertees.com/design/#/?design=NDg5MTg5NA) together a Podman/Run DMC shirt.

Working with toolbox allows you to install the things you need in to a container that then you can then reuse.
Next we talked about how toolbox can address your own clone of the container
Finally, we talk about how to customize it using [ansible](https://ansible.com).

We proceed to show my ansible playbook(s) for creating my custom `toolbox`.
As an interlude, we briefly discuss my directory naming conventions.
I also pointed out two of my favorite tools: [`howdoi`](https://github.com/gleitz/howdoi) & [taskwarrior](https://taskwarrior.org/).

[TLUH S1E5: dash stuff](https://clips.twitch.tv/SecretiveDependableMoonTriHard)

With my ansible playbooks, I talk about how they have a bit of a "[DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)" problem.
Follow the link if you are unfamiliar with this term or want to learn more.

We then moved on to a brief overview of [appstreams](https://developers.redhat.com/blog/2018/11/15/rhel8-introducing-appstreams/) (or "modularity" upstream).
In short, if you are on Linux and want to upgrade (or downgrade) one of your applications, you have to install a new version of the OS.
Application Streams are intended to resolve this problem.
The discussion takes place from minute 63 to minute 70.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [coreos-toolbox (original)](https://github.com/coreos/toolbox)
* [fedora toolbox (newer)](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/)
* [toolbox upstream](https://github.com/containers/toolbox)
* if you want to keep up with what's happening in linux, you should read [LWN](https://lwn.net)
* What is DRY you ask? [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)

## Sweet Sweet Internet Points
As of the show this morning:
* narendev: 500 points
* LinuxExpoStacy: 400 points
* dnlhoust: 300 points

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt).

## Video Highlights:
* [TLUH S1E5: New Open Source Red Hat Fonts!](https://clips.twitch.tv/PlausibleStylishJaguarDendiFace)
* [TLUH S1E5: Puzzle-ception!](https://clips.twitch.tv/ObliviousTrustworthyBillLitty)
* [TLUH S1E5: Some history (rkt & nspawn)](https://clips.twitch.tv/DistinctBitterUdonM4xHeh)
* [TLUH S1E5: Podman the Rapper](https://clips.twitch.tv/FamousMistyFoxKappaRoss)
* [TLUH S1E5: dash stuff](https://clips.twitch.tv/SecretiveDependableMoonTriHard)
