# Season 1 Episode 15: KubeCon NA & Nextcloud

## Description

Let's continue working on Nextcloud on OpenShift

## Details

* Air Date: Nov. 18, 2020
* [Watch the episode](https://youtu.be/QhXOfoWNHv4)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda

* KubeCon NA Teaser
* Review Nextcloud container submitted by nlhacm

### Show Recap

A bunch of technical difficulties this morning.
Had a false start to the show.
We restarted the stream
Langdon's sound is blown out again :(.

Talked a bit about The Level Up Hour growing up to have more Red Hat support.
Watch this space, well, the show, for more info as we got it.

Talking about KubeCon and what we think sounds interesting.
In particular, talking about up'ing the "[hallway track](https://blogs.vmware.com/opensource/2018/05/15/hallway-track-open-source-conferences/)" game.
Specifically, KubeCon uses Slack for chat and [Rambly](https://rambly.app) to try to give you a stronger in person experience.

We talked a bit about the relationship between OpenShift and Kubernetes.
Basically, we take Kubernetes and add tools and content from other Open Source projects to make Kubernetes better :).

Next we talked about keynotes (or "plenaries") and why some people like going to them and why some don't.
We then mentioned a couple of the keynotes we specifically want to attend.
They were [The Rise of the End Users](https://kccncna20.sched.com/event/ep4i/sponsored-keynote-the-rise-of-the-end-users-diane-mueller-community-development-red-hat) and [Kubernetes Everywhere](https://kccncna20.sched.com/event/ep4z/sponsored-keynote-kubernetes-everywhere-briana-frank-director-of-product-ibm-cloud?iframe=no).
We also talked about attending a talk about GitOps [The Building Blocks of DX: K8s Evolution From CLI to GitOps](https://kccncna20.sched.com/event/ek9l/the-building-blocks-of-dx-k8s-evolution-from-cli-to-gitops-katie-gamanji-cloud-native-computing-foundation?iframe=no). Per the [conference website](https://events.linuxfoundation.org/kubecon-cloudnativecon-north-america/program/schedule/) "Session recordings will be available in the CNCF YouTube channel in December." so you can still go watch them.

We also mention that checking out content presented by Financial Services companies they are often doing a lot of interesting, cutting-edge things.

We also are doing a ton of "office hours" on <https://openshift.tv>.
You should check out the full schedule and watch (or, if you missed them, [the recordings](https://www.youtube.com/watch?v=XYEdvE7-5TM&list=PLaR6Rq6Z4IqcigbU0M2P3si8Yf-qr0FuS)).

We also mention that if you see Apple or Disney in the title of the talk, you should definitely check them out.
Why, you may ask?
Because, the speaker managed to get corporate approval to use the company name which is very unusual.
They do some very interesting stuff and can't normally talk about it.

We also talk about how awesome [Ryan Jarvinen](https://twitter.com/ryanj)'s talks are.
In his virtual talks he actually uses a laugh track and other sound effects which really adds to the awesomeness.

CNCF is also doing a bunch of events on [Twitch](https://twitch.tv) to let you engage with the speakers more effectively.

We also talked about Red Hat Summit.
The CFP for the June event closes *soon*.
Go [check it out](https://reg.summit.redhat.com/flow/redhat/sum21/rhcfp/login) before Nov. 30th!

We moved on to talk about the Nextcloud container content that nlhacm submitted.
However, we are distracted by bugs in bugzilla and an audience member's claim that they have "the most bugs."
We find this hard to believe.

[TLUH S1E15: bugs](https://clips.twitch.tv/FreezingTubularChimpanzeeDxCat)

We move on to a discussion of ubi8 and ubi8-minimal.
Langdon will definitely be using ubi8-minimal more often in the future.
However, he also goes on a bit of a diatribe about "do smaller base images matter?"
While largely, not so much, he goes on to discuss the, probably unknown, upside.
Namely, the minimization goals for RHEL and Fedora have led to a lot of improvements of the core of the distros.

We also discuss microdnf, libdnf, dnf, and yum and the history of why they exist.
If you want the full discussion, checkout around minute 40.

Why were we discussing all this?
To explain and elaborate on why the inclusion of mariadb in the Containerfile means that you won't be able to build this container on any machine that is not a registered RHEL.

Langdon comments on his typing skills.

Now we show off the runlabels(!) included in the Containerfile.

We move on to discuss licensing of this content and how that maps to this repository.
We also discuss the oddness of "written content" having different licenses that "software content" which can make mixed repositories a little challenging.
nlhacm gives formal permission to include the content in the repo.
Eventually, it clicks that we should have nlhacm submit a PR for the content.

## Sweet Sweet Internet Points

As of the show this morning:

* Noah Frickshun: 1,600
* narendev: 1,600
* Joefuzz: 1,200
* nlhacm: 1,100
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

* [TLUH S1E15: bugs](https://clips.twitch.tv/FreezingTubularChimpanzeeDxCat)
