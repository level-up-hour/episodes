# Episode E28: Fixing Our Developer Sandbox Fail

## Description

Last time we sat down to explore the Red Hat OpenShift Developer Sandbox with CodeReady Workspaces, and things didn't quite go as planned. But who really wants to turn a project on and have it work perfectly the first time? In this episode, let's take another run at the Developer Sandbox and get those Workspaces doing what we want. Join us as we take a look at what went wrong, how we can fix it, and we should now be able to get the Cool Store working.

## Details

* Air Date: Mar. 24, 2021
* [Watch the episode](https://www.youtube.com/watch?v=FFAnseRSV6M)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Learn More About Level Up](https://red.ht/leveluphour)

### Show Recap

We mention briefly, last episode and some improvements to blender-render from way back.

We briefly cover accessing the Developer Sandbox again.

We digress a bit to talk about Site Reliability Engineering.
We mention the book of the same name and "The Phoenix Project."
We then talk about learning from "unicorns" and the popularity of becoming an SRE.

First up, we explain the different "projects" or "namespaces" that are created.
Specifically, that you should pretty much ignore `<username>-code` as it is used for CodeReady Workspaces.
You should start in `<username>-dev` and then "promote" to `<username>-stage`

We move on to displaying how you deploy a sample django application and how it works.
We specifically call out "Services" and "Routes" and how they are introduced even in samples.
After showing a bit about the sample, we move in to a long discussion about the "delete operations" when trying to remove components from a project or namespace.

We move on to demonstrate adding applications from public git repos.
Struggle for a bit with Langdon's terminal window.
We then run in to a bunch of problems trying to do a create.

We take a bit of a digression to talk about fish-shell.
We also note that, at the moment, you can't use Serverless or Service Mesh on Dev Sandbox.

We move on to show CodeReady Workspaces and what it can do.
However, we also briefly discuss why operators are not available in the Dev Sandbox.
We mention the relationship between Che, the upstream for CodeReady Workspaces, and VS Code.
We move on to discuss `devfile` and how advantageous it is for development teams.
We also mention devfile v2.
We also interlude a bit on Vagrant, vagrant-registration and using vagrant with containers.

We finally close discussing how Workspaces and your OpenShift code interact.
In short, they don't really by default.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [Site Reliability Engineering: How Google Runs Production Systems ](https://www.goodreads.com/book/show/27968891-site-reliability-engineering)
* [The Phoenix Project](https://www.goodreads.com/book/show/17255186-the-phoenix-project)
* [fish-shell](https://github.com/fish-shell/fish-shell)
* [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
* [vagrant]()
* [vagrant-registration](https://github.com/projectatomic/adb-vagrant-registration)

## Sweet Sweet Internet Points

As of the show this morning:

* narendev:          4,600
* nlhacm:            4,500
* Noah Frickshun:    3,500
* Joefuzz:           2,300
* Det_Conan_Kudo:    1,500
* baconfork:           800

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).
