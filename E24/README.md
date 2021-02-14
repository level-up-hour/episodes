# Episode 24: OpenShift Tools, available everywhere, via Quay.io

## Description

Let's get back to some basics. The Kubernetes ecosystem seems to constantly release new tools to interact with the various components. Getting these installed and configured everywhere and remembering their names is a pain. Let's make an application container and host it in Quay.io!

## Details

* Air Date: Feb. 10, 2021
* [Watch the episode](https://youtu.be/QMmXTPyK4hw)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Learn More About Level Up](https://red.ht/leveluphour)

### Show Recap

First up, we talk about the genesis of this show.
Essentially, we need all these tools to interact with OpenShift and Kubernetes.
Installing them all everywhere is a pain.

We take a look at the code for the `Containerfile` first up.
We start by pointing out where you can actually download the various clients you would need.

We talk for a bit about needing different versions of the tools depending on the cluster you might be connecting to.
As a result, we talk about using `alternatives` to solve the problem.
However, using alternatives can be a little clunky and hard to remember how to use.

We move on to discussing how the `os-tools` container works.
Next we add `odo` to our set of tools.

We digress for a bit talking about Windows kms and Windows activation.

Back to `odo`.
We get stuck trying to figure out why the `launcher.sh` is not getting updated in the container.
Turns out, just using the wrong name of the image.

We then proceed to setup autobuilds in quay.io.
We ensure that we setup "build per branch" to support using branch names as image tags for versioning.

We move on to setting up `latest-deprecated` and autobuilding a new tag on quay.

Next we do [Sweet, Sweet Internet Points](#sweet-sweet-internet-points).

We head back to looking at why our build failed.
We discover that helm does not have a deprecated version and that is failing.

We discuss the [openshift.tv schedule](https://red.ht/streamcal).
Including what is coming up on the channel and The Level Up Hour.

Finally, we briefly discuss the container scanning on quay.io.
Specifically, quay scans your container images for whether it has anything out of date.
In other words, if the packages have had patches we need to explicitly pick them up.
Quay tells us if we have done that.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [oc-clients](https://github.com/level-up-hour/os-clients) github repository
* Built [Container Image](https://quay.io/repository/tluh/os-clients) on Quay.io
* A blog post on [alternatives](https://www.redhat.com/sysadmin/alternatives-command)

## Sweet Sweet Internet Points

As of the show this morning:

* narendev:          4,200
* nlhacm:            4,100
* Noah Frickshun:    3,100
* Joefuzz:           2,300
* Det_Conan_Kudo:      700
* baconfork:           500

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).
