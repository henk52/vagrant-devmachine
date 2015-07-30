# Provide a build machine for dxx-rebirth



package { "bison": ensure => "installed" }
package { "flex": ensure => "installed" }
package { "gcc": ensure => "installed" }
package { "gcc-c++": ensure => "installed" }
package { "libtool": ensure => "installed" }

# Make tools
package { "autoreconf": ensure => "installed" }
package { "autoremake": ensure => "installed" }
package { "cmake": ensure => "installed" }
package { "cmake-doc": ensure => "installed" }
package { "cmake-gui": ensure => "installed" }
package { "extra-cmake-modules": ensure => "installed" }
package { "scons": ensure => "installed" }

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

# Various dev
package { "openssl-devel": ensure => "installed" }
package { "ncurses-devel": ensure => "installed" }

# Game Dev.
package { "mesa-libGLU-devel": ensure => "installed" }
package { "physfs": ensure => "installed" }
package { "physfs-devel": ensure => "installed" }
package { "SDL-devel": ensure => "installed" }
package { "SDL_mixer-devel": ensure => "installed" }
