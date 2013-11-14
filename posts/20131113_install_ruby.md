###Ruby

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

###RubyGems

RubyGems is a package manager for Ruby projects, and there are many useful libraries available as Ruby packages, or gems. As we installed RVM, we already have RubyGems, since RVM includes it automatically:

        $ which gem
        $HOME/.rvm/rubies/ruby-2.0.0-p0/bin/gem

When installing gems, by default RubyGems generates two different kinds of documentation (called ri and rdoc), but many Ruby developers find that the time to build them isn’t worth the benefit. (Many programmers rely on online documentation instead of the native ri and rdoc documents.) To prevent the automatic generation of the documentation you can add a .gemrc file in your home directory like this `$ vim ~/.gemrc` (here vim is the text editor of your choice. If you’re using a different editor, you should replace this command as necessary.) and with the lines:

        install: --no-rdoc --no-ri
        update:  --no-rdoc --no-ri

Hopefully we now have both Ruby and RubyGems installed and configured. Unfortunately, lots of things can go wrong along the way, the only general solution is web searches and determination.

**Have a Good Hacking!**