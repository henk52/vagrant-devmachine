# Provide a build machine for dxx-rebirth



package { "gcc": ensure => "installed" }
package { "gcc-c++": ensure => "installed" }
package { "autoreconf": ensure => "installed" }
package { "scons": ensure => "installed" }
package { "SDL-devel": ensure => "installed" }
package { "physfs": ensure => "installed" }
package { "physfs-devel": ensure => "installed" }
package { "mesa-libGLU-devel": ensure => "installed" }
package { "SDL_mixer-devel": ensure => "installed" }

package { "check": ensure => "installed" }
package { "cxxtest": ensure => "installed" }
package { "cxxtest-doc": ensure => "installed" }

package { "lcov": ensure => "installed" }
package { "shcov": ensure => "installed" }

package { "valgrind": ensure => "installed" }
package { "valkyrie": ensure => "installed" }

# Joe's Window Manager
package { "jwm": ensure => "installed" }
package { "tigervnc-server": ensure => "installed" }


package { "eclipse-cdt": ensure => "installed" }
package { "eclipse-checkstyle": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-egit": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-egit-github": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-epic": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-valgrind": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-gcov": ensure => "installed", require => Package [ 'eclipse-cdt' ] }
package { "eclipse-gprof": ensure => "installed", require => Package [ 'eclipse-cdt' ] }



