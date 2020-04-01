# Introduction

Welcome to the reference documentation for the [Jolie programming language](https://jolie-lang.org).

![](./.gitbook/assets/jolielogo.png)

Jolie is a programming language which provides a full service oriented programming paradigm within a unique linguistic domain. Jolie aims at briging a structured programming approach to service oriented programming. Jolie provides some core features like port declaration, interface definition and behavioural workflows which are some of the core features of service oriented programming. For each of them, there is a corresponding linguistic structure into the language. This is why se defined Jolie as the _first language for microservices_. Because it is the first language which natively provides primitives for directly deal with service oriented communication paradigms instead of exploiting external libraries or frameworks. The aim of the Jolie Team is to provide a new tool for developers which can fasting the development and the management of service oriented distributed systems. 

Take a time for navigating this book and let us know your opinions about the language.
Enjoy Jolie!

_The Jolie Team_



## How to contribute to the Jolie Documentation

This GitBook is linked to the GitHub repository at [https://github.com/jolie/docs](https://github.com/jolie/docs).

The first step to update or create contents in the Jolie documentation is to [fork the documentation repository](https://github.com/jolie/docs#fork-destination-box).

Then, you can either update or create some content in your fork and, once done, you can [issue a pull request](https://help.github.com/articles/creating-a-pull-request/) to include your contribution in the official Jolie documentation.

Please, find below some additional information on both how to update existing pages and create new ones.

### File structure

The location of the files follows the structure reported by the [GitBook](https://jolielang.gitbook.io/docs), so e.g., the page [Compositing Statements](https://jolielang.gitbook.io/docs/basics/composing_statements) is under path [`/basics/composing_statements.md`](https://github.com/jolie/docs/blob/master/basics/composing_statements.md).

### Linking pages

It's advised to link pages using absolute links of the kind `https://jolielang.gitbook.io/docs/your/page#and_anchor`

### Updating existing pages

To modify an existing page, it is sufficient to modify the related `.md` file.

In case you want to include new images in a page, we usually use \(or create, in case it is missing\) a dedicated sub-folder called `img` within the specific first-level sub-folder. For instance, if you want to add an image in a page under the `documentation/basics` sub-folder, you can create the `img` folder, save the image in it, and link it from the interested document.

We follow a similar structure also for archives \(`.zip`\) that contain comprehensive, runnable code examples, which are stored under the dedicated `code` folder.

### Creating new pages

When creating a new page, please follow the guidelines above and make sure to:

* create the page as a new `.md` file, under one of the existing first-level sub-folders \(or create a new one, if necessary\);
* update the summary to show the link to the newly created page. This is done by editing the [SUMMARY.md](https://github.com/jolie/docs/blob/master/SUMMARY.md) file, present in the root of the repository.

