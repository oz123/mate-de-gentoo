MATE-DESKTOP OVERLAY For Gentoo
===============================

This is an overlay intended to be used in Gentoo. 

I have done my best to adhere to Gentoo's best practices, however, there
are a few things you should consider before you use this overlay:

* I did my best to test all ebuilds (with `repoman` and with installing
   them on my machine), but I could not possibly test all use flags.
  - I recommend building with GTK+3 support (GTK+2 will soon be dropped)
  - I don't use systemd, hence I didn't test it

If you find this work useful, you can do one or more of the following:

 * Install and use these packages. Give me usefull feedback
 * Star this repository.
 * Tweeter me with a thank you.
 * Donate me a humlbe sum of 2-5€.
   (Donations should go to oz dot tiram _at_ gmail dot com),
   I'll mention you here for supporting my work.

## Goodies

 * I added some other packages here which are not officially mate. These are packages which I see fit, 
   and that belong IMHO to the mate eco-systemonly (for example the mate-dock-applet).

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
	$ git diff v1.12.1..v1.14.0 -- configure.ac 
```

   Update the ebuild if the build requirements have changed.
