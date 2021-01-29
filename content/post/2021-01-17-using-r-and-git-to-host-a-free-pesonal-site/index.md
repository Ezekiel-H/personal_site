---
title: "Using R and GIT to host a free pesonal site"
author: "Zeke"
date: '2020-06-09'
slug: using-r-and-git-to-host-a-pesonal-site
categories:
- GIT
- R
tags:
- Hosting
- GIT
- R
- Blogdown
---

When I can I try to use R so when looking to put a personal site together a few years back I thought it was a good time to explore the [blogdown package](https://bookdown.org/yihui/blogdown/rstudio-ide.html). Using this I was able to build and maintain the site using mostly R, GIT and a good grasp of how to google css/html. 

I thought I would detail a step by step how to follow this to create a barebones copy and how to host it (for free) on GITHUB's [pages](https://pages.github.com/)


#### Why do this
So couple things firstly why? In the modern age an online presence is more of a conclusion than an option so it's importanat to control the narrative. Sure you can use Medium or LinkdIn or an off the shelf website build but fuck that, thats lame. 

A second consideration is why GIT and blogdown, well first off its free and secondly the blogdown structure is designed mobile first, SEO optimised and with the option to write in RMD lets you move seamlessly between code (Not just R) and text. I personally enjoy playing with data and code and R is my first love so to speak so its nice to combine the two. 


#### Disclamir
If you are happy to work it out for yourself there is a very detailed guide in the docs https://bookdown.org/yihui/blogdown/get-started.html

#### Overview
- This guide will show step by step how to set up a blogdown site on GIT.
- Setting up R
- Setting up GIT
- Picking a theme
- Local to Production cycle


#### Setting up R 

My folder path is ~R/ so creating a new folder example_ezekiel.nz on ~/R/example_ezekiel.nz and creating a fresh project in the folder, R and install the packages blogdown. 

```{r}
install.packages('blogdown')
```

To quote Yihis 
_'Since blogdown is based on the static site generator Hugo (https://gohugo.io), you also need to install Hugo. There is a helper function in blogdown to download and install it automatically on major operating systems (Windows, macOS, and Linux):'_

```{r}
blogdown::install_hugo()
```

Then simply 

```{r}
blogdown::new_site()
```

If you are getting an error check that your wd is on your folder path in my example ~R/example_ezekiel.nz/ and that the folder is empty.

```{r}
setwd("C:/Users/Ezekiel/Desktop/R/example_ezekiel.nz/")
```

I was getting some wild errors turns out that my R was still on version 3.30 and some packages were failing. Guess 2016 is too long between personal package updates. 


Assuming its all ok you should get the following 

```
> Want to serve and preview the site now? (y/n) 
```

Hit y and you will be set with the basic site and template on your local host. So now looking in my folder I have the following.

```{}
content/
layouts/
R/
reasources/
static/
themes/
.Rprofile
config.yaml
index.Rmd
netlify.toml

```

I can use the following commands to see the blogdown default site. 

```{}
blogdown::build_site()
blogdown::serve_site()
```

This should render down a new folder ```/public``` which we will use as part of the deployment flow.
The way I would advise is to create a folder ```/docs``` and copy the public folder across after rendering the build. 

Awesome simple as that. So now on to GIT. 


#### GIT
Following the [GIT pages](https://pages.github.com/) guide you need to sign up for an account and create a repo. The one for this site is called personal_site as an example but I will continue with the example_ezekiel repo.


Go to the folder where you want to store your project, and initiate the repo with

```
git init

git add . 

git commit -m "initial commit"

git remote add origin git@github.com:Ezekiel-H/example_ezekiel

git push -u origin master

```


Now in the settings

```
https://github.com/Ezekiel-H/example_ezekiel.nz/settings

```

Adjust the source to /docs and you should be done now at https://Ezekiel-H.example_ezekiel.github.io you should have a functional site.








