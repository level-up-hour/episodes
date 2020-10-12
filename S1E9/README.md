# Season 1 Episode 9: Podman Pods and Using CRC as a Registry

## Description:

First up, let's get our kube-yaml working.
Then let's deploy it around using OpenShift as a container registry.
Lastly, let's see if we are convincing you!

## Details
* Air Date: Sept. 30, 2020
* [Watch the episode](https://www.twitch.tv/videos/756426645) (_NOTE: link may expire, see [openshift.tv](https://openshift.tv) if it does._)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda:
* fix the yaml from the last episode
* are we convincing you
* cool pod commands
* podman troubleshooting guide
* using OpenShift as a registry

### Show Recap:

Talked about a new event taking place on https://openshift.tv.
Red Hat will be sharing the "What's New in OpenShift" internal presentation live on the Twitch stream.
Check it out right after TLUH at 10am Eastern (14h UTC) on Weds, Oct. 7, 2020!

Had a question from the audience about when windows worker nodes would be available in OCP.
Short answer is, "in progress."
However, long answer is, multi-company code can be challenging to execute.

We then proceeded to demonstrate how to make the kube yaml work correctly.
First we had to recreate our containers and pod which had some typing challenges.

As an interlude, Chris got an answer about windows worker nodes.
We should see community versions in October with a released version towards the end of the year or early next.
We were collectively surprised by the rapidity and definitiveness.

[TLUH S1E9: We are surprised by Windows Nodes](https://clips.twitch.tv/TallBrainyVelociraptorThisIsSparta)

We then generate our yaml using `podman generate kube > tools-pod.yaml`.
We proceed to edit the yaml file to remove the tags which were causing failures in the last episode.

A question is raised about viewing the terminal screen/font.
We proceed to discuss a little bit about color choices and do some experiments.
A member of the audience proposed the [dracula theme](https://draculatheme.com/) if anyone wants to check that out.

We move to demonstrate an easier way to restart your containers when they are in a pod.
A handy feature is being able to `podman pod restart tools-pod` to get your containers back.

We finally get to editing the yaml so that it will be runnable from `podman play kube`.
Essentially, you need to either remove the image tags or replace them with "not latest."
Once you do that, you can "play" the yaml.

Next we move on to getting a registry from OpenShift for deploying our container images using our yaml.
Before getting there we talk about using CodeReady Containers or "crc".
You can get it yourself, for free, by going to [Try OpenShift](https://red.ht/stream-try) and clicking on "Try it locally".
We also discussed the VS Code plugin for crc which will directly install it.
Check it out at the [extension page](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-openshift-connector).

We then talk about using dnsmasq to route to crc from another machine.
For example, you can run crc on a virtual machine on a server and then connect to it from your laptop.
Informed by a [great blog post](https://www.openshift.com/blog/accessing-codeready-containers-on-a-remote-server/) by [Jason Dobies](https://twitter.com/jdob).

We then walk through configuring crc to allow for remote access to its container registry.
By extension, the same steps will work in other installation types of OpenShift.
First we set the security policy, then we find the route.
After that, we tag the images we want to push with the registry target.

Finally we work on actually pushing the images
We login to OpenShift registry via podman and try to push.
However, we have to create a project to push them too.
Which we do, but now we need to relabel our images.
We then are able to push the images to the registry.

Now we delete all the local images.
We then modify the yaml to have the registry information.
And, after a couple of failures, we get the pod created.

However, we have a brief sojourn discussing a potential UX development show.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
* the [issue](https://github.com/containers/podman/issues/5186) that told Langdon what he was doing wrong with the yaml
* the [issue](https://github.com/containers/podman/issues/7838) Langdon filed to get this behavior sorted out
* [Podman Troubleshooting Guide](https://github.com/containers/podman/blob/master/troubleshooting.md)
* [dracula theme](https://draculatheme.com/)
* [Try OpenShift](https://red.ht/stream-try)
* [VS Code OpenShift Connector extension page](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-openshift-connector)
* Accessing remote crc [blog post](https://www.openshift.com/blog/accessing-codeready-containers-on-a-remote-server/)

## Sweet Sweet Internet Points
As of the show this morning:
* Noah Frickshun: 1000
* narendev: 900
* Joefuzz: 400

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights:
* [TLUH S1E9: We are surprised by Windows Nodes](https://clips.twitch.tv/TallBrainyVelociraptorThisIsSparta)
