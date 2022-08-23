Links for downloading and installing R: 

R: 
https://cran.rstudio.com/

From the page above, click on your operating system (Mac, Windows, or Linux). This will take you to another page. 

If you are using Windows, click the link for the "base" version - then click the "Download R ..." link at the top of the next page. 

If you are using a Mac, click the link for "R-4.0.3.pkg" (or whatever the latest version is, if it is more recent than that - the format of the link should be R-4.X.X.pkg)

If you are using Linux, you are probably used to figuring these things out; please find the relevant download and install.

RStudio: 
https://rstudio.com/products/rstudio/download/#download

If you are a MacOS user, you may also need to download one additional piece of software: the Xcode command line tools. If you have not used other analysis software (e.g. python, matlab, or R) on your computer, it is likely that you will need to do this. 

PLEASE NOTE: THE FOLLOWING IS ONLY FOR MAC USERS WHO ENCOUNTER ERRORS LOADING EXCEL FILES ONCE RSTUDIO IS INSTALLED. You don't need to bother with this if you have been able to import excel data already.

Xcode command line tools are a collection of programs that R is built on top of, and which R will assume exist. If the command line tools are not present, some functions in R will not work - notably, you won't be able to load excel files, which is a problem. Annoyingly, you will need to log in to an Apple web page to get this software. Please go to:

developer.apple.com

and click the "account" menu item near the top of the page. Here, you will need to log in with your Apple ID. If you have a mac, you almost certainly have an Apple ID; this is the same login you use to download apps from the app store, or to buy music, rent movies, etc through Apple (if you do that sort of thing). 

Having logged in, click "Download tools" in the middle of the screen or "download" in the menu at the left (both go to the same place). On the downloads page, click "more" in the menu toward the top right of the page. (Next to "beta" and "release"). A menu of options will appear. 

You need to download a version of Command line tools for Xcode that is appropriate to your operating system version. It is important to choose a version that will work on your system; the latest version of the command line tools for Xcode will not work on older operating systems, this is why they provide many legacy versions of this software. 

If you don't know what version of MacOS you are running, click the apple at the very top left of your monitor and choose "About this Mac" from the menu there. Download the version of Command line tools for Xcode that matches your OS version below:

(listed in increasing age)

11 or 11.1 (Big Sur): Command line tools for Xcode 12.4
10.15 (Catalina): Command line tools for Xcode 12.4
10.14 (Mojave): Command line tools for Xcode (macOS 10.14) for Xcode 10.3
10.13 (High Sierra): Command line tools for Xcode (macOS 10.13) for Xcode 10.1

The aim for all of these is to get the latest version of Command line tools for Xcode that is compatible with your OS. If for any reason one of these specified versions doesn't work for your OS (you will know, it will give you a message when you try to install that you need a later version of macOS), just try to download a slightly older version of Command line tools for Xcode [xxx], and see if that works.

If your OS is older than 10.13, please consider updating! Your OS is no longer supported by Apple. If you can't update your OS, please contact the instructor.

Once you download the installer for Command line tools for Xcode (whatever version), please run it to install the software. Having done that, you may then need to install a few more packages in R. To do this, open Rstudio, and at the command prompt, type: 

install.packages('tibble')

This will install the tibble package that enables reading of excel files. You only need to do this once, and then R should work thereafter. The procedure is generally the same for any missing packages you may encounter. With the Command line tools for Xcode installed, install.packages('<whatever package you need goes here>') should work.