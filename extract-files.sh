#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=venturi_usa

rm -rf ../../../vendor/samsung/$DEVICE/*
mkdir -p ../../../vendor/samsung/$DEVICE/proprietary

if [ -f "$1" ]; then
	rm -rf tmp
	mkdir tmp
	unzip -q "$1" -d tmp
	if [ $? != 0 ]; then
		echo "$1 is not a valid zip file. Bye."
		exit 1
	fi
	echo "$1 successfully unzip'd. Copying files..."
	ZIP="true"
else
	unset ZIP
fi

DIRS="
bin
cameradata
etc/wifi
lib/egl
media
firmware
vendor/bin
vendor/firmware
vendor/etc
vendor/lib
vendor/lib/egl
vendor/lib/hw
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/samsung/$DEVICE/proprietary/$DIR
done

FILES="
bin/BCM4329B1_002.002.023.0589.0649.hcd

etc/wifi/nvram_net.txt
etc/wifi/wifi.conf
etc/wifi/bcm4329_sta.bin
etc/wifi/bcm4329_aps.bin

bin/tvoutserver
cameradata/datapattern_420sp.yuv
cameradata/datapattern_front_420sp.yuv
lib/libActionShot.so
lib/libcamera.so
lib/libs3cjpeg.so
lib/libarccamera.so
lib/libcamera_client.so
lib/libcamerafirmwarejni.so
lib/libcameraservice.so
lib/libCaMotion.so
lib/libcaps.so
lib/libPanoraMax1.so
lib/libPlusMe.so
lib/libseccamera.so
lib/libseccameraadaptor.so
lib/libsecjpegencoder.so
lib/libtvout_jni.so
lib/libtvout.so
lib/lib_tvoutengine.so
lib/libtvoutfimc.so
lib/libtvouthdmi.so
lib/libtvoutservice.so
firmware/CE147F00.bin
firmware/CE147F01.bin
firmware/CE147F02.bin
firmware/CE147F03.bin 

bin/rild
lib/libril.so
lib/libsec-ril.so
lib/libsec-ril-apalone.so
lib/libsecril-client.so

etc/gps.conf
vendor/bin/gpsd
vendor/etc/gps.xml
vendor/lib/hw/gps.s5pc110.so

vendor/bin/pvrsrvinit
vendor/lib/egl/libEGL_POWERVR_SGX540_120.so
lib/egl/libGLES_android.so
vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so
vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so
vendor/lib/libsrv_um.so
vendor/lib/libsrv_init.so
vendor/lib/libIMGegl.so
vendor/lib/libpvr2d.so
vendor/lib/libpvrANDROID_WSEGL.so
vendor/lib/libglslcompiler.so
vendor/lib/libPVRScopeServices.so
vendor/lib/libusc.so
vendor/firmware/samsung_mfc_fw.bin 

vendor/bin/geomagneticd
vendor/bin/orientationd
vendor/lib/libsensorservice.so
vendor/lib/libsensor_yamaha_test.so
vendor/lib/hw/sensors.default.so
vendor/lib/hw/gralloc.s5pc110.so
vendor/lib/hw/copybit.s5pc110.so
vendor/lib/hw/lights.s5pc110.so
vendor/lib/hw/overlay.s5pc110.so

bin/playlpm
bin/charging_mode
lib/libQmageDecoder.so
media/battery_charging_5.qmg
media/battery_charging_10.qmg
media/battery_charging_15.qmg
media/battery_charging_20.qmg
media/battery_charging_25.qmg
media/battery_charging_30.qmg
media/battery_charging_35.qmg
media/battery_charging_40.qmg
media/battery_charging_45.qmg
media/battery_charging_50.qmg
media/battery_charging_55.qmg
media/battery_charging_60.qmg
media/battery_charging_65.qmg
media/battery_charging_70.qmg
media/battery_charging_75.qmg
media/battery_charging_80.qmg
media/battery_charging_85.qmg
media/battery_charging_90.qmg
media/battery_charging_95.qmg
media/battery_charging_100.qmg
media/chargingwarning.qmg
media/Disconnected.qmg

usr/share/alsa/cards/aliases.conf
usr/share/alsa/pcm/center_lfe.conf
usr/share/alsa/pcm/default.conf
usr/share/alsa/pcm/dmix.conf
usr/share/alsa/pcm/dpl.conf
usr/share/alsa/pcm/dsnoop.conf
usr/share/alsa/pcm/front.conf
usr/share/alsa/pcm/iec958.conf
usr/share/alsa/pcm/modem.conf
usr/share/alsa/pcm/rear.conf
usr/share/alsa/pcm/side.conf
usr/share/alsa/pcm/surround40.conf
usr/share/alsa/pcm/surround41.conf
usr/share/alsa/pcm/surround50.conf
usr/share/alsa/pcm/surround51.conf
usr/share/alsa/pcm/surround71.conf
usr/share/alsa/alsa.conf

lib/libaudiohw_op.so
lib/libaudiohw_sf.so
lib/liblvvefs.so
lib/lib_Samsung_Sound_Booster_Handphone.so
lib/lib_Samsung_Resampler.so
lib/libsamsungSoundbooster.so
lib/libsec-ril.so
lib/liba2dp.so
lib/libsecril-client.so
etc/audio/aeqcoe.txt
etc/audio/aeqcoe_ulp.txt
etc/audio/aeqcoe_voip_rx_ear.txt
etc/audio/aeqcoe_voip_rx_head.txt
etc/audio/aeqcoe_voip_rx_spk.txt
etc/audio/aeqcoe_voip_tx.txt
etc/audio/aeqcoe_voip_tx_qik.txt
etc/audio/eur_situation.txt
etc/audio/eur_stream_earpiece.txt
etc/audio/eur_stream_headset.txt
etc/audio/eur_stream_speaker.txt
etc/audio/LVVEFS_Rx_Configuration.txt
etc/audio/LVVEFS_Tx_Configuration.txt
etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt
etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt
etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt
etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt
etc/audio/situation.txt
etc/audio/soundbooster.txt
etc/audio/srstunning.txt
etc/audio/stream_earpiece.txt
etc/audio/stream_headset.txt
etc/audio/stream_speaker.txt
etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt
etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt
etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt
etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt
"

for FILE in $FILES; do
	if [ "$ZIP" ]; then
		cp tmp/system/"$FILE" ../../../vendor/samsung/$DEVICE/proprietary/$FILE
	else
		adb pull system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
	fi
done
if [ "$ZIP" ]; then rm -rf tmp ; fi

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/samsung/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/samsung/__DEVICE__/extract-files.sh

#
# prelink
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:obj/lib/libsecrilclient.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril-apalone.so:obj/lib/libsec-ril-apalone.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril.so:obj/lib/libsec-ril.so

#
# Wifi
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin

#
# Display (3D)
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/vendor/bin/pvrsrvinit:system/vendor/bin/pvrsrvinit \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libsrv_um.so:system/vendor/lib/libsrv_um.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libsrv_init.so:system/vendor/lib/libsrv_init.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libIMGegl.so:system/vendor/lib/libIMGegl.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libpvr2d.so:system/vendor/lib/libpvr2d.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libusc.so:system/vendor/lib/libusc.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/firmware/samsung_mfc_fw.bin:system/vendor/firmware/samsung_mfc_fw.bin

#
# Sensors, Lights etc
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/vendor/bin/geomagneticd:system/vendor/bin/geomagneticd \\
    vendor/samsung/__DEVICE__/proprietary/vendor/bin/orientationd:system/vendor/bin/orientationd \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/hw/sensors.default.so:system/vendor/lib/hw/sensors.default.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libsensor_yamaha_test.so:system/vendor/lib/libsensor_yamaha_test.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/libsensorservice.so:system/vendor/lib/libsensorservice.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/hw/copybit.s5pc110.so:system/vendor/lib/hw/copybit.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/hw/lights.s5pc110.so:system/vendor/lib/hw/lights.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/hw/overlay.s5pc110.so:system/vendor/lib/hw/overlay.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/hw/gralloc.s5pc110.so:system/vendor/lib/hw/gralloc.s5pc110.so

#
# Bluetooth
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/BCM4329B1_002.002.023.0589.0649.hcd:system/bin/BCM4329B1_002.002.023.0589.0649.hcd

#
# Camera
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/tvoutserver:system/bin/tvoutserver \\
    vendor/samsung/__DEVICE__/proprietary/cameradata/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \\
    vendor/samsung/__DEVICE__/proprietary/cameradata/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \\
    vendor/samsung/__DEVICE__/proprietary/lib/libActionShot.so:system/lib/libActionShot.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs3cjpeg.so:system/lib/libs3cjpeg.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libarccamera.so:system/lib/libarccamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcameraservice.so:system/lib/libcameraservice.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libCaMotion.so:system/lib/libCaMotion.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcaps.so:system/lib/libcaps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libPanoraMax1.so:system/lib/libPanoraMax1.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libPlusMe.so:system/lib/libPlusMe.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libseccamera.so:system/lib/libseccamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecjpegencoder.so:system/lib/libsecjpegencoder.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout.so:system/lib/libtvout.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout_jni.so:system/lib/libtvout_jni.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/lib_tvoutengine.so:system/lib/lib_tvoutengine.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutfimc.so:system/lib/libtvoutfimc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvouthdmi.so:system/lib/libtvouthdmi.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutservice.so:system/lib/libtvoutservice.so \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F00.bin:system/firmware/CE147F00.bin \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F01.bin:system/firmware/CE147F01.bin \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F02.bin:system/firmware/CE147F02.bin \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F03.bin:system/firmware/CE147F03.bin


#
# RIL
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/rild:system/bin/rild \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril-apalone.so:system/lib/libsec-ril-apalone.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so

#
# GPS
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/vendor/bin/gpsd:system/vendor/bin/gpsd \\
    vendor/samsung/__DEVICE__/proprietary/vendor/etc/gps.xml:system/vendor/etc/gps.xml \\
    vendor/samsung/__DEVICE__/proprietary/etc/gps.conf:system/etc/gps.conf \\
    vendor/samsung/__DEVICE__/proprietary/vendor/lib/hw/gps.s5pc110.so:system/vendor/lib/hw/gps.s5pc110.so

#
# Files for battery charging screen
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/playlpm:system/bin/playlpm \\
    vendor/samsung/__DEVICE__/proprietary/bin/charging_mode:system/bin/charging_mode \\
    vendor/samsung/__DEVICE__/proprietary/lib/libQmageDecoder.so:system/lib/libQmageDecoder.so \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_5.qmg:system/media/battery_charging_5.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_10.qmg:system/media/battery_charging_10.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_15.qmg:system/media/battery_charging_15.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_20.qmg:system/media/battery_charging_20.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_25.qmg:system/media/battery_charging_25.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_30.qmg:system/media/battery_charging_30.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_35.qmg:system/media/battery_charging_35.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_40.qmg:system/media/battery_charging_40.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_45.qmg:system/media/battery_charging_45.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_50.qmg:system/media/battery_charging_50.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_55.qmg:system/media/battery_charging_55.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_60.qmg:system/media/battery_charging_60.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_65.qmg:system/media/battery_charging_65.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_70.qmg:system/media/battery_charging_70.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_75.qmg:system/media/battery_charging_75.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_80.qmg:system/media/battery_charging_80.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_85.qmg:system/media/battery_charging_85.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_90.qmg:system/media/battery_charging_90.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_95.qmg:system/media/battery_charging_95.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_100.qmg:system/media/battery_charging_100.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/chargingwarning.qmg:system/media/chargingwarning.qmg \\
    vendor/samsung/__DEVICE__/proprietary/media/Disconnected.qmg:system/media/Disconnected.qmg

#
# Yo dawg I heard you like ALSA files
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \\
    vendor/samsung/__DEVICE__/proprietary/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf


#
# Sound libs and other prop files
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libaudiohw_op.so:system/lib/libaudiohw_op.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libaudiohw_sf.so:system/lib/libaudiohw_sf.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/liblvvefs.so:system/lib/liblvvefs.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/lib_Samsung_Sound_Booster_Handphone.so:system/lib/lib_Samsung_Sound_Booster_Handphone.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/lib_Samsung_Resampler.so:system/lib/lib_Samsung_Resampler.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsamsungSoundbooster.so:system/lib/libsamsungSoundbooster.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/aeqcoe.txt:system/etc/audio/aeqcoe.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/aeqcoe_ulp.txt:system/etc/audio/aeqcoe_ulp.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/aeqcoe_voip_rx_ear.txt:system/etc/audio/aeqcoe_voip_rx_ear.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/aeqcoe_voip_rx_head.txt:system/etc/audio/aeqcoe_voip_rx_head.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/aeqcoe_voip_rx_spk.txt:system/etc/audio/aeqcoe_voip_rx_spk.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/aeqcoe_voip_tx.txt:system/etc/audio/aeqcoe_voip_tx.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/aeqcoe_voip_tx_qik.txt:system/etc/audio/aeqcoe_voip_tx_qik.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/eur_situation.txt:system/etc/audio/eur_situation.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/eur_stream_earpiece.txt:system/etc/audio/eur_stream_earpiece.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/eur_stream_headset.txt:system/etc/audio/eur_stream_headset.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/eur_stream_speaker.txt:system/etc/audio/eur_stream_speaker.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/LVVEFS_Rx_Configuration.txt:system/etc/audio/LVVEFS_Rx_Configuration.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/LVVEFS_Tx_Configuration.txt:system/etc/audio/LVVEFS_Tx_Configuration.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/situation.txt:system/etc/audio/situation.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/soundbooster.txt:system/etc/audio/soundbooster.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/srstunning.txt:system/etc/audio/srstunning.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/stream_earpiece.txt:system/etc/audio/stream_earpiece.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/stream_headset.txt:system/etc/audio/stream_headset.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/stream_speaker.txt:system/etc/audio/stream_speaker.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt

EOF

./setup-makefiles.sh

