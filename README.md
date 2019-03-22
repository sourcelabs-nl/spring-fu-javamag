# graalvm-spring-fu
GraalVM + Spring Fu example for Java magazine - Forked from Sebastien Deleuze's kofu-reactive-minimal example

# Install Graal >= RC13

Using SKD manager (or Jenv) setup your environment to run with GraalVM

# Build

Build the project using gradle:

`./gradlew build`

# Build GraalVM Native image

Run `build.sh`, which will yield a file called `com.sample.applicationkt`.

# Run application

Run `com.sample.applicationkt` which will run the app natively.

# Result

`- Started application in 0.166 seconds (JVM running for 0.168)`
