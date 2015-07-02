# Provide a build machine for dxx-rebirth



package { "gcc": ensure => "installed" }
package { "gcc-c++": ensure => "installed" }
package { "libtool": ensure => "installed" }

# Make tools
package { "autoreconf": ensure => "installed" }
package { "autoremake": ensure => "installed" }
package { "scons": ensure => "installed" }
package { "cmake": ensure => "installed" }
package { "cmake-doc": ensure => "installed" }
package { "cmake-gui": ensure => "installed" }
package { "extra-cmake-modules": ensure => "installed" }
package { "": ensure => "installed" }

# Unit test
package { "check": ensure => "installed" }
package { "check-devel": ensure => "installed" }
package { "cxxtest": ensure => "installed" }
package { "cxxtest-doc": ensure => "installed" }

# Coverage
package { "lcov": ensure => "installed" }
package { "shcov": ensure => "installed" }

# mem tools
package { "valgrind": ensure => "installed" }
package { "valkyrie": ensure => "installed" }

# Game Dev.
package { "mesa-libGLU-devel": ensure => "installed" }
package { "physfs": ensure => "installed" }
package { "physfs-devel": ensure => "installed" }
package { "SDL-devel": ensure => "installed" }
package { "SDL_mixer-devel": ensure => "installed" }

# Joe's Window Manager
package { "jwm": ensure => "installed" }
package { "tigervnc-server": ensure => "installed" }


# IDE
package { "eclipse-cdt": ensure => "installed" }
package { "eclipse-checkstyle": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-cmakeed": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-egit": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-egit-github": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-epic": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-gcov": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-gprof": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-builds": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-ide": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-versions": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-builds-hudson": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-context-cdt": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-context-team": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-docs-epub": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-docs-htmltext": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-docs-wikitext": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-tasks-bugzilla": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-tasks-web": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-mylyn-versions-git": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-valgrind": ensure => "installed", require => Package [ 'eclipse-cdt' ] }

