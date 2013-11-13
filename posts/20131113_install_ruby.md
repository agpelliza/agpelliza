*Seams to be that installing Ruby is not such a trivial thing as one may think. So lets see how to accomplish this as simple as possible.*

It’s possible that your system already has Ruby installed. Try running `$ ruby -v` to see the version. Most likely if it has Ruby installed it won't be a one of latests versions.

If you are using a unix-based OS you may want to use [Ruby Version Manager (RVM)](http://rvm.io/), which allow you to install and manage multiple versions of Ruby on the same machine. (you can check for the [Pik](http://github.com/vertiginous/pik) project for Windows.). There are other version managers like RVM out there, a popular one is [rbenv](https://github.com/sstephenson/rbenv), but some of them may not be able to be used on the same system simultaneously. For now, lets roll it with RVM.

As a prerequisite, OS X users may need to install the Xcode developer tools. The [Command Line Tools for Xcode](https://developer.apple.com/downloads/) should be enough for this porpouse.

Let first [install RVM](http://rvm.io/rvm/install/):

    $ curl -L https://get.rvm.io | bash -s

(If you already have RVM installed, you should run `$ rvm get stable` to ensure that you have the latest version.)

You can then get Ruby set up by examining the requirements for installing it:

    $ rvm requirements

At some OS distributions you may need to install few other libraries manually or using a package management system. This is an example for installing [YAML](https://en.wikipedia.org/wiki/YAML) library:

    # For Mac with Homebrew
    $ brew install libyaml

    # For Debian-based Linux systems
    $ apt-get install libyaml-dev

    # For Fedora/CentOS/RHEL Linux systems
    $ yum install libyaml-devel

Finally, I needed to tell RVM where OpenSSL was located when installing Ruby 2.0.0:

    $ rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr
    <wait a while>

(On some systems, especially on Macs using Homebrew, the location of OpenSSL may be at `$HOME/.rvm/opt/openssl`)

We are done, now you can tell RVM to use the Ruby version we just installed:

    $ rvm use 2.0.0
    $ ruby -v
    ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-linux]

Unfortunately, lots of things can go wrong along the way, the only general solution is web searches and determination.  
**Have a Good Hacking!**