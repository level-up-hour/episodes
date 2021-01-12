# Season 1 Episode 2: Helper scripts in containers

## Description:
You know all those helper scripts you have collected over the years? Have you ever had trouble with using them across RHEL versions? Getting the deps installed without messing up the machine? Well, a container can be a big help.

## Details
* Air Date: Aug. 5, 2020
* [Watch the episode](https://youtu.be/tIdM8xDREL0)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

## Show Notes:

### Strict Agenda:
* Containerfile
* blender-render
* pdf-extract
* monitor-cpu-throttle

### What also came up:

Made a comment about a [bug I filed](https://github.com/containers/podman/issues/7225) about `OCIFile` and getting a default aside from `Dockerfile`.
Turns out there is one `Containerfile`!
I encouraged people to file bugs and RFEs (Requests for Enhanement).
`wshaari` noted "projects like filing issues, as it shows activity and liveness."

We discussed usage of [`ubi`](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image).
`wshaari` raised that they had heard misgivings from vendors about usage because of the need to sign the partnership agreement.
We will investigate and return with an update on a future show.
We also mentioned that a Fedora or Centos base image should work for all examples today.

We demo'd my `blender-render.sh` script in a container which allows headless rendering of video edits.
A number of viewers expressed surprise that [Blender ](https://www.blender.org/) is able to edit videos.
`RainLeander` and `TheChrisShort` provided some links for more info (thanks!):
* [These Nigerian Teens Are Making Sci-Fi Shorts with Slick Visual Effects](https://kottke.org/19/08/these-nigerian-teens-are-making-sci-fi-shorts-with-slick-visual-effects)
* [Video Editing](https://www.blender.org/features/video-editing/)

`narendev` asked how they could go about getting OpenShift for their laptop.
`TheChrisShort` pointed them to CodeReady Containers (CRC) and that they could access it via [developers.redhat.com](https://developers.redhat.com) by creating a free account.

Someone used the phrase "Here be dragons" and someone asked about its meaning.
In short, in old maps, where the information was unknown or unexplored, the cartographers would draw in sea monsters or dragons to indicate this.
The phrase "here be dragons" is short for a warning that this might be unknown/unexplored.
If you want more information, the [wikipedia article](https://en.m.wikipedia.org/wiki/Here_be_dragons) is interesting.

As we were starting to work on the monitor cpu throttling script and container, I pointed out that the image build won't work unless the host machine is subscribed to a RHEL channel.
Basically, the lm_sensors package is available in the traditional RHEL repositories but not in the UBI repositories.
If you build an image on a subscribed host, the image will be transparently built against the traditional RHEL repos not the UBI ones.
The way this works is [documented](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/building_running_and_managing_containers/using_red_hat_universal_base_images_standard_minimal_and_runtimes#adding_software_to_a_ubi_container_subscribed_host) on the Red Hat Customer Portal (login not required).

During that discussion, I mentioned that [Patrick Uiterwijk](https://patrick.uiterwijk.org/) had written a blog post about getting subscription-manager subscribed on Fedora.
Thanks to `wshaari` here is the [post])(https://patrick.uiterwijk.org/blog/2016/10/6/rhel-containers-on-non-rhel-hosts) I referenced.
In theory, that will build the image against the tradition RHEL repos but we did not have time to test it.

### Sweet Sweet Internet Points
As of the show this morning:
* `loadeded`: 200 points
* `narendev`: 200 points
* `sysosmaster`: 200 points

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt).

### Video Highlights:
* [nano vs vi](https://youtu.be/QmArB_0EU6Q)
* [blender-render works!](https://youtu.be/4NU5j9l7lpY)
* [filed an RFE for Containerfile](https://youtu.be/5b_lNBUtbgY)
* [sharing a container and a future show teaser](https://youtu.be/QlHe9tbihc8)
* [All highlights as a playlist](https://www.youtube.com/playlist?list=PLbwVPt31Dtta985m8QAobJyi9H_LJrNm4)
