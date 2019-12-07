MATE-DESKTOP OVERLAY For Gentoo
===============================

*IMPORTANT NOTE*: While this repository is here, I am doing also my best 
contribute changes to the official gentoo repository.

This is an [overlay][1] intended to be used in Gentoo. 

I have done my best to adhere to Gentoo's best practices. However, there
are a few things you should consider before you use this overlay:

* I did my best to test all ebuilds (with `repoman` and with installing
  them on my machine), but I could not possibly test all use flags.
  - I don't use systemd, hence I didn't test it

If you find this work useful, you can do one or more of the following:

 * Install and use these packages. Give me usefull feedback.
 * Star this repository.
 * Tweeter me with a thank you.
 * Donate me a humlbe sum of 2-5€.
   (Donations should go to oz dot tiram _at_ gmail dot com via Paypal),
   I'll mention you here for supporting my work.

## Goodies

 * I added some other packages here which are not officially mate. These are packages which I see fit, 
   and that belong IMHO to the mate eco-system (for example the mate-dock-applet).

## Contributing ebuilds

 * I welcome anyone who wants to contribute, but ...
 * It's very hard to review a commit with many files changes. So, if you 
   bump the version, please make a commit for each ebuild, instead of a large
	 commit for all updated files.

 * Properly updating an ebuild isn't only changing the version number. One good
   way to notice changes in the build configuration is to look for changes in
	 the file `configure.ac`. Check out the repository of the package you want 
	 to bump and do the following:

```
	$ git diff v1.(N)..(N+1) -- configure.ac 
```
   where `N+1` is the version you want to bump to and `N` is the previous version.
   Update the ebuild if the build requirements have changed.

[1]: https://wiki.gentoo.org/wiki/Ebuild_repository
