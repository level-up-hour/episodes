# Episode 22: Introducing the Microservice CoolStore

## Description

@schtool and others have been building an app that is meant to simulate a retail store to use as a practical demo of all the cool microservice things. At the show, we are considering switching to this application for our demos. Join us, @schtool, and @danieloh30 for a demo and backstory.

## Details

* Air Date: Jan. 20, 2021
* [Watch the episode](https://www.youtube.com/watch?v=cfCgcONYUm0)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More About Level Up](https://red.ht/leveluphour)

### Show Recap

We open the *wrong show*.
As you probably know, this is *not* [In the Clouds](https://www.youtube.com/playlist?list=PLbMP1JcGBmSHHAsJ3PDd5TiK8xGaUFgrn) but The Level Up Hour!
Meh, coffee.
However, In the Clouds is lovely, you should definitely check it out.

[TLUH E22: *Not* In the Clouds](https://clips.twitch.tv/HeartlessArborealClintVoteYea)

We talked about [Liferay](https://www.liferay.com/) because James used to work there.
However, more the one from 10+ years ago.

We talk about the weird relationships you have when you travel a bunch.

We talk next about the need for an application that we can more easily modify to demonstrate things on the show.
However, we also want something that "out of the box" is more complex than "hello world."
This has led us to "[The Cool Store](https://github.com/jbossdemocentral/coolstore-microservice)".

James talks about the origin of the application and how it was originally a monolith and where and how it has progressed.
He also talks about how it grew as a platform for demos around Red Hat.
We also discuss how Langdon & Chris' teams are talking about adopting it for their team demos.

We move on to a discussion of different types of testing.
Specifically discussing something we missed in the last show, A/B testing.

James talks about moving from the cool store from monolith to a set of microservices.
He ran in to a number of challenges migrating to such a decentralized approach.
However, he also notes that the decomposition of services allowed for a lot more flexibility in terms of the clients allowing for things like mobile apps to minimize their need for change.

Langdon asks James to elaborate on Camel.
Essentially, it is integration technology with pre-built connections for a large number applications.
Camel K allows you to bring Camel to Kubernetes.
We talk a bunch about Camel, integrations, Red Hat Fuse, and other fun integration activities.

We move on to doing some demos of the application.
We also discuss approaches to migration and, for this application, you can actually see the source code for how the migration happened.
James also mentions that Red Hat has a tool (open source) that may be helpful in doing these kinds of shifts.
Check out [Further Reading](#further-reading) for both links.

As [kafka](https://kafka.apache.org/) comes up a lot in the demo and discussion, we digress to talk a bit about kafka.

We take some questions from the audience.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [Red Hat Cool Store Microservice](https://github.com/jbossdemocentral/coolstore-microservice)
* [Red Hat Cool Store Monolith](https://github.com/coolstore/monolith)
* Service Mesh and the Cool Store (but a bit older) [Bringing Coolstore Microservices to the Service Mesh: Part 1 – Exploring Auto-injection](https://developers.redhat.com/blog/2018/04/05/coolstore-microservices-service-mesh-part-1-exploring-auto-injection/)
* For more on [Apache Camel](https://camel.apache.org/) and [Camel K](https://camel.apache.org/camel-k/latest/index.html)
* [Migration Toolkit for Applications](https://developers.redhat.com/products/mta/overview)

## Sweet Sweet Internet Points

As of the show this morning:

* nlhacm:            3,900
* narendev:          3,400
* Noah Frickshun:    2,900
* Joefuzz:           2,200
* Det_Conan_Kudo:      500
* sausagecrumbs:       400

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights

* [TLUH E21: A Walking Oxymoron](https://clips.twitch.tv/EphemeralAmericanRamenPraiseIt)
* [TLUH E21: Episode Titling](https://clips.twitch.tv/PuzzledDependableFriseeKappaClaus)
