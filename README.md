[![Build Status](https://github.com/freemint/gemma/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/freemint/gemma/actions) 

* Latest snapshot: [Download (mint)](https://tho-otto.de/snapshots/gemma/gemma-mint-latest.tar.bz2)
* Latest snapshot: [Download (mintelf)](https://tho-otto.de/snapshots/gemma/gemma-mintelf-latest.tar.bz2)
* [Archive](https://tho-otto.de/snapshots/gemma/)

To build everything do `gmake install'. Notice that you have first to 
have built the gemlib (for the mt_gem.h header).

The include files will be installed in /usr/include/slb
The static modules will be installed in /usr/lib
The shared objects will be installed in /mint/slb

To get all this to work you also have to set the SLBPATH variable to 
point to that last directory (e.g. setenv SLBPATH /mint/slb 
in your mint.cnf file).

To check if everything is installed properly, run the test/test.app 
program. It should open a movable window and there should be a 
possibility to open another one that can be moved independently.

Since this version the library does not need -mshort anymore. To 
avoid conflicts with previous versions I had to change the names of 
the shared objects, so that these would not be loaded by older 
software. This is why there's 'gemma32' and 'kernel32' now.

EOF
