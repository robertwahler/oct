Oct
===

Command line octal file permissions


Why?
----

Oct is a sample RubyGem application cloned from BasicApp.
See <http://github.com/robertwahler/basic_app> for more information.

Oct does scratch an itch.  'Chmod' is easier to drive in octal and I can't
convince 'ls -l' to output permissions in octal.

Here is an equivalent bash script

    #!/bin/bash
    # octal file listing

    if [ "$1" == "" ]
    then
      PARAM="*"
    else
      PARAM="$@"
    fi

    for file in $PARAM
    do

      if [ ! -e "$file" ]       # Check if file exists.
      then
        echo "$file does not exist."; echo
        continue                # On to next.
       fi

       stat --format='%a,%U,%G,%t %n' $file
    done


Run-time dependencies
---------------------

* Ruby 1.9.3
* Term-ansicolor for optional color output <http://github.com/flori/term-ansicolor>


Development dependencies
------------------------

* Bundler for dependency management <http://github.com/carlhuda/bundler>
* Rspec for unit testing <http://github.com/rspec/rspec>
* Cucumber for functional testing <http://github.com/cucumber/cucumber>
* Aruba for CLI testing <http://github.com/cucumber/aruba>

Installation
------------

This gem has been published on RubyGems.org

    gem install oct


Usage
-----

oct --help

    Octal file listing

      Usage: oct [options] [FILES]

    Options:

        -v, --[no-]verbose               Run verbosely
        -c, --[no-]coloring              Ansi color in output
            --version                    Display current version
        -h, --help                       Show this message


Example
-------

ls -l

    total 0
    -rw-r--r-- 1 robert robert 0 2010-03-12 10:37 file1.txt
    -rw-r--r-- 1 robert robert 0 2010-03-12 10:37 file2.txt

oct

    0644 file1.txt
    0644 file2.txt


Copyright
---------

Copyright (c) 2010-2011 GearheadForHire, LLC. See [LICENSE](LICENSE) for details.
