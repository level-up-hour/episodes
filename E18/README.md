# Season 1 Episode 18: Nextcloud on OpenShift

## Description

We have been working on containerizing Nextcloud for a few episodes now.
We even got some help from an audience member!
However, this episode will be about deploying those containers in OpenShift.

## Details

* Air Date: Dec. 9, 2020
* [Watch the episode](https://youtu.be/tP5JE_qViNA)
* [Show Recap](#show-recap)
* [Further Reading](#further-reading)
* [Sweet, Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda

* Let's get Nextcloud running in OpenShift

### Show Recap

We led off with some fun technical difficulties.

We talk a bit about the CentOS announcement.
We recommend you read the [FAQ](https://www.redhat.com/en/blog/faq-centos-stream-updates) if you want more information.

We then talk a bit about next week's show "Containers, Data Science and Replication."
We then digress in to a discussion of NMR Spectroscopy and MRI.

First up, we create a new project in OpenShift using `oc new-project <project-name>`.
We then discuss the setup Langdon is using for this demo.
Running [CRC](https://developers.redhat.com/products/codeready-containers/overview) on a VM.
CRC is, itself, a VM so be sure to turn on "nested virtualization."
You can then use haproxy to route incoming traffic to "your" VM to the CRC VM.
If you want more details see the blog post in [Further Reading](#further-reading).

First up, we discuss how to load your credentials for registry.redhat.io in to your OpenShift project.
Basically, you can follow along on the instructions on the "Get This Image" tab on any container in the [Red Hat Container Catalog](https://catalog.redhat.com).
For example, here is the [`php-74`](https://catalog.redhat.com/software/containers/rhel8/php-74/5f5211e39df2542e4756afd1?container-tabs=gti) one.

We digress a bit into discussion of some confusion in the UI about the differences between images and operators when you find them in the catalog.

We then proceed to setup up the mariadb container.
One thing that we discovered is that you must use `registry.redhat.io/rhel8/mariadb-103` for the "Image Name" name because if you use just `rhel8/mariadb-103` it won't find it.
We also set the icon to be the one for maria.

We then proceed to setup the persistent storage for the database.

Then, power outage!

When we get back, we jump in to setting up the Persistent Volume **Claim** (PVC) for real this time.
CRC creates a bunch of Persistent Volumes (PV) for you so, if you were in a "real" OpenShift install, you would want to be sure you have a PV available.
In the Web Console, we go to the container in the Topology View, then click on the maria, then "Add Storage".
On the new screen, we give it a name, a size, and where to place it in the container.
We look up in the "how to" for the container on the catalog page for what this path should be.
We ignore the sub-path in the PVC and create it.

Next, we need to give the maria container some passwords.
So, we go to Secrets in the Web Console and create a new Secret.
Give "the set" of credentials a name like "mariadb-creds."
We reference the catalog page for the secrets/environment variables we need to set.

We give a little bit more detail on the "sub-path" option because of a question in the chat.

Happily, the database is working now.

We talk a bit about `project` vs `service` vs `app` in Kubernetes/OpenShift parlance and how it is a bit confusing.
Leading in to creating `oc new-app` and passing it the content of our github repo.
We proceed to watch OpenShift build the container.
Specifically, we note that you should check the logs to make sure that the base image you want is actually being used.
When experimenting, Langdon discovered that it silently will replace base images if it can't find the base image you were looking for.

CRC proceeds to throw an error.
We proceed to try to troubleshoot.
First we check disk space on both the VM hosting CRC and the bare metal hosting the VM.
Next we check that local to the machine we can replicate the errors using `curl`.
Finally, we just `crc stop` and `crc start` and proceed to show our latest [Sweet, Sweet Internet Points](#sweet-sweet-internet-points).

Based on a question from the audience we explain the relationship between OpenShift, CRC, and Kubernetes.
We also explain why "Operators" and how they are similar to RPMs in that they bundle "packager expertise" in the distribution to users.

We close by briefly covering the last bits of what we *should* do for the Nextcloud instance.
However, we started to run out of time so we moved quickly.
Perhaps we will cover this in a future episode.

Lastly, we recommend that if you wish to actually deploy Nextcloud in containers, base your plan on the [Nextcloud maintainers' containers](https://github.com/nextcloud/docker).

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.

* [CentOS Announcement / CentOS-Stream FAQ](https://www.redhat.com/en/blog/faq-centos-stream-updates)
* [Article](https://jperrin.org/blog/thoughts-on-stream/) from Jim Perrin, former lead of CentOS, CentOS board member
* [Overview: running crc on a remote server](https://gist.github.com/tmckayus/8e843f90c44ac841d0673434c7de0c6a)
* [Nextcloud maintainers' containers](https://github.com/nextcloud/docker)

## Sweet Sweet Internet Points

As of the show this morning:

* nlhacm: 2,100
* Noah Frickshun: 1,900
* narendev: 1,800
* Joefuzz: 1,400
* jwalter: 300
* sausagecrumbs: 300

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights

* 