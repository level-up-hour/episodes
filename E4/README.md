# Episode 4: Building the Perfect Tools Container (support-tools)

## Description:
Have you used the `support-tools` container? Come learn about it and what you can use it for.

## Details
* Air Date: Aug. 19, 2020
* [Watch the episode](https://youtu.be/44wo1Dvg5EY)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

## Show Notes:

### Strict Agenda:
* rhel support-tools container:
    * https://catalog.redhat.com/software/containers/rhel8/support-tools/5ba3eaf9bed8bd6ee819b78b
* podman inspect (redux)

### Show Recap:

We opened talking about KubeCon EU (technically, [KubeCon & CloudNative Con Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe)).
Mentioned a couple of interesting talks we had seen and noted, in particular, that it is the 5 year birthday of [OCI](https://opencontainers.org/)!
Couple of Red Hatters, [Sally O'Malley](https://twitter.com/somalley108) and [Urvashi Mohnani](https://twitter.com/umohnani8) gave a [keynote](https://kccnceu20.sched.com/event/ZfHO/sponsored-keynote-happy-birthday-open-container-initiative-heres-to-5-years-of-collaborative-innovation-sally-ann-omalley-software-engineer-urvashi-mohnani-software-engineer-red-hat?iframe=no) about it.

[TLUH E4: Talking about KubeCon EU '20](https://clips.twitch.tv/StrongCrunchySamosaMcaT)

I talked a bit about moving an application from a VM or physical machine in to containers and OpenShift.
I developed a lab for Summit about the same subject.
You can go try it for yourself if you like.
You can also watch the video of me walking you through it.
However, you have to search for the talk at Red Hat Summit 20.
So if you want to see it, go to [the site](https://onlinexperiences.com/scripts/Server.nxp?LASCmd=AI:4;F:QS!10100&ShowUUID=4245E6E3-7D25-496D-9B08-4CBDC87CCE74&affiliatedata=701f2000001OH7YAAW), and then search in "Sessions & Labs" for "Containerizing applications—existing and new"

We talked about the t-shirts we are wearing and that we should have some ones coming out for the show soon!

[TLUH E4: T-Shirts!](https://clips.twitch.tv/TiredMagnificentAxeRitzMitz)

Discussed the separate storage areas for different users.
While this makes sense for them to be separate, if you use sudo a lot, you can easily make a mistake about which local container registry or container runtime you are using.

We also talked about the no-cost subscriptions that are available from the [Red Hat Developer Program](http://developers.redhat.com/).
If you need a subscription for Red Hat products for your development use, you should definitely check it out.

We continue to be challenged by `podman inspect` but we finally got it.
You need to be sure to use two sets of squiggly brackets (`{}`) and `"`.

[TLUH E4: More fighting with podman inspect](https://clips.twitch.tv/SweetGrotesqueHummingbirdWow)

We also talked about the original "container method": chroot.
We also discussed building RPMs in container with mock.

Someone brought up that there are tools to help you "clean" or obfuscate the data in a sosreport to help ensure you aren't passing sensitive information on.
One example that was provided was [soscleaner](https://github.com/soscleaner/soscleaner).
However, I would recommend that only trust this kind of tool so far.
It is often a good idea to do your own scan as well.
Someone else pointed out that you can actually ask sosreport to collect less information but the support team at Red Hat usually asks for a complete set.

We discussed how `ps` is not installed in the `support-tools` container and discussed ways around this problem.
First, we can install ps `yum install procps`.
Next, we could actually jump to the host machine and use `ps` there.
However, one we didn't think of was brought up in the chat.
We could have used `ls /proc`.
Someone else also suggested we could have used `echo $!` which will print the last background'ed PID.

We talked a bit about strace and why it is a good thing to learn.
Chris recommended checking out a talk: [GopherCon 2017: Liz Rice - A Go Programmer's Guide to Syscalls](http://www.everysession.com/gophercon/gophercon-us/2017/gophercon-2017-liz-rice-a-go-programmers-guide-to-syscalls/) even if you aren't a go programmer.

[TLUH E4: strace is your friend](https://clips.twitch.tv/HappyAwkwardEndiveHeyGirl)

Telnet is included in the support-tools container.
And, in case your forgot, `^]` is how you escape from telnet.

[TLUH E4: Why you need telnet](https://clips.twitch.tv/SoftMoldyCockroachFailFish)

We went on to discuss the discounts, exams, and classes that you might want to check out to become a Kubernetes or OpenShift admin.
You can find all the details on [The Level Up Hour page](https://red.ht/leveluphour).

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [support-tools container](https://catalog.redhat.com/software/containers/rhel8/support-tools/5ba3eaf9bed8bd6ee819b78b)
* [How do I use the support-tools container on Red Hat Enterprise Linux 8? ](https://access.redhat.com/solutions/3771241)
* [Running support-tools with runlabels](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/building_running_and_managing_containers/index#running_support_tools_with_runlabels)

## Sweet Sweet Internet Points
As of the show this morning:
* dnlhoust: 300 points
* narendev: 300 points
* BenK: 200 points

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt).

## Video Highlights:
* [TLUH E4: Talking about KubeCon EU '20](https://clips.twitch.tv/StrongCrunchySamosaMcaT)
* [TLUH E4: T-Shirts!](https://clips.twitch.tv/TiredMagnificentAxeRitzMitz)
* [TLUH E4: More fighting with podman inspect](https://clips.twitch.tv/SweetGrotesqueHummingbirdWow)
* [TLUH E4: strace is your friend](https://clips.twitch.tv/HappyAwkwardEndiveHeyGirl)
* [TLUH E4: Why you need telnet](https://clips.twitch.tv/SoftMoldyCockroachFailFish)
