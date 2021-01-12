# Episode 3: Building the Perfect Tools Container (rhel-tools)

## Description:
Have you used the `rhel-tools` container? Come learn about what it is and what you can use it for.

## Details
* Air Date: Aug. 12, 2020
* [Watch the episode](https://youtu.be/URxJjnshXxg)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

## Show Notes:

### Strict Agenda:
* container labels & run labels
* rhel-tools container

### Show Recap:

I learned to navigate the internet today by trying to open the Red Hat Container Catalog with repeated fails.
For future reference, it is the [Red Hat Ecosystem Catalog](https://catalog.redhat.com/software/containers/search) and is [searchable](https://catalog.redhat.com/software/containers/search).

[TLUH E3: Finding the Red Hat Ecosystem Catalog](https://clips.twitch.tv/RespectfulRespectfulYamGrammarKing)

Someone asked if what I show in RHEL can be done on other platforms.
The vast majority of the time, the answer is yes!
Your best bets will be with `podman` on Fedora or CentOS.
In theory though, one of the beauties of containers is that it should run on any container runtime (e.g. docker, podman, etc.) on any Linux.
It should also run, depending on your container runtime, natively on MacOS or Windows as well.
Generally speaking, if you have used containers on the platform in question, it will probably work.
However, the caveat being those scenarios, even if you are running a container provided by Red Hat, are often unsupported.
If you are concerned about this, check the support docs.

I fall for tmux select again.
Some commentary from the peanut gallery:
```
narendev tmux mouse select is still a struggle
TheChrisShort: The mouse struggle is real
```

[TLUH E3: Falling for tmux select (again!)](https://clips.twitch.tv/PlumpFaintDugongTinyFace)

I struggled to get `podman inspect -f {{ .Labels }} rhel-tools` to work.
Turns out, it wasn't completely my fault.
Podman was confused whether I meant the `container` or the `container-image` as they were both called `rhel-tools`.
So, the command was correct but it needed a `--type` (or `-t`) flag for `container` or `image`.
In other words, `podman inspect -t image -f {{ .Labels }} rhel-tools`
And, for what I really wanted to show: `podman inspect -t image -f {{ .Labels.run }} rhel-tools`

[TLUH E3: Struggling with podman inspect --format](https://clips.twitch.tv/SweetConcernedLEDMrDestructoid)

I then introduced the "runlabel" command.

[TLUH E3: Introducing runlabel](https://clips.twitch.tv/FaithfulCarefulKimchiUWot)

And how to make your own!
However, I realized in rewatching the video that I may have been unclear.
When I said "all major container runtimes support 'this'" I meant the use of the LABEL not necessarily supporting the concept of the "run label."

[TLUH E3: Making a run label](https://clips.twitch.tv/GoodSpinelessBaguetteDoubleRainbow)

We revisited a topic from a prior episode "using `:z`".
In short, you want to use `:z` on your volume mounts when you want to access files from your host in your container.
**Except** when those host files are mounted from a remote host.
If you try to use `:z` on the remote files, it will fail.

* [TLUH E3: How to use ":z" like a boss (part 1)](https://clips.twitch.tv/AggressiveSecretiveFriseeSoBayed)
* [TLUH E3: How to use ":z" like a boss (part 2)](https://clips.twitch.tv/FancyPreciousLionPoooound)

Someone also asked how to run a container as root, if that is necessary.
In short, the same way you run any command as root, either `su` to the root account or put `sudo` in front the of the command.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
* [Introducing the "rhel-tools" for RHEL Atomic Host - Red Hat Developer](https://developers.redhat.com/blog/2015/03/11/introducing-the-rhel-container-for-rhel-atomic-host/)
* [Managing Containers Red Hat Enterprise Linux Atomic Host 7 | Red Hat Customer Portal](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html-single/managing_containers/index#running_containers_as_root_or_rootless)
* [Where is the rhel-tools container image for Red Hat Enterprise Linux 8? - Red Hat Customer Portal](https://access.redhat.com/solutions/3947281)
* [Simplifying Podman commands with labels | podman.io](https://podman.io/blogs/2018/12/03/podman-runlabel.html)
* [Understanding root inside and outside a container](https://www.redhat.com/en/blog/understanding-root-inside-and-outside-container)

## Sweet Sweet Internet Points
As of the show this morning:
* dnlhoust: 200 points
* sausagecrumbs: 200 points
* Parris4RedHat: 200 points

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt).

## Video Highlights:
* [TLUH E3: Finding the Red Hat Ecosystem Catalog](https://clips.twitch.tv/RespectfulRespectfulYamGrammarKing)
* [TLUH E3: Falling for tmux select (again!)](https://clips.twitch.tv/PlumpFaintDugongTinyFace)
* [TLUH E3: Struggling with podman inspect --format](https://clips.twitch.tv/SweetConcernedLEDMrDestructoid)
* [TLUH E3: Introducing runlabel](https://clips.twitch.tv/FaithfulCarefulKimchiUWot)
* [TLUH E3: Making a run label](https://clips.twitch.tv/GoodSpinelessBaguetteDoubleRainbow)
* [TLUH E3: How to use ":z" like a boss (part 1)](https://clips.twitch.tv/AggressiveSecretiveFriseeSoBayed)
* [TLUH E3: How to use ":z" like a boss (part 2)](https://clips.twitch.tv/FancyPreciousLionPoooound)
