# Episode 21: Service Mesh

## Description

Recently, the Kubernetes community announced the deprecation of Docker support. Specifically, the deprecation of dockershim. What does that mean for you? How can you prepare to migrate? Join us for a discussion with [@fatherlinux](https://twitter.com/fatherlinux) and some demonstration.

## Details

* Air Date: Jan. 6, 2021
* [Watch the episode](https://youtu.be/jVyGF-QYJ2M)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Learn More About Level Up](https://red.ht/leveluphour)

### Show Recap

We lead off the show with trying to explain what exactly the show is about today.
First off, this is probably a whole lot of smoke for very little fire.

Scott leads off the discussion about how we had the experience of "deprecating" docker in OpenShift a couple of years ago.
He mentions that he wrote a few blog posts about what to expect and how it would impact people.
Generally, speaking those posts are relevant now as well.
Further, he feels like we can speak from experience about what you should do and whether it will be particularly impactful.

Langdon brings up the fact that this is why the CNCF sets standards.
Basically, having standards means we can have "competitive" implementations of things like container-runtimes without impacting the application(s) that run on them.

We move to the slides.

Scott wrote an article, linked in [Further Reading](#further-reading), about the situation.
Specifically, he has 5 main points to discuss.
However, first he talks a bit about the experience of removing the docker-runtime from OpenShift a couple years ago (an article about that also linked in [Further Reading](#further-reading)).

First up, he talks about how we *had* PAAS but people didn't find it flexible enough.
As a result, we kinda took a step backward to leverage containers.
So, while less automated/easy, full containers allow for nearly infinite flexibility.

Scott then moves on to try to highlight the 5 main points of his article. He also, after giving the list, uses "stars" to indicate how likely you are to see an impact. 5 stars means "no impact" to 0 meaning lots (or, potentially lots):

* Container Images (5*) -- still supported no matter where it came from
* Registry Server (5*) -- Will still host the images
* Runtime Format (5*) -- Your running container will still "look" the same when running
* Command Line Interface (4*) -- Some minor changes to the CLI
* Application Programming Interface (0/1*) -- As the API was largely undocumented, this is where you will see changes. 
However, this assumes you are coding against the docker API, which is pretty unusual.

Langdon goes on to discuss some of the very cool things you can do with docker and how these probably don't belong in production.
However, these are the kinds of scenarios that will be most impacted.

Scott goes on to say, "yeah, well".
Many times people started using some of these "features" (aspects of the API) almost by accident or necessity because they were early adopters.
In these scenarios, you need to do some digging.
However, most of the time, people won't have these issues.

Langdon brings up the history of docker and why it may not map directly to the use cases we put it to now.
Specifically, that the user experience is very tightly coupled to the production runtime.
As a result, kubernetes has a hard time trying to strip out that runtime because it isn't providing the docker user experience at all.

Scott brings up Heroku and the API battle for PAAS.
Not to mention the API battle with configuration management (e.g. puppet, chef, salt) tools also trying to map to that world.
Scott talks about Visual Basic (VB) and how it is really good as long as you have a use case that matches what it is designed for.
Basically, this is the problem with PAAS.
We talk a bit about why the docker user experience is so good.
We also talk a bit about the barrier to entry on building custom "Platforms" (the "P" in PAAS) for both Heroku and OpenShift 2.
Langdon scarily mentions some experiences with VB.

We then talk a bit about how we got here.
Specifically mentioning that the standards didn't exist at the time and then took a while to solidify.
We digress a bit in to a discussion of how software / standards evolve, particularly in the open source world.
Often, this is a good thing.
However, as Scott mentions, people sometimes get "pincered" by choosing a point in time and getting stuck.
Specifically, if this happened to people with kubernetes and are relying on aspects of the docker runtime, this news is tough. 
However, we don't believe that this is a lot of people.
Also, even if you did, you can actually look to Red Hat's experience for ideas because we did this for OpenShift.

Langdon mentions that the change is actually more imminent than any of us expected.
Specifically, the target for removal of dockershim is the fall/end of 2021 version 1.22.
For details, see [Further Reading](#further-reading).

Scott talks about doing some demos showing that you can use any of these things and it is very hard to tell them a part.
In fact, it is often impossible.
Basically, at run time, all of the containers and images look the same.
Langdon proceeds to demo this with a Vagrantfile setting up 3 machines with three different container runtimes.
Vagrant, in fact, is [10 years old](https://en.wikipedia.org/wiki/Vagrant_(software)).
Langdon talks about using vagrant in the [Container Development Kit (CDK)](https://developers.redhat.com/products/cdk/overview).
Suffice to say, the hosts and the audience, definitely recommend vagrant for all your virtual machine'ing needs.

We proceed to discuss the various versions of docker and getting them installed.

Scott mentions that podman 3.0 plans to support docker-compose files!!
We are asked a bunch of ways when people can get it.
Scott answers that early versions may land upstream as early as late January.

We talk a bit about using docker on Linux.
Langdon demonstrates building an image in moby and then moving the image between the moby, docker-ce, and podman machines.
Moving the image using `export` / `import` between all of these and you can just run the image as a container.
It just works.

We do discuss the challenges of modifying networking features in containers and that this may be effected by the changes to kubernetes and dockershim.
To be clear, not the "normal" things you might do but really things like changing how the DHCP works, how the container connects to the network, etc.

Via a number of typos and false starts, we are able to show the image running on each platform.

Scott points out that you can actually discover that these images were created in docker.
However, none of us quite remember how to see it.

We move on to the [Sweet, Sweet Internet Points](#sweet-sweet-internet-points).

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#deprecation
* https://github.com/kubernetes/kubernetes/pull/94624
* a [good explanation](https://twitter.com/tcabeen/status/1334167514339688448) of what to do by @aludwin]
* [Don't Panic: Kubernetes and Docker](https://kubernetes.io/blog/2020/12/02/dont-panic-kubernetes-and-docker/)
* [Kubernetes is Removing Docker Support, Kubernetes is Not Removing Docker Support](https://www.openshift.com/blog/kubernetes-is-removing-docker-support-kubernetes-is-not-removing-docker-support) by Scott McCarty
* A [post about when OpenShift moved to CRI-O](https://www.redhat.com/en/blog/red-hat-openshift-container-platform-4-now-defaults-cri-o-underlying-container-engine) by Scott McCarty


## Sweet Sweet Internet Points

As of the show this morning:

* nlhacm:            2,900
* narendev:          2,500
* Noah Frickshun:    2,300
* Joefuzz:           1,800
* nhermans:            300
* jpdade:              300

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

