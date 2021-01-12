# Episode 6: Building the Perfect Tools Container (custom)

## Description:
OK, we have now toured a bunch of the tools containers from other people. Let's build our own. We need you to help, in the chat, tell us what our "must haves" are!

## Details
* Air Date: Sept. 2, 2020
* [Watch the episode](https://youtu.be/uiV0yvp9818)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

## Show Notes:

### Strict Agenda:
* review of other "toolboxes"
* renewing a developer sub
* building our own tools container

### Show Recap:
When I was preparing for this episode of the show, I discovered that my demo RHEL system had become unsubscribed.
I got a little panicky.

[TLUH E6: Langdon has a small panic attack](https://clips.twitch.tv/ToughShyHareTooSpicy)

Eventually, I discovered that my free [Red Hat Developer Subscription](https://developers.redhat.com/articles/getting-red-hat-developer-subscription-what-rhel-users-need-know) had expired.
I then showed the steps to renew it and make everything work again.

Phew!

I realize in retrospect that the image I was confused about in the renewal process is actually the "help page" for renewal vs the "actual" renewal.

I also point out the use cases are probably broader than you realize for the developer subscription.
Basically, you can use it anywhere you are doing development but, you should check the terms and conditions yourself in case things change.

I went on to discuss dockah & Dan Walsh.
Chris offers to drive the cost of the website down to 0.

[TLUH E6: North Shore & Dockah](https://clips.twitch.tv/GloriousPreciousMilkKippa)

Finally, we move to a discussion of creating the "perfect" tools container.
To start off with we discuss using `umptysquat.txt` as the name of the `Containerfile` because it came up last week.
If you are interested in actually trying to integrate `umptysquat.txt` as a default filename, it looks like it would go [here](https://github.com/containers/buildah/blob/e5798210824b1631c7c6cbae56b1e79241468795/cmd/buildah/bud.go).

[TLUH E6: umptysquat.txt](https://clips.twitch.tv/YawningTransparentArmadilloDoritosChip)

Next, I demonstrate a basic "perfect tools" container and ask for feedback.
Some ideas that came up were adding nmap & traceroute.
While waiting, we work on a run `LABEL` for our container.
I proceed to build the new container.

Chris brings up `dd` which leads to a discussion of `coreutils` & `coreutils-single`.
In brief, `coreutils-single` is the `coreutils` in a container.
The reason it is "special" is because you need a different set of things and options installed in order to make systemd work inside a container.
systemd expects to be pid 1 on a machine and when inside a container, it can't be.
As a result, in order to get the "init script" functionality of systemd, and not have to rewrite all that with things like `zookeeper`, systemd needs to operate in a container.
Hence, a new package for coreutils to support systemd in a container.
Definitely will need to be a topic for a future show.

We have a short digression in to the genderized words in English.

We go on to discuss how to get Python usable in your RHEL tools container.
I wrote a [short article](https://developers.redhat.com/blog/2019/05/07/what-no-python-in-red-hat-enterprise-linux-8/) about this on the [developer blog](https://developers.redhat.com).

We had several digressions.

First, someone asked where the `*-devel` packages went in RHEL8.
You can watch the video at about minute 42 or you can also read an [article](https://developers.redhat.com/blog/2018/11/15/introducing-codeready-linux-builder/) I wrote explaining it.

Next, we talked about where to actually get `v8-devel` and we postulated that it might be in an Application Stream (or module) for nodejs.
While hunting for that, we talked about Application Stream `profiles` and what they are good for.
Basically, `profiles` allow an Application Stream to have multiple variants of installation.
For example, one for development, one for production, in this case, one for `v8`.

We finally get back to setting up python to be used as `python` vs `python3`.
We proceed to discuss the `alternatives` architecture.
You can read more in an [article](https://www.redhat.com/sysadmin/alternatives-command) by [Seth Kenlon](https://www.redhat.com/sysadmin/users/skenlon) or watch the show from about minute 58.

Now, we need to install the python 3.6 Application Stream in our tools container.
However, we would also like to flip the `alternatives` switch.
Unfortunately, it isn't immediately obvious how to do this non-interactively.

We found some ways to do it with some google-fu.
However, it is kinda yucky.

[TLUH E6: Super icky non-interactive tricks](https://clips.twitch.tv/DepressedAggressiveWolverineTheRinger)


After a wee bit of research, you can use `--set` with the "thing" and the "target".
e.g.

```alternatives --set python /usr/bin/python3```

Unfortunately, it still requires you to know the path to the target which could change with packaging updates.
However, this is why you should be explicit about your `FROM` line and use a tag other than `latest` so you know what you will get.
You can see the alternatives setting in action if you look at [umptysquat.txt](./perfect/umptysquat.txt).

I also discovered I got the priority order in alternatives backwards.
A *lower* number is "higher" priority.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
* [Red Hat Developer Subscription](https://developers.redhat.com/articles/getting-red-hat-developer-subscription-what-rhel-users-need-know)
* [What, no Python in RHEL8](https://developers.redhat.com/blog/2019/05/07/what-no-python-in-red-hat-enterprise-linux-8/)
* [Article about repos in RHEL8](https://developers.redhat.com/blog/2018/11/15/introducing-codeready-linux-builder/)
* [Alternatives](https://www.redhat.com/sysadmin/alternatives-command)

## Sweet Sweet Internet Points
As of the show this morning:
* narendev: 600
* Joefuzz: 400
* LinuxExpoStacy: 400

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights:
* [TLUH E6: Langdon has a small panic attack](https://clips.twitch.tv/ToughShyHareTooSpicy)
* [TLUH E6: North Shore & Dockah](https://clips.twitch.tv/GloriousPreciousMilkKippa)
* [TLUH E6: umptysquat.txt](https://clips.twitch.tv/YawningTransparentArmadilloDoritosChip)
* [TLUH E6: Super icky non-interactive tricks](https://clips.twitch.tv/DepressedAggressiveWolverineTheRinger)
