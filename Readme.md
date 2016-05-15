SnowFox dependencies
====================
SnowFox depends on external libraries to avoid reinventing the wheel.
This repository contains those dependencies and the scripts
required to build them.

Sources are automatically downloaded by scpipts or through
submodules but are not included in the repository directly.

All rights belong to the libraties authors.


System dependencies
-------------------
SnowFox tries to minimise the run time dependencies.
This leads to bigger binaries but avoids having to install all
the dependencies on the target machine.

The downside, other then larger binaries, is that all those
dependencies need to be compiled (or provided at compile time).
Since this would be required regardless, it is not too bad.

Components in this sub-repo automatically download and compile
dependencies used by SnowFox but sometimes the hassle of
fetching and compiling a dependency (of a dependency) is not
worth the gain.

That is the case for the following dependencies,
which must be installed first:

  * `protobuf`: Google Protocol buffer library.


Components
----------

  * `dependencies.gflags`: Google command line parser.
  * `dependencies.lua`: Lua library.
  * `dependencies.ncurses`: Needed by readline.
  * `dependencies.readline`: Advanced user input.


### Reference links

  * [Readline docs](http://www.delorie.com/gnu/docs/readline/).
