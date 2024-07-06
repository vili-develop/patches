echo 'Starting to clone stuffs needed for your device'
echo 'Cloning Device Tree [1/5]'
# vili Tree
rm -rf device/xiaomi/vili
git clone --depth=1 https://github.com/vili-develop/device_xiaomi_vili.git -b lineage-21 device/xiaomi/vili

rm -rf device/xiaomi/sm8350-common
git clone --depth=1 https://github.com/vili-develop/device_xiaomi_sm8350-common.git -b cr device/xiaomi/sm8350-common
echo 'Cloning vili Vendor tree [2/5]'

# Device Vendor Tree
rm -rf vendor/xiaomi/vili
git clone --depth=1 https://github.com/swiitch-OFF-Lab/vendor_xiaomi_vili.git -b 14.0 vendor/xiaomi/vili

git clone --depth=1 https://github.com/swiitch-OFF-Lab/vendor_xiaomi_sm8350-common.git -b 14.0 vendor/xiaomi/sm8350-common

echo 'Cloning Kernel tree [3/5]'
# Kernel Tree
rm -rf kernel/xiaomi/sm8350
git clone https://github.com/vili-develop/kernel_xiaomi_sm8350.git -b udc  kernel/xiaomi/sm8350
cd kernel/xiaomi/sm8350
git reset --hard 4fda87a67bf1c933f0b1af2340eeb59c36eb1e81
cd -

git clone --depth=1 https://github.com/swiitch-OFF-Lab/swiitchoff_stuffs swiitchoff/stuffs

echo 'Cloning Hardware xiaomi [4/5]'

# Hardware xiaomi
rm -rf hardware/xiaomi
git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-20 hardware/xiaomi
# git clone --depth=1 https://github.com/blazerpaul15/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi

git clone --depth=1 https://github.com/swiitch-OFF-Lab/hardware_dolby.git -b A14 hardware/dolby

# echo 'Cloning Leica Cam [5/5]'
# # Leica Cam
# rm -rf vendor/xiaomi/vili-miuicamera
# git clone --depth=1 https://gitlab.com/Santhanabalan/vendor_xiaomi_vili-miuicamera vendor/xiaomi/vili-miuicamera

git clone https://gitlab.com/ItzDFPlayer/vendor_davinci-miuicamera -b leica-5.0-universal vendor/xiaomi/miuicamera
git clone --depth=1 https://github.com/vili-develop/proprietary_vendor_gms.git -b android-14.0  vendor/gms

echo 'Cloning vili Firmware'
# vili firmware
rm -rf vendor/xiaomi/vili-firmware
git clone --depth=1 https://gitlab.com/Santhanabalan/vendor_xiaomi_vili-firmware vendor/xiaomi/vili-firmware

# Cloning Display HALs
# echo 'Cloning Display HALs'
# rm -rf hardware/qcom-caf/sm8350/display
# git clone https://github.com/blazerpaul15/android_hardware_qcom-caf_display_sm8350.git -b 14 hardware/qcom-caf/sm8350/display

echo 'Completed, Now proceeding to lunch'
rm device/xiaomi/vili/vendorsetup.sh
cd kernel/xiaomi/sm8350
rm -rf KernelSU drivers/kernelsu
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
cd -

# rm -rf art
# git clone https://github.com/DerpFest-AOSP/art.git -b 14 art

export CCACHE_BASEDIR=/zfsdata/build/.ccache
export CCACHE_DIR=/zfsdata/build/.cache
