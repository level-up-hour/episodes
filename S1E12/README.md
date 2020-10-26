# Season 1 Episode 12: More on Nextcloud, systemd in a container

## Description

Let's continue working on Nextcloud on OpenShift.
However, as part of this, let's use systemd in our container for our services.

## Details

* Air Date: Oct. 21, 2020
* [Watch the episode](https://youtu.be/_o5GavmVvWY) (_NOTE: link may expire, see [openshift.tv](https://openshift.tv) if it does._)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda

* systemd in a container
* monolithic container for nextcloud

### Show Recap

We start the show with some trouble.
Having trouble with coffee and the mechnics of live streaming.

[TLUH S1E12: First stream of the day and coffee challenges!](https://clips.twitch.tv/DeafNaiveGuanacoCharlietheUnicorn)

[KubeCon NA](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/) coming up on Nov. 17-20.

Someone in the comments reminds people to reload the twitch stream if you get here early.
Weirdly, given the point of twitch, it doesn't start if you are on the channel early.
Chris thinks this is a new bug and not by design.

We digress to a quick discussion of using curl in lieu of wget.
In short, `curl -L -O <url>` does, basically, `wget <url>`.
However, if you want to scrape a website, wget is still your best choice.

Back to the program, systemd is enabled by default in a container now.
Well, with podman.
We go off to get a container we can test systemd in a container with.
However, first we have to log in to the correct registry so we can access the container we want.

Next we mess with an Apache httpd container for awhile trying to figure out what ports it is running on.
We open firewall ports, clean up some of the extraneous containers.
We try and see if a required SELinux Boolean is the problem.

```bash
# setsebool -P container_manage_cgroup true
```

Unfortunately, that is not the problem.
Next we explore using `ss` to try to figure out if http is listening.

Eventually, we discover that, by default, this container is actually running on 8080 not on 80 :(.

Finally, now that it works, we try setting the SELinux Boolean to false.
However, we don't really see a change. 
As a result, we don't get to see how to know when that is the problem.

Next we experiment with the systemd in the httpd container.
We also discuss how to run a container without enabling systemd.

```bash
from podman run man page:
--systemd string Run container in systemd mode ("true"|"false"|"always") (default "true")
```

We move on to create a "from scratch" container including httpd and mariadb-server.
We enable both services using systemd.
We note that you have to do a `CMD` with `/sbin/init` to allow systemd to run our two services.

We discuss a bit about the content available in the public ubi8 image.
Essentially, most languages and web servers are available and lots of other stuff.
However, as of this writing, there aren't any databases in the public content.
To access them, you need to get a Red Hat Subscription via [developers.redhat.com](https://developers.redhat.com) or some other way. 

We digress a bit to point out that `docker` does *not* run this way. 
As a result, unlike most things on the show, following along in `docker` won't work.

We move on, based on a question in the chat, to a discussion of "a backlog."
In essence, a backlog is the list of feature requests for a product.
Someone in the chat remarks that "backlog == void."
We discuss a bit about keeping a backlog fresh and reviewing it.

We next start working on getting all the components in to our container. 
We do a lot of debating about what ports we should open/use.

Eventually, we get the container running.
However, none of it works because we happen to be using a base image that uses `s2i`.
See [Further Reading](#further-reading) for more info.

So, we back up a bit and build the container from ubi8.
We add php to the installation in our Containerfile.
We talk about how this is unfortunate because we would rather rely on the Red Hat engineers to define how the software is configured in the container.

Finally, we answer some questions about container images in public repositories.
We call out quay.io as a place to get images.
However, neither Chris nor Langdon likes to trust containers from any public repository.

We get a container that is running but doesn't have the content inside.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
* [How to run systemd in a container](https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/)
* [An Introduction to the ss Command](https://www.linux.com/topic/networking/introduction-ss-command/)
* [Run multiple services in a container](https://docs.docker.com/config/containers/multi-service_container/)
* [What is a Product Backlog?](https://www.scrum.org/resources/what-is-a-product-backlog)
* [https://github.com/openshift/source-to-image](Source-To-Image (S2I))

## Sweet Sweet Internet Points

As of the show this morning:

* Noah Frickshun: 1,300
* narendev: 1,200
* Joefuzz: 800

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights

* [TLUH S1E12: First stream of the day and coffee challenges!](https://clips.twitch.tv/DeafNaiveGuanacoCharlietheUnicorn)
