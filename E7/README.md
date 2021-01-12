# Episode 7: Podman Pods & Container Distribution

## Description:
We now have some containers but what if we want them to work together. A classic example is a data container and a function container.
We have also made various containers, how do we get them around the data center?

## Details
* Air Date: Sept. 9, 2020
* [Watch the episode](https://youtu.be/GNbdy0KRxEw)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

## Show Notes:

### Strict Agenda:
* ~~data containers~~
* ~~podman pods~~
* distribution using public registries

### Show Recap:
We briefly discussed [TechTogether](https://boston.techtogether.io/), Pre-Hacks (a prep for TechTogether), [DevConf.US](https://devconf.us), and [envoycon](https://events.linuxfoundation.org/envoycon/).
Moved on to discuss ghost buses and public transit.

[TLUH E7: Arghh, Ghost Bus!](https://clips.twitch.tv/ColdbloodedCharmingFennelShadyLulu)

We moved on to talk about some of the new shows coming up on
[openshift.tv](https://openshift.tv).
One that might appeal to any CIOs or other senior executives is a show called "In the Clouds with Red Hat Leadership."
The [first episode](https://www.twitch.tv/videos/736970402) aired the week of Sept. 7, 2020 with [Joe Fernandes](https://www.redhat.com/en/authors/joe-fernandes).
At 11am est. Sept. 24th, 2020 the show will be hosting [Dan Walsh](https://people.redhat.com/dwalsh/) of selinux and container fame.
We also briefly touched on skopeo but more on that in a minute.

We also touched on setenforce 0 and why it is bad.
You can also get [t-shirts](https://twitter.com/rhatdan/status/357109279511154689?lang=en) and there is a [website](https://stopdisablingselinux.com/)!

We then moved on to talk about tarballs and tar which is what container images are stored as.
If you aren't familiar with tar is "stands for" "Tape ARchive" and is an ancient method of grouping files together in to one blob.
tar is still in heavy use all over the place.
We also mentioned the compression tool [xz](https://tukaani.org/xz/)
Of course, we also had "[appropriate xkcd](https://xkcd.com/1168/)."

We then discussed the fedora-minimal container and how to modify the `/etc/containers/registries.conf` file to include a new registry in your container search.
Specifically, we needed to add `registry.fedoraproject.org` to the `[registries.search]` key.

A small digression in to a discussion of Kool-Aid and [playing hide and seek](https://www.youtube.com/watch?v=1KoH07ewMHw).

[TLUH E7: Kool-Aid!](https://clips.twitch.tv/PreciousTiredGarageAsianGlow)

We move on in to more details on how the registry search works.
Basically, the order of the registries indicates priority.
One note, unlike many config files, changes to the registries.conf is immediately available with podman but with docker the daemon must be restarted.
Someone in the chat points out that the reason registries.conf works with both podman and docker is because of the great work on standardizing the protocols by the [CNCF](https://www.cncf.io/).

We talked a bit about file system choices for backing container systems.
The most likely one these days is [overlayfs](https://www.kernel.org/doc/Documentation/filesystems/overlayfs.txt).
We can't use just any file system to store container images because they rely on the ability to COW (or [copy-on-write](https://en.wikipedia.org/wiki/Copy-on-write)).

As we are discussing registries, we walk through the usage of [docker hub](https://hub.docker.com/) and how you may want to use it more of a source for Containerfiles rather than getting images from the internet directly.
However, you can usually trust anything in the "`_`" namespace as they are provided by docker (the company) directly.
We then move on to a discussion of quay.io and start with pronunciation.

[TLUH E7: Quays and Machetes](https://clips.twitch.tv/ProtectiveWanderingBeeNerfRedBlaster)

We then move on to talk about how you can use the various online container registries and the associated Containerfiles as a starting point for the containers you want build.

Next we move on to tagging in preparation for pushing to a remote registry.
We briefly digress in to having your own registries either one you build from scratch or using a locally running quay on RHEL7.
However, we also mention that building your own registry server is likely a lot harder than it looks.

Ultimately, we get to the point of the show.
We successfully push the container image to quay.io and then show how we can get our perfect-tools to another server in our data center.
We do a little proof that the movement worked correctly by using some of the tools that we put in our perfect-tools container.

We then move on to a discussion of search for containers.
We demonstrate using skopeo to get the tags on a container image.
Especially the bits about how to address a particular image including "protocol" like `docker://`.


## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
*

## Sweet Sweet Internet Points
As of the show this morning:
* narendev: 500
* Joefuzz: 400
* jqalter: 400

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights:
* [TLUH E7: Arghh, Ghost Bus!](https://clips.twitch.tv/ColdbloodedCharmingFennelShadyLulu)
* [TLUH E7: Kool-Aid!](https://clips.twitch.tv/PreciousTiredGarageAsianGlow)
* [TLUH E7: Quays and Machetes](https://clips.twitch.tv/ProtectiveWanderingBeeNerfRedBlaster)
