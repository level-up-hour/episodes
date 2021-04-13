# Episode E29: Docker Compose with Podman v3

## Description

Podman v3 is out and has a bunch of great new features. One in particular, that we know the TLUH audience will appreciate, is the ability to run docker-compose files. Come join us to discuss all the new things with Brent Baude, lead developer.

## Details

* Air Date: Mar. 31, 2021
* [Watch the episode](https://www.youtube.com/watch?v=hyOXwzvLXOM)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Learn More About Level Up](https://red.ht/leveluphour)

### Show Recap

We welcome Brent Baude to the show and clarify his role in the `podman` project.

First up, we explain what docker-compose is.
We then move on to the history of docker-compose and podman.
However, we quickly move to discussing that the problem is actually wider than that.
Basically, podman had never fully supported the docker REST API.
So, the debate was should we support 2 apis, the docker REST one & the binary podman API.
Ultimately, for v3, the team decided to drop the binary podman api and move fully to the docker REST API.

We then delve in to the details of the support for docker-compose.yml in podman.
The "rules" as laid out by Brent.

* rootful — because this is what docker-compose expects
* no swarm — if your docker-compose uses swarm, this will not work (and likely never will)
* anything else — likely a bug, please report it

Langdon finally gets it and understands that the command is *still* docker-compose it is just actually running the containers via podman through its REST API.
We then delve in to the details of how podman had to be modified to support some of the docker commands it did not support in the past.

We also discuss the differences between [podman-compose](https://github.com/containers/podman-compose) & this version of docker-compose.
Essentially, docker-compose can now talk to the podman api as if it was the docker api.
podman-compose is more of a wrapper around podman.

We then moved on to "podman on mac".
Brent has actually gotten it working already.
The team has a design and user experience in mind and is working on the implementation.
Essentially, it takes the same approach as docker by creating and running a linux VM which in turn runs containers.
The architecture is designed such that the hypervisor implementation is also pluggable to support different VM types later (as desired).
The VM is currently Fedora CoreOS.

Brent proceeds to discuss some of the challenges for the development team.
He also mentions how you can participate and that they can use the help.
Specifically, feedback on using podman in different environments, like mac, as the development team are not avid users of OSs besides Fedora & RHEL.
He also says that the best way to "connect" if the issues or features are a discussion is on [#podman on freenode](ircs://chat.freenode.net/podman).

We move on to discussing `podman generate` and how it compares to docker-compose.

We ask Brent aside from docker-compose, what new feature does he like the best.
We discuss `podman generate` even though we already covered it (some).

We move on to discuss the new "short names" feature.
Specifically, we discuss the security concerns around when you do `podman pull fedora` how do you know you are getting the "right" one when you have multiple registries.

We move on to discuss podman vs docker and security.
Specifically, we talk about how people don't realize that docker is running on all containers as root.
Brent even brings up how podman gets bad press for when things run in docker but not in podman and it is because the container requires root but the user doesn't know.
We discuss how one should try the following list when things don't work:

* `setenforce 0`, does it work? ok, likely selinux, now `setenforce 1`
* `systemctl stop firewalld`, does it work? ok, likely the firstwall, now `systemctl start firewalld`
* `sudo podman run ...`, does it work? ok, likely the container needs some root privilege

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* Where to report [podman issues](https://github.com/containers/podman/issues)
* [Fedora CoreOS](https://getfedora.org/en/coreos?stream=stable)

## Sweet Sweet Internet Points

As of the show this morning:

* narendev:          4,700
* nlhacm:            4,600
* Noah Frickshun:    3,600
* Joefuzz:           2,300
* Det_Conan_Kudo:    1,600
* baconfork:           800

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).
