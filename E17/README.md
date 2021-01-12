# Episode 17: Making a UBI-based image build resilient

## Description

Let's take a look at a UBI-based container and see how we can be sure it can build and run in any scenario.

## Details

* Air Date: Dec. 2, 2020
* [Watch the episode](https://youtu.be/yEyNdyPy1sY)
* [Show Notes](#show-notes)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda

* Review the Containerfile that builds part of @christianh814 's [Helper Node](https://github.com/RedHatOfficial/ocp4-helpernode)

### Show Recap

We start with some housekeeping notes, both literal and figurative.

[TLUH E17: How to Boaty McBoatface your decor](https://clips.twitch.tv/SillyDeadDurianANELE)

We talk a bit about AI/ML and science Reproducibility.
However, we mostly focus on an agenda and discussion about the plan for episode 19 and [@cleverbeard](https://twitter.com/cleverbeard) joining us to discuss some work he has done in this space.

We opened up with a bit of discussion about VS Code.
If you haven't tried it, we, and some of the audience, definitely recommend it.
We quickly talked about what font it uses.
Langdon guessed [Source Sans Pro](https://fonts.google.com/specimen/Source+Sans+Pro).
However, it is, in fact, [Droid Sans Mono](https://en.wikipedia.org/wiki/Droid_fonts).

We then proceed to discuss the [Containerfile](./ocp4-helpernode/containers/dhcp/Containerfile) and what improvements we can make.

First up, we talk about the use of `--entrypoint` and why it is important especially with containers you are not very familiar with.

We then move on to where the container build is getting `dhcp-server`.
From the `Containerfile` it looks like it should be getting the binary from the CentOS repos.
However, it is getting it from the Red Hat repos.
Upon more detailed examination, there does not appear to be anything making the decision.
As a result, this could be random or some piece of code in `dnf`/`yum` that may change at a future date.
For the container to be replicable, we don't want to rely on this inexplicable result.

We move on to "fixing" this problem by setting priorities.
However, we answer a few questions from the audience.

First, is the fact that the Red Hat repo is "on disk" and the CentOS repo is enabled in the install why the Red Hat repo is prioritized?
Langdon answers "probably" but is concerned that without there being a definitive answer, this could change in the future making our container not work.

Second, someone asks about dnf & subscriptions in a rhel container.
Langdon explains how `yum` is just a different set of letters for `dnf`.
How in UBI a large amount of content is available without a subscription.
And, lastly, more content is available if you build the container on a RHEL box registered with Red Hat.

Another question comes up.
If we built this container, with RHEL packages, not just the ones in the UBI repo(s) would this be redistributable? 
Supported?
We are unsure of the answer.
However, we think that if the container was running on RHEL, it should be supported.

We get an answer about redistribution from the RHEL team.
If you include a package in your UBI image that does not come from the UBI repos, it may *not* be redistributable.
This is something the RHEL team is working on.

We proceed to update the Containerfile to use the CentOS rpm for the repo files (`centos-repos`).
We then add a priority with `echo "priority=150 >> /etc/yum.repos.d/CentOS-BaseOS.repo"`
Finally, we take out some of the commands that are now unnecessary and rejigger some other commands to, hopefully, improve caching.

Next we attempt to build the new container.

We sidebar to answer an audience question while it builds.
If you build a container locally and push the container to a RHEL instance in AWS, will it be supported?
Yes, the container, assuming it had content only installed from RHEL or UBI repos, will be supported.

Unfortunately, it fails to build :(.
After a bit of digging, we discover that we had an error in the repo filename for our `echo` statement.
We fix that in the Containerfile and rebuild.

While rebuilding, we review the Sweet, Sweet, Internet Points.

We then move on to verify that `dhcp-server` is coming from the RHEL repos.

To ensure the container build is working correctly, we unregister the machine from Red Hat.
We then discover that caching is still in effect on the container build.
We do some cleaning, and try it again.

As expected, we are now getting `dhcp-server` from the CentOS repos.

## Sweet Sweet Internet Points

As of the show this morning:

* nlhacm: 2,000
* Noah Frickshun: 1,800
* narendev: 1,700
* Joefuzz: 1,300
* jwalter: 300
* sausagecrumbs: 300

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights

* [TLUH E17: How to Boaty McBoatface your decor](https://clips.twitch.tv/SillyDeadDurianANELE)