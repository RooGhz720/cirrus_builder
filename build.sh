# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/RiceDroid/android -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/donboruza/local_manifests.git --depth 1 -b sweet-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch lineage_sweet-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=RooGhz720
export KBUILD_BUILD_HOST=android-runner
#export SKIP_API_CHECKS=true
#export SELINUX_IGNORE_NEVERALLOWS=true
m bacon -j8
# end
