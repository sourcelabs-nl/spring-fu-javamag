#!/usr/bin/env sh

./gradlew clean build -Pgraal=true
unzip build/libs/spring-fu-javamag.jar -d build/libs/spring-fu-javamag

native-image --allow-incomplete-classpath -H:IncludeResources='META-INF/.*.json|META-INF/spring.factories|org/springframework/boot/logging/.*|kotlin/.*.kotlin_builtins' --delay-class-initialization-to-runtime=io.netty.handler.codec.http.HttpObjectEncoder,org.springframework.core.io.VfsUtils,org.springframework.format.support.DefaultFormattingConversionService --delay-class-initialization-to-runtime=io.netty.handler.codec.http.HttpObjectEncoder,org.springframework.core.io.VfsUtils,org.springframework.format.support.DefaultFormattingConversionService -H:ReflectionConfigurationFiles=graal/app.json,graal/boot.json,graal/framework.json,graal/netty.json,graal/log4j.json -Dio.netty.noUnsafe=true -H:+ReportUnsupportedElementsAtRuntime -Dfile.encoding=UTF-8 -cp ".:$(echo build/libs/spring-fu-javamag/BOOT-INF/lib/*.jar | tr ' ' ':')":build/libs/spring-fu-javamag/BOOT-INF/classes com.sample.ApplicationKt
