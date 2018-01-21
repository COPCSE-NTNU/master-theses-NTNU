# Master Theses at NTNU

This repository contains information about the Masters theses at NTNU.

A Latex template, class file, and examples for writing a Masters thesis at NTNU


## Setting up

You can use the template with [sharelatex](http://www.sharelatex.com), and you are strongly encouraged to do so. The alternative is to install local copy of LaTeX on your laptop (not adviced, huge, difficult, and you need to maintain it yourself).

There are two ways for setting up the [**sharelatex**](http://www.sharelatex.com) project with the template:
* Use the .zip copy and upload
* Fork the the COPCSE repo so that you have your own files to edit.

You should **fork** the COPCSE repo so that you have your own files to edit and you can always merge with the upstream changes to the template, in case the template is updated. 

Use the [**video tutorial**](https://youtu.be/wfej8tQkFmY) to set yourself up with ShareLatex and the template.


## Using the template

You should not change anything in the ntnuthesis folder.  That contains the structure and style information.

You should edit and add files in the inc folder. You can also add files in the figures\ folder. The Daimdata.tex will only be used if you are going to generate a file not in the DAIM system, thus this should be a copy of the data you are entering into the DAIM system. This is where the information for the front material is set.

To add personal information you need to edit:
```
inc/DaimData.tex
```




