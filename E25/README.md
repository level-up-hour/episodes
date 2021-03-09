# Episode E25: SELinux, Containers & OpenShift

## Description

What's the best way to secure containers? Many people are rightly concerned about security in their Linux systems, particularly when introducing containers. Join us for a discussion with Dan Walsh, Mr. SELinux and Senior Distinguished Engineer at Red Hat, about securing containers on RHEL and Red Hat OpenShift.

## Details

* Air Date: Feb. 17, 2021
* [Watch the episode](https://youtu.be/t8j8awCFZXs)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Learn More About Level Up](https://red.ht/leveluphour)

### Show Recap

First up, we talk about two upcoming conferences.
Specifically, Dan Walsh has a talk and a BoF at [DevConf.CZ](https://devconf.cz).
Langdon also has a talk and is hosting a keynote.
We moved on to discuss the new [Container Plumbing](https://containerplumbing.org/) conference.
We also talk a bit about how containers have been driving a lot of rapid change in to Linux.

We segued in to a general discussion of filesystems and containers and the challenges therein.
In particular, we discussed NFS mounting in containers.
Langdon points out that we have run in to some of the NFS challenges on the show.
We have a discussion about NFS and getting changes we need to not only land but also propagate through the **very**, slow moving community of NFS users.

We move on to a discussion of podman v3 and what has triggered the version bump.
The primary driver is the shift from supporting a binary API & a REST API to just a REST API.
However, there are a ton of a new features as well.
The API change will probably not effect most users but, technically, it is not a backwards compatible change.

We then move on to a discussion of driving adoption of cgroups v2 which has opened up opportunities for both Linux and containers.
We also mention the roadmap of cgroups v2 in kubernetes.

We move on to a discussion of the security of containers.
Essentially, Dan has been trying to peel off more and more of the "Linux capabilities."
However, this has an impact in how the containers are run to not remove the functionality that makes them so great.

Next, Dan discusses removing devices and seccomps to further limit the access that a container can have in the OS.
In other words, much like with the capabilities, actually removing features that containers don't use (usually) instead of just assuming they will be safe if they aren't exposed.

Lastly, Dan starts to talk about using SELinux to defend the general filesystem from containers.
SELinux works by only allowing a process to access files that are "labeled" as being usable by that process.
For a really good metaphor with SELinux, you should checkout the [SELinux Coloring Book](https://red.ht/all-the-ebooks)
We move on to a discussion of leveraging [KVM](https://www.linux-kvm.org/page/Main_Page) features to further enhance the security between containers.

We come back to SELinux to discuss how `z` and `Z` labeling works in containers.
Specifically, how it does re-labeling on the fly to allow for container access to parts of the filesystem.
We tie the two subjects together, KVM and SELinux, discussing how the filesystems on the horizon (like [`virtio`](https://virtio-fs.gitlab.io/)) will make all this even more performant and more secure.

We move on to a discussion of incorporating `user namespaces` in to kubernetes.
User Namespaces essentially hide one "user's" resources from other "users."
We do some of it now [on the q.t.](https://grammarist.com/phrase/on-the-q-t/) but Dan hopes to see it formally included in kubernetes by the Fall (2021).

Langdon points out that we are trying to "reverse the paradigm" of privileges of a container.
Specifically, instead of granting all rights and taking away, it would be better to give no rights and then grant what you need.
Dan points out, however, that being `root` grants a lot of privileges by "accident" because of things like assumptions about that user's privilege and it's ability to read/write any file that is owned by `root`.

We have a long discussion of using `podman compose` and how that will translate to converting to kubernetes yaml.
We definitely should cover this in a future show.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [DevConf.CZ](https://devconf.cz)
* [Container Plumbers](https://containerplumbing.org/)
* [Stop Disabling SELinux](https://stopdisablingselinux.com/)
* A pretty good [article](https://blog.container-solutions.com/linux-capabilities-why-they-exist-and-how-they-work) on Linux Capabilities
* [seccomp](https://en.wikipedia.org/wiki/Seccomp)
* [SELinux Coloring Book](https://red.ht/all-the-ebooks)

## Sweet Sweet Internet Points

As of the show this morning:

* narendev:          4,300
* nlhacm:            4,200
* Noah Frickshun:    3,500
* Joefuzz:           2,300
* Det_Conan_Kudo:      800
* baconfork:           600

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).
