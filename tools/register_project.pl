#!/usr/bin/perl -w
use strict;

# Should this also create a git project, so that the jenkins projects can use this server as the host?

# e.g. provide a project description file, used for sonar (et al.?)

# path
# hold off on project analysis (if multiple projects are registered at the same time)

# create the link
`ln -s /vagrant/src/dxx-rebirth /var/opengrok/src`;

# Index the project
`/opt/opengrok/bin/OpenGrok index`;

# generate the sonar file.
`cp /vagrant/src/sonar-project.properties.dxx-rebirth /vagrant/src/dxx-rebirth/sonar-project.properties`;


