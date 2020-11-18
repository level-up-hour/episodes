# Season 1 Episode 14: When to Orchestrate w/ Scott McBrien

## Description

We have invited Scott McBrien, RHEL guru, to talk to us about when running a container natively is sufficient and when you should be thinking about OpenShift.

## Details

* Air Date: Nov. 11, 2020
* [Watch the episode](https://youtu.be/AJhp3kELruU)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda

* Interview with [Scott McBrien](https://twitter.com/stabby_mc)

### Show Recap

We start with some t-shirts.
Chris shows off his "Podman the Rapper" t-shirt which is a throwback to [Episode 5](../S1E5/README.md).
Scott shares his "Containers are Linux" t-shirt, which is awesome, and kind of a hot commodity.
Langdon shares one of his favorite shirs, "Code On;" which is a cool OpenShift t-shirt.

First up we discuss when is running containers with "just" podman insufficient.
We use "OpenShift" as a euphemism for true container orchestration throughout the show but this could easily be replaced with "Kubernetes" or some other orchestration engine.
Obviously, the feature set would be different depending on the orchestration platform but the crux on managing a set of containers would be similar.

Scott's first example is when you need a set of coordinated containers to accomplish some goal.

We back up a bit to discuss what orchestration provides above and beyond what is provided in RHEL natively (e.g. podman).
Scott provides examples about monitoring up time, distributing your containers across multiple instances, etc.
Langdon suggests that shared storage across the containers is a big feature of orchestration engines.
We all discuss how orchestration *can be* done by RHEL natively but not without a lot of work on the part of the admins of the containers.

Scott moves on to bring up another example is a set of containers that use a large number of different host provided services.
Basically, if they are using lots of networks, storage, etc. keeping track of what is connected to each container and if it is connected correctly is an argument for an orchestration engine.

Langdon also brings up the example of a Service Mesh which is difficult without an orchestration engine.
Basically, using an orchestration engine allows for layered functionality on and around your containers.

We move on to a discussion of deploying the containers out on to your infrastructure.
How do you do that?
Well, it is not that hard using shell or Ansible.
However, what do you do then.
For example, ensuring it is running, updating, validation, etc.
Not to mention, how do you know you even covered all the concerns.
Using an Open Source Orchestration Engine also gives you a community of people who are thinking about the same problems and noticing the issues that you may not have thought of or discovered yet.
Scott proceeds to give a true example.

[TLUH S1E14: JASON!! <shakes fist>](https://clips.twitch.tv/SolidTardyPonyKlappa)

However, our real point here is that developers, admins, etc. should not be building out complicated, bespoke environments.
We proceed to give a few examples.
So, the argument here for off-the-shelf (OTS) orchestration is also when you start to build out orchestration, be careful you aren't building an un-maintainable beast.

We then move on to discuss the importance of a "Learning Organization."
Specifically in the scenario of knowing that OTS exists for the use case you are starting to build out some new thing.
Chris moves on to provide some examples about how he stays "always learning."

We then move on to discuss "when is the tipping point" for when you should introduce orchestration.
If you do it too early, you pay for it in overhead.
If you do it too late, it is very expensive (usually in time/effort) to do.

The general consensus is orchestration makes sense when the complexity rises.
However, knowing when complexity is sufficient to warrant orchestration.
Scott gives a number of examples of complexity which would warrant orchestration.
Check it out starting around minute 37.
The example Langdon gives of complexity is how many branches and depth of your dependent containers.

Why not orchestrate early?
Someone suggests that it is like security and that it is expensive to add later.
We discuss how that trades off against maintenance costs.
Langdon brings up the example of movie websites which may not require orchestration.
Why?
Because they are fast and furious and don't have a lot of change.

Scott points out that you can start with simple RHEL containers and transition to orchestration.
Red Hat offers the whole stack which means your organization can scale with the same vendor.
Langdon discusses using podman->podman pods and how it more easily grows in to true orchestration in comparison to docker-compose.
We continue to discuss how if you make "growable choices" early then when you want to grow you don't have to throw things out.
Scott further discusses how Red Hat tries to provide the roadmap of your application growth.
He gives examples like s2i and operators.

Langdon discusses that it would be nice to be able to use operators (or operator-like) components in podman so that you don't have to make changes to your infrastructure as you grow.

We move on to discuss Sweet, Sweet Internet Points and The End of the Internet.
We also discuss the launch of Yahoo and how obvious it was in retrospect.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* If you want to know more about why you might use a Service Mesh, Langdon recently wrote a [thing](https://www.openshift.com/blog/what-is-openshift-service-mesh-2.0-and-is-it-for-you)
* [Learning Organization](https://en.wikipedia.org/wiki/Learning_organization)


## Sweet Sweet Internet Points

As of the show this morning:

* Noah Frickshun: 1,500
* narendev: 1,300
* Joefuzz: 900
* nlhacm: 900
* jwalter: 400
* sausagecrumbs: 300

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights

* [TLUH S1E14: JASON!! <shakes fist>](https://clips.twitch.tv/SolidTardyPonyKlappa)
