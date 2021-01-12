# Episode 11:  What's Next and Nextcloud

## Description:
Want to discuss what we should do on the show next and, in the meantime, let's get Nextcloud in to OpenShift.

## Details
* Air Date: Oct. 14, 2020
* [Watch the episode](https://youtu.be/Lmcf2CaHUS4)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda:
* Talk about what's next
* Begin the process of containerizing Nextcloud

### Show Recap:

Talked about a few events, [AnsibleFest](https://www.ansible.com/ansiblefest), [EnvoyCon](https://events.linuxfoundation.org/envoycon/), [Red Hat Summit](https://www.redhat.com/en/summit), and [Community Leadership Summit](https://2020.allthingsopen.org/events/community-leadership-summit-2020/).
[EnvoyCon](https://events.linuxfoundation.org/envoycon/) is tomorrow (Oct. 15, 2020).
[Red Hat Summit CFP](https://reg.rainfocus.com/flow/redhat/sum21/rhcfp/login) is now open!

We also talked about Boston and hockey!

[TLUH E10: Hockey and Langdon's home life](https://clips.twitch.tv/FrailSpikyLionRitzMitz)

We talked a bit about the weather because someone asked in the chat.
We went back and forth a bit on Fahrenheit vs Celsius.
Langdon said it was about 60F in Boston, which, post show research shows, is about 18C.
Chris said it was 17C in Michigan which, post show research shows, is about 62F.
Someone asked in the chat what the temp in Michigan in kelvin, which we missed but post show research shows about 290K.
And, apparently, you shorten kelvin as "K" per the [National Geographic Style Manual](https://sites.google.com/a/ngs.org/ngs-style-manual/home/T/temperatures).
Who knew they even had a public style manual?

We have a bit of a discussion about using website generators like [Hugo](https://gohugo.io/) and touch on [Jamstack](https://jamstack.org/what-is-jamstack/) and [Netlify](https://www.netlify.com/).

Finally moving on to the crux of the show.
We are going containerize Nextcloud.
While Nextcloud does provide some containerized components we want to use this as an example of containerizing an existing application.

We begin by taking a look at the installation directions and start to match that in to a Containerfile.
We start to look for ways to get some hints on what we will need inside our containers.
We do discover, thanks to an audience member, that we are actually looking at an old version of the installation directions :/.

We show how one goes about finding a good base image for our application.
Using podman search and the (now correct) installation manual, we find that there is a `ubi8/php-73` image that would be a good base for our application.
Chris digresses a bit in to how we got from here to there with php-5x -> php-7x.

We examine the base image we found and start taking a look at the dependencies that are required and mapping them to the list of packages provided by the ubi8 image.
One of the nice features of the [Red Hat Container Catalog](https://catalog.redhat.com/) is that it not only displays the [Containerfile/Dockerfile](https://catalog.redhat.com/software/containers/detail/5d400891bed8bd38099104e0?container-tabs=dockerfile) but it also has a searchable [list of packages](https://catalog.redhat.com/software/containers/detail/5d400891bed8bd38099104e0?container-tabs=packages).

However, we decide that this approach is a lot of work and decide to just wing it.

We talk a bit about choosing Apache's httpd vs nginx (pronounced "engine-x").
We decide to stick with httpd because it is the recommended installation choice. 
However, we may come back and do nginx later.

We digress in to a quick discussion about Windows NT using example.com for its examples and so people were standing up sites at blah.example.com.
Langdon points out that he uses non-ssl example.com to trigger captive portals because there is always a non-ssl version available.

A quick discussion in the chat about the relative merits of nginx vs httpd.
However, the conclusion it is a matter of opinion.

We then move on to discuss getting the database in to a container.
Chris mentions that being able to use ansible to do that would be handy.
However, we don't proceed on that route and just do a yum install for now.

We then start to discuss how we will manage the database inside the container.
By default, we can't use the systemd controls like we would on a native install.
However, we move on to Sweet, Sweet Internet Points.

We then discuss ideas for future shows which, hopefully, will go on the issues list soon.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
*
* [AnsibleFest](https://www.ansible.com/ansiblefest)
* [EnvoyCon](https://events.linuxfoundation.org/envoycon/)
* [Red Hat Summit](https://www.redhat.com/en/summit)
* [Community Leadership Summit](https://2020.allthingsopen.org/events/community-leadership-summit-2020/).
* [Red Hat Summit CFP](https://reg.rainfocus.com/flow/redhat/sum21/rhcfp/login) is now open!
* [National Geographic Style Manual](https://sites.google.com/a/ngs.org/ngs-style-manual/home/T/temperatures)
* [Hugo](https://gohugo.io/)
* [Jamstack](https://jamstack.org/what-is-jamstack/)
* [Netlify](https://www.netlify.com/).
* [Red Hat Container Catalog](https://catalog.redhat.com/)
* [PHP Container](https://catalog.redhat.com/software/containers/detail/5d400891bed8bd38099104e0) but it also has a searchable.

## Sweet Sweet Internet Points
As of the show this morning:
* Noah Frickshun: 1200
* narendev: 1100
* Joefuzz: 700

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights:
* [TLUH E10: Hockey and Langdon's home life](https://clips.twitch.tv/FrailSpikyLionRitzMitz)

