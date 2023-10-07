## buildkit\_deb\_builder

buildkit debian / ubuntu package builder

Implements https://github.com/moby/buildkit#systemd-socket-activation as debian control/postinst.

## How to run it

1. Update build.sh VERSION= if necessary.
2. Run build.sh (it chdir to the directory build.sh exists, so it can be launched from any directory)
3. dpkg -i build/buildkit\_\*\_amd64.deb

## Caveats

buildkitd does not find local image as FROM= if the namespace is not `buildkit`. So I set the namespace to `buildkit` for now.

Please see https://github.com/rancher-sandbox/rancher-desktop/issues/2584#issuecomment-1475232068 .
