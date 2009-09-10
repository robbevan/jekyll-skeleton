#!/usr/bin/env ruby

system "wget http://github.com/joshuaclayton/blueprint-css/tarball/master; tar xvf *blueprint*; mkdir stylesheets/blueprint; cp -r *blueprint*/blueprint/* stylesheets/blueprint/; rm -rf *blueprint*"