# Season 1 Episode 8: Podman Pods & Data Containers

## Description:

## Details
* Air Date: Sept. 16, 2020
* [Watch the episode](https://www.twitch.tv/videos/742702591) (_NOTE: link may expire, see [openshift.tv](https://openshift.tv) if it does._)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

## Show Notes:

### Strict Agenda:
* podman pods
* data containers

### Show Recap:
Talked about [https://devconf.us](https://devconf.us) and why you might want to go.
If you missed it, the next one is [https://devconf.cz](https://devconf.cz) in February, 2021.

[TLUH S1E8: DevConf.US Overview](https://clips.twitch.tv/ResilientWittyRamenSMOrc)

We discussed why there are so many `man` page websites.
I don't think we came to a conclusion.

Talked about [ImageMagick](https://imagemagick.org/index.php) and [pandoc](https://pandoc.org/).
Two great tools for converting image and document formats (respectively).

We covered the types of admin-useful containers: executable and bundle of tools.
Discussing our examples from prior shows.

A bit of discussion why you would choose to create a container that just wraps another container.
The primary reason is so you are not surprised by updates.
However, it also makes later extensibility easier.

[TLUH S1E8: Wrapper container](https://clips.twitch.tv/ArbitraryAliveTitanOSsloth)

We go on to build our simple support-tools container.
We also point out how the namespacing of container images works.
Also point out the handy `--rm` flag to `podman run`.

We go on to build the `perfect-tools` container.
Talk a bit more about the `run label` and how awesome it it.
While building, we also briefly touch on `--no-cache` for when you want to rebuild from, almost, scratch.
It is important to remember that `--no-cache` will **not** re-pull the base image.

We move on to discuss `data containers`.
Data Containers are handy because they can help redirect your storage layer.
You could consider putting functionality in your data container for doing backups or pushing to remote repos.

[TLUH S1E8: Why data containers?](https://clips.twitch.tv/OnerousBoredMomFunRun)

Another note on caching, just because you change the name of the `container image` when you build it this does not mean that the cache will be bypassed.
The container builder is smart enough to still use the same cache no matter what name you provide for the image.

We move on to talk about using data containers as a layer of indirection for a container which needs files but when you run the container the files are in different locations on disk.
While not strictly necessary, it can mean changing the launch information for one container and not a whole host of containers.
We then move on to launch the data container configured correctly to find the files it wants to share.
We then show how the `--volumes-from` flag to surface the `volumes` from the data container in to the rest of our containers.

When we launch the new container, we run it detached and then attach to it.
We then verify that the volumes have been mounted, in an editable way, inside the container.
Now we need to leave the container to launch the next one.
However, when we exit the container we use `ctrl-p`, `ctrl-q` to leave the container without stopping it.

[TLUH S1E8: How to get out of a container!](https://clips.twitch.tv/IgnorantCooperativeLemurAliens)

A little sidebar about typing classes.

[TLUH S1E8: Why Langdon can't type](https://clips.twitch.tv/HotShakingJamYouDontSay)

We then launch our support-tools container leveraging the same data container so that the volumes are shared by both of our useful containers.

A brief sojourn on bacon & Canadian bacon.

We then talk for a bit about cleaning your podman using the various commands under `podamn system`.

Finally, we introduce `pods`.
We demonstrate the creation of a new, empty pod and discuss the `pause container`.
Chris shows off the "[The Illustrated Children’s Guide to Kubernetes](https://chrisshort.net/kubernetes-illustrated-childrens-guide/)" and its awesome explanations of concepts in Kubernetes.
He goes on to read the description of a Kubernetes pod from the book and then further elaborates on its origin.
We also caution against using multiple containers in a pod.
However, in this use case we actually want all the containers to be in one pod because we need them all on the same machine to do our diagnostics.
Luckily, the flexibility of pods allows us to choose this option.

We quickly sidebar in to the various "technical coloring books" that have been created by Red Hat.
Go get your [coloring books](https://red.ht/all-the-ebooks) for you or your kids!

We next move on to creating a new pod with containers inside it.
However, we pause to answer a bunch of chat questions.
In particular, we discuss you do **not** want to put a whole 3-tier app into one pod.

We next discuss sidecars and give a bunch of examples.
If you want to jump to this discussion it is at about minute 50.
I also discuss how sidecars are examples of a [`cross-cutting concern`](https://en.wikipedia.org/wiki/Cross-cutting_concern) which are often used for error handling, security, caching, etc.
Even the `pause` container is an example of a sidecar.

I briefly talk about my use of [Joplin](https://joplinapp.org/) for taking notes.
We then talk a bit about text editors and the change to [nano](https://www.nano-editor.org/) by default in [Fedora 33](https://getfedora.org/)

We go back to putting all of our containers in to a single pod called tools-pod.

However, our real goal was to get a deployment mechanism for our containers, including our configured data container.
But, this is where we run in to the problem Langdon teased at the beginning of the show.
Basically, if we try to export a yaml description of the pod and the pod contains privileged containers, we discover it is not implemented.

As a result we modified the container to provide tools that don't require `--privileged` and rebuilt our `tools-pod`.
We got a question about using sudo with podman.
Essentially, when you use `sudo` you are running podman as the root user who has a different image and container cache than your normal user in addition to having different privileges.

We then are able to export our kube yaml for reuse on any machine with access to the containers we built.

We ran in to some problems actually running the yaml.
We will try to fix that in a future show.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
* [cross-cutting concern](https://en.wikipedia.org/wiki/Cross-cutting_concern)
* [coloring books](https://red.ht/all-the-ebooks)
* [The Illustrated Children’s Guide to Kubernetes](https://chrisshort.net/kubernetes-illustrated-childrens-guide/)
*

## Sweet Sweet Internet Points
As of the show this morning:
* narendev: 700
* Joefuzz: 400
* jwalter: 400

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights:
* [TLUH S1E8: DevConf.US Overview](https://clips.twitch.tv/ResilientWittyRamenSMOrc)
* [TLUH S1E8: Wrapper container](https://clips.twitch.tv/ArbitraryAliveTitanOSsloth)
* [TLUH S1E8: Why data containers?](https://clips.twitch.tv/OnerousBoredMomFunRun)
* [TLUH S1E8: How to get out of a container!](https://clips.twitch.tv/IgnorantCooperativeLemurAliens)
* [TLUH S1E8: Why Langdon can't type](https://clips.twitch.tv/HotShakingJamYouDontSay)
