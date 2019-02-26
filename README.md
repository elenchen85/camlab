# Cloud Automation Lab Faststart 2019

Item  | Details
------|-----------------
Class | ICP-ES-02
Date  | Tuesday Jan 29th
Times | 14:30 to 15:30

![](images/team.png)

## WebEx

[Webex Broadcast](https://ibm.webex.com/meet/richard.hine)

I will share my desktop with the class under this link. In this way we can have a team view of Slack Channel and vSphere consoles.

Please post your questions to https://ibm-cloudplatform.slack.com/messages/CFQ8PKS1M so we can all share.

`IBM Watson Cloud Platform` > `Browse All Channels` > `camlab_at_faststart`

# Cloud Automation Manager

CAM provides self service catalog of infrastructure and middleware that can be instantiated in many private and public cloud environments. It can even deploy hybrid workloads where some is containerised or multi cloud deployments across different public and private clouds.

CAM is shipped as an IBM Cloud Private application and is installed through the use of a Kubernetes HELM Chart.

To do this manually while providing speed and consistency is complex and error prone. CAM solves these issues by using Terraform as a templating engine in which you can define `Infrastructure and Code` offerings. There are other templating engines, and many customers use Ansible, Chef or Salt. Have a look at the `Advanced Topics` section for how CAM can exploit these assets.

CAM uses many technologies and this lab provides you with an opportunity to explore their use.

## Foundation Education

[An introduction to Terraform](https://youtu.be/1JAx2npuprk)

[An introduction to Atom and GitHub](https://youtu.be/7au7l1qa2so)

[An introduction to Cloud Automation Manager](https://youtu.be/jxPSg11Gyvg)

## Related Education

Consider attending these other related classes

Class               | Title                    | Technology
--------------------|--------------------------|-----------
N3ICP001, M3ICP001  | Multi Cluster Management | MCM
N3ICP004e, M3ICP002 | ICP Competitive Panel    | ICP

# Learning Objectives

This lab guide is designed to help you explore some of the capabilities of CAM that are less well documented and provides for 3 exercises that will help you explore CAM and related technologies.

- The GitHub Revision control system
- The Atom editor and it's GitHub integrations
- The CAM Template designer
- Building CAM Templates from GitHub
- Building CAM Services
- The CAM catalog
- Terraform

After this class you should be able to:-

- Understand the value of Infrastructure as Code
- Understand the basics of Terraform
- Create a CAM Template from a GitHub asset
- Modify and rebuild a CAM Templates
- Create a CAM Service
- Understand the basics of Git
- Understand the value and the basics of Editor / GitHub integration.
- Understand the basic middleware offerings provided through the CAM catalog.

## Access to the labs after FastStart 2019

All of the GitHub assets will remain in place after FastStart, but the CAM instance that is used by the workbook exercises can be booked by arrangement with Oliver Lucht who manages the European Center of Competence for ICP.

![](images/oliver.png)

## Manuals

[Cloud Automation Manager](https://www.ibm.com/support/knowledgecenter/en/SS2L37_3.1.0.0/cam_overview.html)

[IBM Cloud Private](https://www.ibm.com/support/knowledgecenter/en/SSBS6K_3.1.1/kc_welcome_containers.html)

## Lab workbook overview

![](images/lab.png)

Take time to understand the lab objective and the skills in your team.
Take time to learn and don't just copy and paste.

There will be many skills in the class, pick your team with a broad collection of skills and take the opportunity to discuss what you are doing and share what you know.

I suggest that you have 1 student with the lab guide open on their desktop while another is used for the exercises.

Please use the information in the text rather than the graphics or the videos as there may be some small differences. The Videos and graphics are there as examples.

## Connection to Cloud Automation Manager

These are public addresses hence the need for hardened passwords.

Sandbox | URL                          | Credentials
--------|------------------------------|-------------------------
SB1     | https://159.122.108.38:30000 | admin / 7qVuL5mL7klDwtQT
SB2     | https://169.50.40.22:30000   | admin / aenUcaXOr5D8ccMD
SB3     | https://169.50.59.134:30000  | admin / aY2GGlkqOUgtZcJk

If you are not familiar with the CAM GUI, then take a few minutes to explore or have someone in your team show you.

## Workbooks

This document provides 3 workbooks that can be used in isolation of each other, or you can work through them in sequence. If you are new to CAM, then I suggest that you start with exercise A, if you already have some familiarity with CAM, then feel free to pick the Workbook that suits your interest.

A. `Creating a new CAM offering using GitHub terraform assets`

B. `Creating a CAM Service Offering`

C. `Building a template using the CAM Template Designer`

## Student team variables

Team   | UserID | Sandbox | IP
-------|--------|---------|--------------------
team01 | user01 | SB1     | 10.135.148.230 / 26
team02 | user02 | SB1     | 10.135.148.231 / 26
team03 | user03 | SB1     | 10.135.148.232 / 26
team04 | user04 | SB1     | 10.135.148.233 / 26
team05 | user05 | SB1     | 10.135.148.234 / 26
team06 | user06 | SB1     | 10.135.148.235 / 26
team13 | user13 | SB3     | 10.134.214.171 / 26
team14 | user14 | SB3     | 10.134.214.172 / 26
team15 | user15 | SB3     | 10.134.214.173 / 26
team16 | user16 | SB3     | 10.134.214.174 / 26
team17 | user17 | SB3     | 10.134.214.175 / 26
team18 | user18 | SB3     | 10.134.214.176 / 26
team19 | user19 | SB3     | 10.134.214.177 / 26
team20 | user20 | SB3     | 10.134.214.178 / 26
team21 | user21 | SB3     | 10.134.214.179 / 26
team22 | user22 | SB3     | 10.134.214.180 / 26

The password for all of these users is `ReallyStrongPassw0rd`

## Workbook - A. Creating a new CAM offering using GitHub terraform assets

1. We will need access to the Git commands. There are several ways of installing them - we will use the GitHub desktop. [Install GitHub desktop - to give you access to GIT commands](https://desktop.github.com). So, install this software and then return to the command line.

Other techniques are documented here @ https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

2. We are going to use the Atom editor as it provides a common environment across workstations and has easy integration with Git.

[Do you need to know more about the Atom editor?](https://atom.io)

[Install the Atom editor](http://flight-manual.atom.io/getting-started/sections/installing-atom/)

There are other editors and maybe you have a preference such as VSCode [VSCode](https://code.visualstudio.com/docs/editor/versioncontrol)

Now that we have installed the Atom editor we are going to pull the lab materials to your laptop.

3. I have used the IBM GitHub instance @ http://github.ibm.com to host the labs, and so we will need to setup access to this service before we can pull the lab material.

In order to connect to the IBM internal GitHub instance, you will need to provide an SSH key pair. If you already have a keypair that you use, then use it here. If you do not, then this is how you will do this from the beginning

From your laptop terminal session

After you issue the ssh-keygen command, take all the defaults by pressing the `ENTER` key as in the example below.

```
ssh-keygen -t rsa -b 4096 -C "me@here.com"

Generating public/private rsa key pair.
Enter file in which to save the key (/Users/rhine/.ssh/id_rsa): <ENTER>
Enter passphrase (empty for no passphrase): <ENTER>
Enter same passphrase again: <ENTER>
Your identification has been saved in /Users/rhine/.ssh/id_rsa
Your public key has been saved in /Users/rhine/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:mMdJoS5/OOQjsHrTRYpxiu1E/7rfi9xOmVaaPQ5W4eo me@here.com
The key's randomart image is:
+---[RSA 4096]----+
|        .        |
|       . .       |
|      . . .      |
|  o ...= o .     |
| +.*.o= S +      |
|. =oo=.o X       |
| o...o* % o      |
| .+ .o.% o .     |
|.. .o++.E..      |
+----[SHA256]-----+
rhine:temp rhine$ ls -ltr /Users/rhine/.ssh/
total 16
-rw-------  1 rhine  wheel  3369 24 Jan 13:43 id_rsa
-rw-r--r--  1 rhine  wheel   737 24 Jan 13:43 id_rsa.pub

```
Open your GitHub.ibm.com profile Settings

![](images/github_settings.png)

Select the option to add a new public SSH key

![](images/git_newssh.png)

Copy and paste the SSH public key that you generated earlier `id_rsa.pub` into the dialog prompt. Mac users can always use `cat id_rsa.pub | pbcopy`

![](images/github_addkey.png)

check for that you have saved your public key OK

![](images/github_keyadded.png)

at this point you will be able to pull assets from https://github.ibm.com without being challenged for a userid and password.

4. Copy the lab materials to you home directory. You really need to use the command line for these activities.

`cd ~ &&
git clone git@github.ibm.com:Richard-Hine/camlab.git`

5. (optional) Clone all of the Cloud Automation Templates to your workstation. We will not be using these, but they provide good samples of more complex terraform.

```
cd ~ &&
git clone https://github.com/IBM-CAMHub-Open/IBM-CAMHub-Open &&
git clone https://github.com/IBM-CAMHub-Open/starterlibrary.git
```

6. We will create a work directory to hold your customised lab materials. This will be your own local copy and will be backed by the GitHub copy when you push updated or new content.

_**We will be using the public https://github.com service and NOT the https://github.ibm.com IBM service !!!
**_

You will need another account for `github.com`, your `github.ibm.com` account is separate.

Use your existing https://github.com account or sign up for a new one @ https://github.com/join?source=experiment-header-dropdowns-home

Sign up for the free plan and select all of the defaults. `skip this step` to complete setup.

![](images/github_skip_continue.png)

We need to create a new GitHub repository `mycamlab` to hold our custom lab materials. Make sure you are using https://github.com and NOT https://github.ibm.com

Go and create a new repository in https://github.com called `mycamlab`

[Create a new GitHub repository for your work using your browser](https://help.github.com/articles/create-a-repo/)

![](images/new_github_repo.png)

You will be prompted by GitHub to verify your GitHub Account from the email you have been sent, so go and find the email sent to the account linked to your GitHub persona.

The GitHub prompt should look something like this

![](images/github_verify_email.png)

Your email should look something like this

![](images/github_verify_email_2.png)

Go ahead and click on the link to verify your GitHub account.

Leave your browser open at this page as you will need the supplied command to connect github.com to your workstation directory in step 7.

7. Copy sample context and initialise your directory with Git

Now that we have a GitHub repository on the internet, we need to initialise your work directory to connect it to your new GitHub repository.

In the Step 6, you were presented with some Git commands in your web browser after you have created your new Repository. Select the `HTTPS` tab and then copy the `...or create a new repository on the command line` commands into your clipboard and save them away as we will be using them later in Step 8.

Here are some videos that will walk you through this process

![VIDEO](https://github.ibm.com/Richard-Hine/camlab/blob/master/images/quicktime.png)

[GitHub initial setup](https://ibm.box.com/s/sxuwjbp6gk5in58vaukdryinoy0sj2bl)

[Create and initialise your GitHub repository](https://ibm.box.com/s/9j9sfymwxay1c9xqpurcyrmm1rlpaecm)

8. Copy the sample terraform from the cloned lab repository.

```
`mkdir ~/mycamlab`

ls ~/mycamlab
cp -R ~/camlab/fastVM/* ~/mycamlab/
ls ~/mycamlab

camvariables.json
catalog.json		
main.tf

```

Next we have to prime our new directory. Copy the commands from the `repository create dialog` that we saved away in step 8 into your terminal session and execute them as in the example below.

```
cd ~/mycamlab

echo "# mycamlab" >> README.md
git init
Initialized empty Git repository in /Users/rhine/Box Sync/projects/faststart/mycamlab/.git/
git add README.md
git commit -m "first commit"
[master (root-commit) b9da1c6] first commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
git remote add origin https://github.com/rhine59/mycamlab.git
git push -u origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 215 bytes | 215.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/rhine59/mycamlab.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.

```

9. Create a new Atom project for your work.

From Atom, use `File > Add Project Folder` and navigate to your `mycamlab` directory of your workstation

![](images/new_atom_project.png)

You will see your directory appear under `Project`

When you select the `mycamlab` project and click on `camvariables.json` note how you see all the `Unstaged Changes` on the Git tab over on the right.

![](images/unstaged_repo_items.png)

Select `Stage all`, provide a `Commit message` (`jan22` in the example below) in the box, `Commit to master` and then finally select the `Push 1` button at the bottom right of the screen. In the graphic below, note that the README.md file is now staged and is ready for the `Commit to Master` after which you `Push 1`.

![](images/atom_git_dialog.png)

Success will look something like this and `Push 1` will change to `Fetch`

![](images/new_repo_primed.png)

- Additional Atom support available under these links.

  [Open Atom and create a new project](https://flight-manual.atom.io/getting-started/sections/atom-basics/)

  and here is a short video to show you how to do this.

  [Create a new Atom project](https://ibm.box.com/s/10xxhlmke1jhojfqgpdoceomfn9vwanb)

  [Get a token to connect Atom to GitHub](https://ibm.box.com/s/z0tf7g1hyfm8j3q3o8dpt59ab2643a09)

10. Update the sample Terraform

  We have to change some of the supplied files, as we are all using the same CAM instance for the lab exercises.

  The `catalog.json` file contains the name of the catalog offering and as we are all sharing a single CAM instance, your name of your copy of this template will need to be changed to make it unique.

  So find the `name` and `displayName` tags in `catalog.json`.

  Make sure you find `**BOTH**` tags!

![  ](images/update_catalog.json.png)

  and add in your team Name (e.g `team01`) to make these names unique.

  `Save`, `Stage`, `Commit (with message)` and `Push` these changes using the Atom dialogs as we have done before in Step 10.

![  ](images/catalog_commit_msg.png)

  Hoorah!, we now have a new repository in GitHub called `mycamlab` that has been primed with the fastVM sample terraform.

  Go and check that your updates have been successful in your GitHub.com web session and it should look something like this.

![  ](images/updated_git_repo.png)

11. Time for a quick summary!

Now we have a Git Repository in GitHub.com called `mycamlab` and we have linked this to a directory on our workstation of the same name. We have also opened an Atom project over this workstation `mycamlab` directory and we are now able to update the terraform with the Atom Editor.

When we have updated the terraform source, we can `Stage`, `Commit` and `Push` these updates to the web.

This may seem complicated right now, but we have setup a development environment that we have use to edit a version control our terraform and sync it with an internet copy that can be consumed by Cloud Automation Manager when we create new templates.

12. Create a new CAM Template Offering

These are public addresses hence the need for hardened passwords.

Sandbox | URL                          | Credentials
--------|------------------------------|-------------------------
SB1     | https://159.122.108.38:30000 | admin / 7qVuL5mL7klDwtQT
SB2     | https://169.50.40.22:30000   | admin / aenUcaXOr5D8ccMD
SB3     | https://169.50.59.134:30000  | admin / aY2GGlkqOUgtZcJk


CAM templates can be created from raw terraform source code or can be linked to  GitHub or GitLab, we are going to create a new template linked to our newly created repository.

From the CAM welcome page,

![](images/cam_welcome.png)

view all of the templates from the menu at the top left.

![](images/cam_existing.png)

Now we are going to explore the existing CAM Template. Remember that these came from https://github.com/IBM-CAMHub-Open/IBM-CAMHub-Open which we have already downloaded for interest in Step 5

![](images/cam_template.png)

So, select the option to create a new template.

![](images/cam_new_template.png)

Select GitHub from the source options and then the GitHub URL from the Respository link in your GitHub Browser session. In my case it is `https://github.com/rhine59/mycamlab`

Note: do NOT include the `.git` suffix to the URL

![](images/cam_templ_options.png)

Get the Subdirectory link from the same URL. This is a relative path from the repository.

Generate a GitHub access token from your GitHub browser session.
`Profile` (top right), `Settings`, `Developer Settings`, `Personal Access Tokens`

![](images/git_token_1.png)

`Generate new token`, (Define the scope as 'repo'), `Generate Token`

![](images/git_token_2.png)

Copy the newly generated Personal Access Token to your clipboard

![](images/git_token_3.png)

Go back to your CAM template definition and paste your new token into the dialog.

![](images/cam_templ_options_1.png)

Here is the full set of options that I used.

| Variable                         | Value                                    |
|----------------------------------|------------------------------------------|
| GitHub Repository URL            | https://github.com/rhine59/mycamlab.git  |
| GitHub Access Token              | 108e2f8d2f6af983f426zzzzzzzzzz7e62ab6aa6 |
| GitHub Repository sub-directory  | /                                        |
| GitHub Reference (Branch or Tag) | master                                   |

Before you save the new template, Choose the `Cloud Provider` that suits your needs. I chose `VMware vSphere`

When saved, then we will have a new Template in the catalog

![](images/cam_templ_complete.png)

that appears in the catalog as a new tile.

![](images/cam_templ_catalog.png)

All of these activities have been recorded in the following video.

![VIDEO](https://github.ibm.com/Richard-Hine/camlab/blob/master/images/quicktime.png)

[Creating a new template from our GitHub repository content](https://ibm.box.com/s/cy6lcuarpyx843zzdg9goezmeapd0ys3)

13. Deploy our new template

## Parameters for deployment of `<teamxx>VirtualMachine` CAM template

Sandbox | Parameter                          | Value
--------|------------------------------------|-----------------------------
SB1&3   | vSphere Cluster                    | cluster1
SB1&3   | vSphere Datacenter                 | datacenter1
SB1&3   | vSphere Folder Name                | camlab
SB1&3   | Hostname                           | <pick_your_own>
SB1&3   | DNS Servers                        | 8.8.8.8
SB1&3   | DNS Suffixes                       | coc.net
SB1&3   | Domain Name                        | coc.net
SB1&3   | Operating System ID / Template     | ubuntu1604
SB1&3   | Root Disk Size                     | 32
SB1&3   | Template Disk Controller           | scsi
SB1     | Template Disk Datastore            | EnduranceFRA01
SB3     | Template Disk Datastore            | workload_share_0
SB1&3   | Template Disk Type                 | thin
SB1     | Virtual Machine Gateway Address    | 10.135.148.201
SB3     | Virtual Machine Gateway Address    | 10.134.214.137
SB1&3   | Virtual Machine IP Address         | <use your allocated address>
SB1&3   | Virtual Machine Memory             | 2048
SB1&3   | Virtual Machine Netmask Prefix     | 26
SB1&3   | Virtual Machine vCPUs              | 1
SB1&3   | Virtual Machine vSphere Port Group | SDDC-DPG-Mgmt
SB1&3   | vSphere Network Adapter Type       | vmxnet3
SB1&3   | vSphere Resource Pool              | resourcepool1

The deployment of a <teamxx>VirtualMachine instance take about 6 minutes

Find your new template using the `Search Templates` box at the top of the available templates. Click on the template tile, and then selecting

![](images/deploy_template.png)

When you have provided all of the required Parameters, then deploy your template.

If your deployment fails, then you can deploy your template with appropriate corrections.

![](images/deploy_modify.png)

Change the parameters that you need and then use the CAM `Plan Changes` dialog to have Terraform inform you what changes that will be required to the deployment to effect your changes. Finally, when you are happy with the result, use the `Apply Changes` to commit your changes.

Notice that there are too many Parameters to provide at this point. There are options in CAM to provide default values or to hide from the user. You may also want to investigate Home > Manage > `shared parameters` which can be used to provide the required template or service values but can also be used to provide different value groups - `Test`, `Production` or `UserAcceptance` for example  

![](images/deploy_shared_parms.png)

You are then taken to a dialog when you can see the deployment status

![](images/deploy_status.png)

What we can then do is to watch the terraform logs to track the status of the deployment.

![](images/deploy_log.png)

Please delete any images that you have created in this exercise.

## Workbook - B. Creating a CAM Service Offering

Sandbox | URL                          | Credentials
--------|------------------------------|-------------------------
SB1     | https://159.122.108.38:30000 | admin / 7qVuL5mL7klDwtQT
SB2     | https://169.50.40.22:30000   | admin / aenUcaXOr5D8ccMD
SB3     | https://169.50.59.134:30000  | admin / aY2GGlkqOUgtZcJk

A CAM Service is a template wrapped in a light business process, and we are going to create a service that posts a Slack message when the workload defined by the template has been deployed and include some details of the new VM in the message.

This allows users to not have to user the CAM user interface in order to find the details of their new machine.

![](images/agendasetupcamservice.png)

From the CAM menu - go to `Library` then `Services`.

Click on create a service.  
![](images/svc_create.png)

Specify a unique name (e.g. `teamxx awesome service`), and create a new category of `Faststart2019` if another team has not already created it.

![](images/svc_new.png)

Click on the composition tab, and drag your `template` onto the composition.  Specify some default values for most of the parameters.  Only leaving virtual machine name unset. In the `connection` option, select the vSphere connection from the list.

![](images/svc_template.png)

Note that a CAM service can include Helm Charts from IBM Cloud Private and also CAM Templates. In this way CAM Services can be used to define Hybrid workloads.

Now on the composition page, drag an `Integration` `Rest Hook` onto the flow, after the template.  

![](images/svc_rest.png)

Specify the following value in the `Rest Hook` parameters on the right of the screen

| Parameter | Value |
| --- | --- |
| input url | https://hooks.slack.com/services/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 |
| Method | POST
| Payload | {"text":"Teamxx awesome server deployment has succeeded and can be found at address ${templates.<template_activity_id>.output.ip}"} |

OK, we are missing part of the puzzle here. When the VM defined by the template is created, then it will be assigned a new IP address that we want to publish in the slack message. How do we pass the IP address of the new machine to the Slack Post?

The terraform creation process allow for the publishing of variables from newly created resources.

Have a look at [output.tf](https://github.ibm.com/Richard-Hine/camlab/blob/master/SecretSauce/output.tf)

This file needs to be included in the same GitHub Repository that you used to create your CAM template.

So copy the output.tf file from the `camlab` repository directory to the `mycamlab` directory on your laptop.

```
cd ~/mycamlab/
cp ~/camlab/secretsauce/output.tf .
rhine:mycamlab rhine$ ls -lr
total 64
-rw-r--r--  1 rhine  wheel    81 16 Jan 13:53 output.tf
-rw-r--r--  1 rhine  wheel  6034 15 Jan 14:52 main.tf
-rw-r--r--  1 rhine  wheel  1243 16 Jan 13:17 catalog.json
-rw-r--r--  1 rhine  wheel  9596 15 Jan 14:52 camvariables.json
-rw-r--r--  1 rhine  wheel    11 15 Jan 14:50 README.md

```

We now need to link the information exposed by `output.tf` in the instantiation of the template, to the service activity that uses this information to post a message to Slack. We need to join these 2 service activities.

So, from your service composition, find the activity ID for the template element in the composition.

![](images/cam_service.png)

Then select the `resthook` activity from your composition, and paste the activity ID from the template into the rest call payload.

![](images/cam_rest1.png)

When you have completed this, you can check in the `service source`

![](images/service_source1.png)

and

![](images/service_source2.png)

```
{"text":"Teamxx awesome server deployment has succeeded and can be found at address ${templates.<activity_id_from template>.output.ip}"}

```
Save your changes to the Terraform, and then we have to push them back to our `mycamlab` GitHub Repository.

We have pushed GitHub changes from from Atom before, so let us try the command line this time.

```
cd ~/mycamlab
git commit -m 'publish IP address'
[master a3bcfb4] publish IP address
 1 file changed, 1 insertion(+)
git push
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 334 bytes | 334.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/rhine59/mycamlab.git
   cabd766..a3bcfb4  master -> master

```
Go and check your results from your GitHub browser session

![](images/svc_output_git.png)

Go and create a new, or update the existing CAM template from your updated GitHub Repository.

This topic is covered in `13. Create a new CAM Template Offering` earlier in this document.

Complete the save of your new service

![](images/svc_complete.png)

Optionally deploy your new service and watch the Slack Channel for the results.

In order to see the Slack notifications, then login to the `hybrid-cloud-team` Slack workspace @ https://hybrid-cloud-team.slack.com. You will then need to connect to the `faststart2019camlab` channel.

If you execute the following, you will see a post into the Channel.

```
curl -X POST -H 'Content-type: application/json' --data '{"text":"teamxx Hello Madrid!"}' https://hooks.slack.com/services/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
```
![](images/slack_test_post.png)

Now go to the CAM Services and find the one that you have recently created and then deploy it.

You can watch for progress through the terraform log and ultimate through the post in the Slack channel.

## Workbook C. Building a template using the CAM Template Designer

Sandbox | URL                          | Credentials
--------|------------------------------|-------------------------
SB1     | https://159.122.108.38:30000 | admin / 7qVuL5mL7klDwtQT
SB2     | https://169.50.40.22:30000   | admin / aenUcaXOr5D8ccMD
SB3     | https://169.50.59.134:30000  | admin / aY2GGlkqOUgtZcJk

So if you want a create a terraform template from scratch, then using an editor is a difficult way to start. CAM provide a template designer that allows you to compose new templates from existing artifacts onto a canvas. You can then copy and paste the results, or you can save them into Git before you create a new CAM Template.

Start by creating a new Repository in GitHub. This is not absolutely necessary, but will reduce confusion with merging and overwriting other content in your `mycamlab` repository.

So, create a new repository called `mytemplates`. Note that there is no need to mirror this Repository to you local laptop but you can if you need further copies of your content.

Let's start by launching the Template Designer from the CAM landing page

![](images/bpd_launch.png)

Select `Blueprints` from the main menu

![](images/bpd_templates.png)

and we will create a new folder to hold our template assets as in this example. Use your team name `(e.g. user01)` as there are many tenants in this CAM instance.

![](images/bpd_folder.png)

Now we need to create a new template under our new folder. I called my template  `example.tf`.

![](images/bpd_templ.png)

You will now have an empty canvas on which you can compose your Software Defined Environment. Using the `Instances` folder on the right of the screen, drag a `VMware Virtual Machine` onto the canvas.

You are now prompted for the variables in the template. Will will default the hostname to `vm1`

![](images/bpd_vmname.png)

Let us now define that we want the created VM to be a part of a `VMware Resource Pool`

![](images/bpd_respool.png)

You will notice to the left of the above graphic, that other variables are exposed by this process. They can be edited as required on the left of the screen, take some time to explore.

Now we have create a bare bones template. Observe how we can display the template graphically or see the raw terraform.

Explore the 4 sections at the bottom of our VM graphic which allow you to Define

Attached Storage
Resource Pool details
How the VM can be accessed
Post instantiation activities

You can explore the raw terraform that is being created by the Template Designer.

![](images/bpd_raw.png)

Now we need to `Save` our new template

![](images/bpd_save.png)

*NOTES* If you have not moved to a FireFox browser - you will want to do it now!

*NOTES* If you see no files to commit, then you may need to use the Refresh icon at the top right of the `Commit Changes` dialog.

Now let us `Commit` our new template. This is a Git process where we commit and then push our new template to a GitHub repository.

![](images/bpd_commit.png)

Expand the `master` twistie and then select `New Remote` to add your new remote GitHub repository

![](images/bpd_new_remote.png)

Then see the result when completed

![](images/bpd_remote_mytemplates1.png)

Now make this the current target of a Git `push` by selecting the `Fetch from the remote` icon to the right of the new remote repository.

![](images/bpd_fetch.png)

When this has completed, you will see something like ...

![](images/bpd_fetch_complete.png)

Now we need to select all the changed files, and provide a message for the Git `commit` operation. Make sure you `select all` the files that have been changed

![](images/bpd_commit_msg.png)

Collect some more information used in the commit. This helps to understand who has made this change as it could be a common Git Repository.

![](images/bpd_commit_detail.png)

You will see the commit action in progress

![](images/bpm_committing.png)

Finally we need to `push` these committed changes

![](images/bpd_push.png)

When this has completed, just check in `mytemplates` Repository under your GitHub account.

![](images/bpd_git_complete.png)

** Summary **

At the end of this exercise. You have built a simple terraform template using the Template Designer and you have pushed your template to a GitHub repository that can then be used to create a new CAM Template Offering in the catalog.

This process can be iterative and all of your changes can be pushed from the Template Designer to your GitHub repository.

## Tips

If you get in a mess with GitHub Credentials on a Mac, then delete them from the keychain, and the next `git push` will re initialise them

![](images/github_keychain.png)

## The Atom Editor

Now we need to link an editor to your GitHub repository. If you are familiar with this process, then please feel free to carry on, but if not, then we will use Atom for this lab.

![](images/atom_editor.png)

So go ahead and install Atom on your Mac or Windows machine from https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-mac

To make changes in a GitHub project, you need to authorize GitHub for Atom. Follow the instructions you see inside Atom’s GitHub tab. First, visit the github.atom.io/login URL and sign in to your GitHub account. Here, you can generate a token with which you can perform the authorization.

![](images/authorise_atom_github.png)

![](images/atom_github_token.png)

1. Open Project Folder
2. Git Credentials
3. Git Token
4. Show edit, stage, commit, Push

So when you have opened your project you can select the file you want to edit.

![](images/atom_about_to_edit.png)

.... make your changes and save them.

![](images/atom_my_changes.png)

You will notice that you will see your file in the `unstaged changes` at the top right of your atom editor.

![](images/atom_unstaged_changes.png)

Select `stage all` at the top right of the `unstaged changes` box, and you will see your changes move to `staged`

![](images/atom_stage_changes.png)

You will now need to commit these staged changes to the master branch of your repository and provide some text to describe the nature of your change.

![](images/git_commit_msg.png)

after you have committed your chnages you will see an option to push these changes to your web based GitHub repository.

![](images/git_push_option.png)

Click this `push` option and then check that your changes have been mirrored to your web repository.

Go to the root to the repository.

![](images/git_push_check1.png)

Now navigate to your terraform directory. Note the message that you associated with the commit.

![](images/git_push_check_2.png)

Find the file you edited - again note the commit change message.

![](images/git_push_check_3.png)

Finally, see that your edit to the file has been mirrored to the web based repository.

![](images/git_push_check_4.png)

## CAM GitHub assets

https://github.com/IBM-CAMHub-Open/starterlibrary/tree/2.1/VMware/terraform/hcl/singleVM

## Advanced CAM topics

https://developer.ibm.com/cloudautomation/cloudautomation/learn/
