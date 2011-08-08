Librarian
=========

A tool to resolve recursively a set of specifications and fetch and install the fully resolved specifications.

Librarian::Mock
---------------

An adapter for Librarian for unit testing the general features.
The mock source is in-process and in-memory and does not touch the filesystem or the network.

Librarian::Chef
---------------

An adapter for Librarian applying to Chef cookbooks in a Chef Repository.

## Install librarian:

    $ gem install librarian


## Make sure your cookbooks directory exists but is gitignored
    $ cd ~/path/to/chef-repo
    $ git rm -r cookbooks # if the directory is present
    $ mkdir cookbooks
    $ echo cookbooks >> .gitignore

## Add dependencies and their sources to Cheffile
    $ cat Cheffile
        site 'http://community.opscode.com/api/v1'
        cookbook 'ntp'
        cookbook 'timezone'
        cookbook 'rvm',
          :git => 'https://github.com/fnichol/chef-rvm',
          :ref => 'v0.7.1'

## install dependencies into ./cookbooks
    $ librarian-chef install [--clean] [--verbose]

## check into version control your ./Cheffile.lock
    $ git add Cheffile.lock
    $ git commit -m "I want these particular versions of these particular cookbooks from these particular."

## update your cheffile with new/changed/removed constraints/sources/dependencies
    $ cat Cheffile
        site 'http://community.opscode.com/api/v1'
        cookbook 'ntp'
        cookbook 'timezone'
        cookbook 'rvm',
          :git => 'https://github.com/fnichol/chef-rvm',
          :ref => 'v0.7.1'
        cookbook 'monit' # new!
    $ git diff Cheffile
    $ librarian-chef install [--verbose]
    $ git diff Cheffile.lock
    $ git add Cheffile
    $ git add Cheffile.lock
    $ git commit -m "I also want these additional cookbooks."

## update the version of a dependency
    $ librarian-chef update ntp timezone monit [--verbose]
    $ git diff Cheffile.lock
    $ git add Cheffile.lock
    $ git commit -m "I want updated versions of these cookbooks."

## push your changes to the git repository
    $ git push origin master

## upload the cookbooks to your chef-server
    $ knife cookbook upload --all

You should `.gitignore` your `./cookbooks` directory.
If you are manually tracking/vendoring outside cookbooks within the repository,
  put them in another directory such as `./cookbooks-sources` and use the `:path` source.
  You should typically not need to do this.

License
-------

Written by Jay Feldblum.

Copyright (c) 2011 ApplicationsOnline, LLC.

Released under the terms of the MIT License.
