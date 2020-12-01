# Season 1 Episode 16: Erik Jacobs, Turkeys, and OpenShift w/ AI/ML

## Description

Let's talk to Erik Jacobs, a TMM who specializes in AI/ML on Openshift.

## Details

* Air Date: Nov. 25, 2020
* [Watch the episode](https://youtu.be/YD1R0ROoJJA)
* [Show Notes](#show-notes)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda

* Interview with Erik Jacobs
* What's up with that hat?

### Show Recap

What's the story with the hat?

[TLUH S1E16: The Hat](https://clips.twitch.tv/OpenFrailCrowSquadGoals)

We move on to the major issue of Sweet Potatoes & Marshmallows vs Sweet Potatoes, Marshmallows, & Pineapple vs Sweet Potato Casserole.

[TLUH S1E16: The "yes/no of nerdtree" of the Thanksgiving world](https://clips.twitch.tv/ChillyImpossibleAlmondANELE)

We finally get to some technical content and start talking about virt-manager.
Nothing against this particular piece of software but we discuss how hard it is to move a VM from one machine to another.
Not only are the tools in a typical home lab not sufficient to do it "nicely" but even if you want to just move the disk, you are talking about a lot of bandwidth.

We talk a bit about why `dnf` is called `yum` on RHEL8.
Essentially, to make the move from RHEL7 to RHEL8 as transparent as possible, RHEL engineering spent a lot of energy on making `dnf` act just like `yum` in almost all cases.
Now, on RHEL8, 99% of your RHEL7 scripts should run, without modification.

We move on to talk about the docker wrapper for podman.
Basically, to allow your muscle memory to keep typing D-O-C-K-E-R and have things work as expected.

We talk a little about cockpit and using it for machine management.
We also mention a few cool, non-default, features of cockpit.
For example, [image builder](https://developers.redhat.com/blog/2019/05/08/red-hat-enterprise-linux-8-image-builder-building-custom-system-images/).
You can also manage podman containers.

We then move on to not really talk about a release of RHEL9.

Next we discuss the size of containers and why they are easier to move around than VMs.
We give an example using ubi8-minimal & httpd.
Langdon particularly points out that the standardization of distribution in containers is also a huge advantage.
Erik points out how difficult it would be to make a VM that looks anything like the size of a ubi8-minimal & httpd.

We then discuss how the "size" of a container image matters or doesn't in containers.
Specifically, that "attack surface" is probably more important than actual on disk size.
We quickly side bar in to the work of Daniel Gruss and some of the cool cracks he has done.

Erik then discusses how and why he got in to doing AI/ML on OpenShift.
Primarily, he is interested because he is interested in the ML-space in general.
Also, Red Hat has been getting involved in the AI/ML space through projects like Open Data Hub.

We talk a bit about GPU pass through in OpenShift.
Erik talks about working on some demos of this subject but hasn't encountered to many occasions where they were necessary.
We move on to a discussion of ML vs AI.
To understand the differences the discussion starts at about minute 45.
We delve deep in to a discussion of supervised and unsupervised learning as well.
Erik then presents a nice Venn diagram of AI, ML, and Deep Learning.

Chris drops in to the show for a minute to check out Erik's hat!

We move on to talk about [Sweet, Sweet Internet Points](#sweet-sweet-internet-points).

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* Interested in more about Norse Gods? Check out [GodChecker](https://www.godchecker.com/norse-mythology/)
* Check out [cockpit](https://cockpit-project.org/)
* If you want to learn more about [Rowhammer.js](https://gruss.cc/files/rowhammerjs.pdf)
* If you want to learn more about [Daniel Gruss](https://gruss.cc/)
* More on [Open Data Hub](https://opendatahub.io/)
* ML = Machine Learning; AI = Artificial Intelligence

## Sweet Sweet Internet Points

As of the show this morning:

* nlhacm: 1,900
* Noah Frickshun: 1,700
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

* [TLUH S1E16: The Hat](https://clips.twitch.tv/OpenFrailCrowSquadGoals)
* [TLUH S1E16: The "yes/no of nerdtree" of the Thanksgiving world](https://clips.twitch.tv/ChillyImpossibleAlmondANELE)
