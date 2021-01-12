# Season 1 Episode 10: Persistent Volumes, Podman YAML and OpenShift

## Description:

We attempt to deploy our yaml from prior shows in to OpenShift.
However, we first have to figure out Persistent Volumes and Persistent Volume Claims.

## Details
* Air Date: Oct. 07, 2020
* [Watch the episode](https://youtu.be/jw0e0zBcoEs)
* [Show Notes](#show-notes)
* [Sweet Sweet Internet Points](#sweet-sweet-internet-points)
* [Video Highlights](#video-highlights)
* [Learn More](https://red.ht/leveluphour)

### Strict Agenda:
* let's get that yaml in to OpenShift
* persistent volumes and claims

### Show Recap:

Well, first up, we discuss the need for wearing pants in cold climates.

We move on to a discussion of getting our podman yaml in to OpenShift.
However, before we can do that, we need to figure out persistent volumes (PV) and claims (PVC).
PVs are setup by the cluster administrator and pointed at some "storage".
You have lots of [options](https://docs.openshift.com/container-platform/4.5/storage/understanding-persistent-storage.html#types-of-persistent-volumes_understanding-persistent-storage).

In our case, we are going to use [CRC](https://developers.redhat.com/products/codeready-containers/overview) which has a bunch of PVs already configured.

Before we mess with the PVs and PVCs we need to get the yaml we want to work with back.
But first, clean up.

[TLUH S1E10: Langdon throws out some yaml](https://clips.twitch.tv/ResolutePoisedBeefTriHard)

We move on to reviewing the provided PVs in CRC.
We point out where they live on the CRC VM and then demonstrate how we would get to them.
However, the VM is not meant to be accessed except in rare cases.
As a result, it is a little convoluted how you attach to the VM.
For details, jump to about minute 23.

We move to discuss the access modes for the PVs.

* ReadWriteOnce: Single user, Read/Write
* ReadWriteMany: Multi-user, Read/Write
* ReadOnlyMany: Multi-user, Read Only

The names are a bit confusing, at first, but pretty easy once you know that the "Many" and "Once" refer to the **consumers** not the **authorship** on the storage.

We get a question from the audience about using OpenShift Virtualization on bare metal vs VMWare.
Currently, we *think* that OpenShift Virtualization is only supported on bare metal.
However, you can check out [a show](https://www.youtube.com/watch?v=ucllLdo-e4M) on [openshift.tv](https://openshift.tv) all about it.
We hear that it should be available on VMWare "soon."

We move on to show how you know when there is a claim against the volume.
We also discuss how the storage size works in a PV.

We keep touching on a cool feature that if you mouse over a keyword in the yaml you will get a mouseover with short docs and a link to longer docs about that keyword.

Next we start to modify yaml to make PVCs against our PVs.
We show how to specify the PVCs and what we want to *request* from our PV.
We also quickly discuss the joys of whitespace-based languages like yaml and python.
Chris recommends the [indent-rainbow extension](https://github.com/oderwat/vscode-indent-rainbow) for VSCode (or any other editor you can find it for) which will lower the pain.

[TLUH S1E10: Einstein, Calendars, and Emacs](https://clips.twitch.tv/RelievedSolidFlyDansGame)

We now deploy the PVC and show the UI representation that the PVC actually worked.
We then go on to talk about the difference between "projects" and "namespaces."
We then delve in to the details of how the PVC was fulfilled.

We go back to the yaml to modify what the containers are actually consuming for storage.
We move the storage from a place on disk to using the PVC we just created.
We run in to the problem of names being limited in length.

[TLUH S1E10: Java, Long Paths and Windows](https://clips.twitch.tv/CrowdedAgitatedPorcupineCoolStoryBro)

We setup the new volumes based on the PVCs but we run in to a different problem.
Namely, we need to address the privileges we are requesting.
Chris discusses a bit about the various security certifications OpenShift *can* support.
In this case, we just rip the requests out as we don't really need them.
Missed a step and now editing the yaml again to make all the containers use the new PVCs.

Finally we close with Sweet, Sweet Internet Points.

## Further Reading

If you want to know more about anything that came up in the show, here are some links to get you started.
* [Understanding persistent storage](https://docs.openshift.com/container-platform/4.5/storage/understanding-persistent-storage.html)
* Persistent Volume Storage [Access Modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)
* [CRC](https://developers.redhat.com/products/codeready-containers/overview)
* [OpenShift Virtualization Show](https://www.youtube.com/watch?v=ucllLdo-e4M)
* To ease your indentation woes, indent-rainbow:
    * [vscode-indent-rainbow](https://github.com/oderwat/vscode-indent-rainbow)
    * [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)
    * [intellij-indent-rainbow](https://github.com/dima74/intellij-indent-rainbow)

## Sweet Sweet Internet Points
As of the show this morning:
* Noah Frickshun: 1100
* narendev: 1000
* Joefuzz: 500

If you want to collect points for the most recent episode, find the code in the stream (link [here](#details)) and submit it at [https://red.ht/level-up-point-form](https://red.ht/level-up-point-form).
You do not need the "full" url that is displayed in the show it just makes it easier.
The code is always in the form of TLUH-XXXXXX (where "X" is a digit).
There is no deadline for the code submission (except if we stop doing points) aside from making it in the day before the next show if you want to be in the point rankings.

You will also get points for doing other things, like submitting issues and PRs on this repository.
However, those points are manually added by the admins.
If you have any questions about the points, find us on [discord](https://discord.gg/5VMVGJt) and ways [to collect them](../activities.md).

## Video Highlights:
* [TLUH S1E10: Langdon throws out some yaml](https://clips.twitch.tv/ResolutePoisedBeefTriHard)
* [TLUH S1E10: Einstein, Calendars, and Emacs](https://clips.twitch.tv/RelievedSolidFlyDansGame)
* [TLUH S1E10: Java, Long Paths and Windows](https://clips.twitch.tv/CrowdedAgitatedPorcupineCoolStoryBro)

