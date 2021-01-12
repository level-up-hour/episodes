# Episode 19: Containers, Data Science and Replication

## Description

Matt Micene (@cleverbeard), of Red Hat Tech PM, will join us for a topic that is close to his heart. There are two aspects really: a) how to make data science easier; b) how to improve the Reproducibility of data science experiments. We both think containers are an answer.

## Details

* Air Date: Dec. 16, 2020
* [Watch the episode](https://youtu.be/OX82D8O8jxI)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More About Level Up](https://red.ht/leveluphour)

### Show Recap

We welcome Matt Micene to the show.

We talk first about giving presentations and using just an image and a couple keywords on each slide.
We also discuss having two sets of slides, one you present with and one that you make available for reference.
Matt mentions that your speaker notes, with some cleaning up, can be a good source for the "reference slides."
Matt also mentions that you look up Guy Kawasaki for more thoughts on this subject.
We reference one of his blog posts in [Further Reading](#further-reading). 

Next, we give a slightly longer introduction to the show than normal for any new people.

We move on to talk about Reproducibility and what it means in the context of science as it is the topic of this episode.
We go back to the show information.

Langdon then asks Matt to give a bit of an overview of the problem we are trying to solve and why he is interested.
Matt proceeds to give some differences between the practice of "science" and the practice of "software development."
Basically, most of the time in software we don't need to make sure everything is always an exact match.
However, in science, you often want (or need) to be able to reproduce the **exact** results you produced in a different setting.
Matt refers to this as "fact checking."
He then goes on to discuss "executable papers."
Using tools like Jupyter Notebook, scientists can write prose and mix in the actual algorithms and data that they used to get their results.
Jupyter presents it nicely but also allows the "reader" to actually test it.
In this way, your "peers" (in the "peer review" sense) have a complete "bundle" where they can verify your content and the conclusions you reached.

Langdon asks if there are any "best practices" that Matt is aware of that solve the "how do we share data without mailing around hard drives."
Matt is not aware of any universal solutions.
However, there are a number of solutions that people use.
So, while there may not be an "answer" there are at least a set of answers to choose from.
Matt gives a few examples.
First, people have been experimenting with large-file version control systems like [git-lfs](https://git-lfs.github.com/).
Next, Matt talks about a few companies/orgs that are trying to be the solution to this problem but doesn't think there is a "winner" yet.
He mentions Jupyter as one of them, but can't recall the other two he is aware of. 

Matt moves on to the "data problem" is a general problem of "inertia" and data doesn't like to be moved around in general and it is not unique to science problems.
Chris proceeds to give an example from his career.
Langdon mentions [Brian Cantrell](http://dtrace.org/blogs/bmc/) and his thoughts on "moving compute to data."
Well, Langdon can't actually remember his name but Matt knew it immediately.
We discuss how this might be a better approach to this problem.
However, not much software works this way today.

Langdon asks Matt if there tools/frameworks/etc that support these "amateur developers" who are not trained as software developers and would much rather focus on their "work" than trying to become master programmers.
Matt proceeds to elaborate on this concept that the scientists might be very good at a language like R or Python but may or may not be able to keep up with the language ecosystem.
Matt proceeds to give an example of the problems scientists have from his own life.
Specifically, about the magic of version locking.
Matt does suggest Jupyter's containers for data science as providing a lot of features as a "baseline" for data science work.

We then move on to talk about packaging and the challenges of the variations between language packaging tools (e.g. pip, gem), distribution packaging (e.g. rpm, deb), app packaging (e.g. vscode extensions), container packaging (e.g. flatpak, snap, appimage), etc.
We go in to some detail about the challenges of all the different package managers and why this makes our world harder.
Matt specifically references his earlier example and points out that the solution was actually the difference in how two different python package managers worked.

Matt points out that in the particular use case of the show, data science reproducibility, we actually *do* want as much locking as possible because we need everything to be replicable.
We talk about [Open Data Hub](https://opendatahub.io) and how one of their goals is to allow you to do replicable research.
Langdon brings up the Massachusetts Open Cloud (MOC) which is a collaboration of a bunch of universities contributing to one data center that can be available for researchers.
It is particularly interesting that the MOC is also trying to push forward research in shared computing under the more traditional STEM science research.

An audience asks "why is this hard? isn't 2+2 always = 4?"
Matt proceeds to explain "yes, but."
Specifically, that the formula and the implementation may not be the same.
The implementation makes certain assumptions that someone else creating the implementation or algorithm to implement formula may do differently.

Langdon brings up a couple of the tradeoffs of doing math on computers.
He mentions rounding issues and pseudo-random number generators.
Langdon also mentions that this is part of the appeal of quantum computing because the tradeoffs for doing math are less pronounced.

Matt provides an example of when a language, he thinks python, changed its rounding rules between versions.
This can result in *very* different results in the outcomes.

Langdon mentions that a CS degree often has a lot of math focus.
However, you proceed to, in general, never use it as a developer.
These days though, with data science becoming very popular and important, the math a CS person learned in college, and all the problems of doing math on computers, has become more common.

Chris brings up DeepMind and some recent results they have had regarding protein folding.
Langdon mentions that an "amateur scientist" had actually won some prizes for protein folding who was under 18.
Langdon also talks a bit about Tiling and an amateur mathematician.

[TLUH E19: Shapes on a Plane!](https://clips.twitch.tv/EnchantingSolidPheasantCmonBruh)

Matt proceeds to talk about lowering the barrier of entry to science in general.
He particularly points out kaggle and the good work and community they have built.

Matt proceeds to bring up data lakes and trying to move compute in to those environments so that the data can stay "at rest".
Langdon begins a bit of a discussion of using data marts to "present" data to your application.
Chris asks if it is basically a data cache.
Langdon agrees but provides some nuance, e.g. that some times they are actually "write-through."

Langdon loops back around to tool support for science in the container world.
Matt provides a description of such a tool but doesn't know of any particular ones.

A question from the audience asking that we elaborate on data marts and their implementation.
Langdon first gives some examples of nosql (aka document stores), key-value databases, and sql databases and why you might choose them for different applications.
We explain the why of data marts in terms of why you want to aggregate the data of a lake into something that is more consumable by the application.
For example, your "customer record" may be broken out in to a lot of different tables in your lake but when you want to show the user their profile, you want all that information crashed together.
A mart might have all the customer information in one "table" to make querying that information faster.
Langdon also gives an example of using a nosql database like mongodb in the scenario of large numbers of documents of which you only need some for your live website.

We proceed to [Sweet, Sweet Internet Points](#sweet-sweet-internet-points).
We then close with the announcement of the recently released [OpenShift Developer Sandbox](https://developers.redhat.com/articles/2020/12/09/get-started-your-developer-sandbox-red-hat-openshift).

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [Reproducibility](https://en.wikipedia.org/wiki/Reproducibility)
* An example of Guy Kawasaki's [writing](https://guykawasaki.com/the-only-10-slides-you-need-in-your-pitch/) on slides
* [Jupyter Notebook](https://jupyter.org/)
* Brian Cantrell's [blog]](http://dtrace.org/blogs/bmc/)
* [Open Data Hub](https://opendatahub.io)
* An audience member recommended a book on [Quantum Computing & Data Mining](https://doc.lagout.org/Others/Data%20Mining/Quantum%20Machine%20Learning_%20What%20Quantum%20Computing%20Means%20to%20Data%20Mining%20%5BWittek%202014-08-28%5D.pdf)
* [Intro to Tilings](http://pi.math.cornell.edu/~mec/2008-2009/KathrynLindsey/PROJECT/homepage.html)
* [kaggle](https://www.kaggle.com/)

## Sweet Sweet Internet Points

As of the show this morning:

* nlhacm            2,900
* narendev          2,400
* Noah Frickshun	2,300
* Joefuzz           1,800
* nhermans:         300
* jpdade:           300

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights

* [TLUH E19: Shapes on a Plane!](https://clips.twitch.tv/EnchantingSolidPheasantCmonBruh)