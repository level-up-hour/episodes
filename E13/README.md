# Season 1 Episode 13: More on Nextcloud

## Description

Let's continue working on Nextcloud on OpenShift

## Details

* Air Date: Oct. 27, 2020
* [Watch the episode](https://youtu.be/ZMeNRx4X_DA)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda

* trying to bring up nextcloud

### Show Recap

We start the show talking about why we picked nextcloud.
We also touch on the philosophy of container-usage.
Basically, using containers is easy and doesn't require doing everything right.

We talk a bit about "puttering" and what that means for software engineers.
If you want to hear more about "puttering with znc" checkout from about minute 11.

We move on to talking about using hugo for static sites.
We also discuss a cool plugin for your websites that will present the carbon usage of the site.

Finally, on to nextcloud.
We start by wondering if we can use ADD with a zip file and if it will auto expand it.
However, we don't bother finding out as we find a tar'd version of the file.

Upon further research tar & tar.gz (or tgz) will be auto-expanded using the ADD command.
However, zip does not work.

We then discussed using backgrounding, disowning, forgrounding, and job control in linux.
If you want more details, check out `bg`, `fg`, `jobs`, `disown` in your bash documentation.

We then talk a bit about `pushd` and `popd` which will keep track of the directories you changing too.
Super handy when you want to jump over and check something in a different directory but don't want to lose your place.

We digress a little in to a discussion of windows containers.
Primarily, based on the recent [blog post](https://www.openshift.com/blog/announcing-the-community-windows-machine-config-operator-on-openshift-4.6) about the Windows Machine Config Operator.
Takes us one step closer to Windows servers as part of an OpenShift infrastructure.
However, it is only available for OpenShift 4.6.
We had a bit of confusion if 4.6 had become Generally Available (GA).
We proved it had by finding the [release announcement](https://www.openshift.com/blog/red-hat-openshift-4.6-is-now-available) :).

We digress in to a discussion of math and computer science.
Worth the watch from about minute 27.

A little discussion of the differences between the toolchain for Apache httpd on Debian vs Fedora & derivatives.

We work on getting the nextcloud tarball "installed" inside our container.
However, we run in to a bunch of issues with permissions but we eventually work them out.

We digress talking about hurricane hunting and 0 gravity testing.

We have a bit of discussion of a [bug](https://github.com/containers/podman/issues/8038) Langdon filed and that the podman team fixed!
Check it out at their [issue list](https://github.com/containers/podman/issues).

We then talked a bit about the [boot2podman project(https://github.com/boot2podman/boot2podman) and why it is deprecated.
We also talked about WSL & WSL2 and some of the challenges.
For both, we can't make Fedora available in the Windows Store because of the T&Cs.

We talked about the updated [playlist on YouTube](https://www.youtube.com/playlist?list=PLaR6Rq6Z4Iqc25cLwibpYnVNUQZDf-pgG).
If you want to find any past episodes, you should check it out.
Or you can look at the show notes from [prior episodes](../).

We also updated the points to start to show the top **6** vote getters!
And we announced that some of the leaders got the opportunity for tickets to [KubeCon NA](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/).

We also mention https://play.openshift.com so you can try it out yourself.

Back to nextcloud and fighting with ports.
Spend a bunch of time waiting for builds so we talk about Fedora 33, btrfs, new backgrounds.
Turned off all the security to make things work.
However, still having challenges.
Eventually, we seem to get the access working.
But, we decide to move it to the next show from this point.

We also got a quick question in the chat about how to use reverse command lookup.
The trick is ctrl-r and then type what you are searching for.
You can continue searching by hitting ctrl-r again or, if you miss it, shift-ctrl-r which go back forward.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [hugo](https://gohugo.io/)
* [Website Carbon Calculator](https://www.websitecarbon.com/)
* [Windows Machine Config Operator blog post](https://www.openshift.com/blog/announcing-the-community-windows-machine-config-operator-on-openshift-4.6)
* [OpenShift 4.6 Release Announcement](https://www.openshift.com/blog/red-hat-openshift-4.6-is-now-available)
* [boot2podman project(https://github.com/boot2podman/boot2podman)
* [error when runlabel is missing](https://github.com/containers/podman/issues/8038)
* [playlist on YouTube](https://www.youtube.com/playlist?list=PLaR6Rq6Z4Iqc25cLwibpYnVNUQZDf-pgG)
* [KubeCon NA](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/)

## Sweet Sweet Internet Points

As of the show this morning:

* Noah Frickshun: 1400
* narendev: 1300
* Joefuzz: 800
* nlhacm: 800
* jwalter: 400
* dnlhoust: 300

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

