FROM ubuntu:16.04

ENV ANDROID_HOME /opt/android-sdk-linux

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y git wget unzip openjdk-8-jdk libc6:i386 libstdc++6:i386 libgcc1:i386 libncurses5:i386 libz1:i386 net-tools \
    && apt-get clean

RUN wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O android-sdk-tools.zip \
    && unzip -q android-sdk-tools.zip -d ${ANDROID_HOME} \
    && rm android-sdk-tools.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

RUN yes | sdkmanager  --licenses \
    && sdkmanager "tools" "platform-tools" \
    && yes | sdkmanager "platforms;android-28" "build-tools;28.0.3"
