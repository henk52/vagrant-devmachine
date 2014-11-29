#!/usr/bin/perl -w
use strict;

my %f_hConfigurations;

my $szVagrantDirectoryName = '/vagrant';

my $szConfigFile = "$szVagrantDirectoryName/post_up.cfg";
my $f_szLocalDestination = "$szVagrantDirectoryName/files";
my $f_szLocalModule = "$szVagrantDirectoryName/modules";

my $f_szKeyHttpIpAddress = "HttpIpAddress";

die("!!! You most provide the $szConfigFile file for the post_up.pl configuration information.") unless( -f $szConfigFile);

open(CFG, "<$szConfigFile") || die("!!! Unable to read $szConfigFile: $!");

while (<CFG>) {
  chomp;

  next if (/^\s*$/);  
  next if (/^#/);  

  my ( $szVariableName, $szValue ) = $_ =~ /(.*?)\s*:\s*(.*)/;
  $f_hConfigurations{$szVariableName} = $szValue;
}



if ( ! exists( $f_hConfigurations{$f_szKeyHttpIpAddress} ) ) {
  die("!!! $f_szKeyHttpIpAddress is a mandatory entry in $szConfigFile");
}


`cp /vagrant/ReleaseVersion.txt /vagrant/ChangeLog.txt /`;


my $f_szHttpBaseSource = "http://$f_hConfigurations{$f_szKeyHttpIpAddress}:/storage";
my $f_szHttpBaseSourcePuppet = "http://$f_hConfigurations{$f_szKeyHttpIpAddress}:/storage/puppet";


my $f_szPuppetLabsModulePostgresqlName = "puppetlabs-postgresql-4.1.0";
my $f_szPuppetLabsModulePostgresqlTgz = "${f_szPuppetLabsModulePostgresqlName}.tar.gz";

# ---------------------------------------------------------------------
# ------------------------
sub GetFile {
  my $szHttpBaseSource = shift;
  my $szLocalDestination = shift;
  my $szFileName = shift;


  if ( ! -f "$szLocalDestination/$szFileName" ) {
    `cd $szLocalDestination; wget $szHttpBaseSource/$szFileName`;
  }
}

# ---------------------------------------------------------------------
# ------------------------
sub GetAndDeployModuleTgz {
  my $szPuppetPackageName = shift;
  my $szPuppetModuleName = shift;

  GetFile($f_szHttpBaseSourcePuppet, $f_szLocalDestination, "$szPuppetPackageName.tar.gz");
  
  if ( ! -e "/etc/puppet/modules/$szPuppetModuleName" ) {
    print "III Installing the $szPuppetPackageName module.\n";
    `cd /etc/puppet/modules; tar -zxf $f_szLocalDestination/${szPuppetPackageName}.tar.gz`;
    `cd /etc/puppet/modules; ln -s $szPuppetPackageName $szPuppetModuleName`;
  }
}



`git config --global user.name "Your Name"`;
`git config --global user.email you\@example.com`;
`git config --global push.default simple`;


`mkdir $f_szLocalDestination` unless(-d "$f_szLocalDestination");
`mkdir $f_szLocalModule` unless(-d "$f_szLocalModule");

if ( ! -d "$f_szLocalModule/henk52-opengrok" ) {
  `cd $f_szLocalModule; git clone git\@$f_hConfigurations{$f_szKeyHttpIpAddress}:/var/git/henk52-opengrok.git`;
}

if ( ! -d "$f_szLocalModule/henk52-sonar" ) {
  `cd $f_szLocalModule; git clone git\@$f_hConfigurations{$f_szKeyHttpIpAddress}:/var/git/henk52-sonar.git`;
}

print "III Getting the external files.\n";
if ( ! -f "$f_szLocalDestination/opengrok-0.12.1-bin.tar.gz" ) {
  `cd  $f_szLocalDestination; wget http://$f_hConfigurations{$f_szKeyHttpIpAddress}:/storage/opengrok-0.12.1-bin.tar.gz`;
}

# Get the puppet modules
  GetFile($f_szHttpBaseSourcePuppet, $f_szLocalDestination, $f_szPuppetLabsModulePostgresqlTgz);
  GetAndDeployModuleTgz("puppetlabs-stdlib-4.3.2", "stdlib");
  GetAndDeployModuleTgz("puppetlabs-concat-1.1.2", "concat");

#Files Needed:
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonarqube-4.5.1.zip"); 
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-runner-dist-2.4.zip");

# Modules needed:
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-abacus-plugin-0.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-android-plugin-1.0.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-artifact-size-plugin-0.3.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-build-breaker-plugin-1.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-build-stability-plugin-1.2.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-cxx-plugin-0.9.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-doxygen-plugin-0.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-erlang-plugin-1.0.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-fortify-plugin-2.0.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-generic-coverage-plugin-1.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-javascript-plugin-2.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-motion-chart-plugin-1.7.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-scm-stats-plugin-0.3.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-tab-metrics-plugin-1.4.1.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-timeline-plugin-1.4.jar");
  GetFile($f_szHttpBaseSource, $f_szLocalDestination, "sonar-widget-lab-plugin-1.6.jar");

if ( ! -e "/etc/puppet/modules/postgresql" ) {
  print "III Installing the $f_szPuppetLabsModulePostgresqlName module.\n";
  `cd /etc/puppet/modules; tar -zxf $f_szLocalDestination/$f_szPuppetLabsModulePostgresqlTgz`;
  `cd /etc/puppet/modules; ln -s $f_szPuppetLabsModulePostgresqlName postgresql`;
}

print "III Installing OpenGrok module\n";
if ( ! -e '/etc/puppet/modules/opengrok' ) {
  `sudo ln -s $f_szLocalModule/henk52-opengrok /etc/puppet/modules/opengrok`;
}
#`sudo puppet apply /vagrant/modules/henk52-opengrok/tests/init.pp`;

print "III Installing sonar module\n";
if ( ! -e '/etc/puppet/modules/sonar' ) {
  `sudo ln -s $f_szLocalModule/henk52-sonar /etc/puppet/modules/sonar`;
}

print "III Installing Sonar\n";
`sudo puppet apply --verbose /etc/puppet/modules/sonar/tests/init.pp &> /var/log/puppet_install_sonar.log`;
print "III Installing OpenGrok\n";
`sudo puppet apply --verbose /etc/puppet/modules/opengrok/tests/init.pp &> /var/log/puppet_install_opengrok.log`;

