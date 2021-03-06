# Table of contents

* [Overview](#overview)
* [Libraries](#libs)
* [Building](#build)
    * [Desktop](#build-desktop)
    * [Android](#build-android)
    * [iOS](#build-ios)
    * [Web](#build-web)
* [Examples](#examples)
    * [01. Embed resource into executable](#ex01)
    * [02. Use PNG images with PNG plugins](#ex02)
    * [03. Implement HTTP client to perform GET/POST requests](#ex03)
    * [04. Debug application remotely](#ex04)
    * [05. Node selection](#ex05)
    * [06. Command sequence](#ex06)
* [Help](#help)

<a name="overview"/>

# Overview

[OpenSceneGraph][osg] is an open source high performance
3D graphics toolkit, used by application developers in fields such as visual
simulation, games, virtual reality, scientific visualization and modelling.

This document is a logical continuation of
[OpenSceneGraph cross-platform guide][osgcpg]. Here you'll find
a collection of examples to perform specific tasks.

Examples run on the following platforms:

* Linux
* macOS
* Android
* iOS
* Web

**Note**: Windows builds have not yet been tested.

<a name="libs"/>

# Libraries

Each example uses OpenSceneGraph.
OpenSceneGraph is built as part of each example: examples don't use
OpenSceneGraph libraries built separately, instead each example includes
OpenSceneGraph sources directly. This was necessary to simplify building
OpenSceneGraph across platforms. [Here's custom CMakeLists.txt][custom-osg-cmake]
we use to build OpenSceneGraph across platforms (excluding iOS).

Certain examples use other libraries like Mongoose and libpng-android
to achieve specific functionality. Those libraries are part of
corresponding examples, too.

<a name="build"/>

# Building

Each example contains four implementations to cover all supported platforms:

* desktop (Linux, macOS, Windows)
* android
* ios
* web

Let's see how to build the first example for each platform.

**Notes**:

* you must have OpenSceneGraph sources alongside this repository
* you must have mongoose, libpng-android sources alongside this repository, too, for certain examples

<a name="build-desktop"/>

## Desktop

To build the first example, run the following commands:

```
cd 01.EmbedResource/desktop
mkdir build
cd build
cmake ..
make
```

  ![Screenshot][screenshot-desktop]

To launch the first example, run the following command:

`./ex01-embed-resource`

<a name="build-android"/>

## Android

  ![Screenshot][screenshot-android]

**Notes**:

* Android project is built for `armeabi-v7a` architecture by default
    * update `abiFilters` value in `android/app/build.gradle` if you want other platforms
* make sure to run `Tools -> Android -> Sync Project with Gradle Files` in Android Studio after opening a project, this is necessary for Android Studio to create internal project files

To build and run the first example for Android, open
`01.EmbedResource/android` in Android Studio and run the project.

<a name="build-ios"/>

## iOS

  ![Screenshot][screenshot-ios]

To build and run the first example for iOS, open
`01.EmbedResource/ios/ex01.xcodeproj` in Xcode and run the project.

<a name="build-web"/>

## Web

To build the first example for web, run the following commands:

```
cd 01.EmbedResource/web
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=/path/to/emsdk/emscripten/<version>/cmake/Modules/Platform/Emscripten.cmake ..
make
```

**Notes**:

* you must have Emscripten installed (see [Emscripten documentation][emscripten-installation] for details)
* make sure to specify path to Emscripten's CMake toolchain file


![Screenshot][screenshot-web]

To launch the first example, open `ex01-embed-resource.html` file in Firefox.

To launch the example in any web browser, you need to serve example files
with a web server.

### Serving example with Python web server

If you have have Python installed, here's what you need to do:

* serve example with a web server:

    ```
    cd 01.EmbedResource/web/build
    python -m SimpleHTTPServer
    ```
* open [http://localhost:8000](http://localhost:8000) in any web browser
* select `ex01-embed-resource.html` file

<a name="examples"/>

# Examples

<a name="ex01"/>

### [01. Embed resource into executable][ex01]

  ![Screenshot][ex01-screenshot]

  Learn how to embed a binary resource into application with `xxd` Unix utility
  and use the resource across platforms.

<a name="ex02"/>

### [02. Use PNG images with PNG plugins][ex02]

  ![Screenshot][ex02-screenshot]

  Learn how to use PNG images across platforms with PNG plugins.

<a name="ex03"/>

### [03. Implement HTTP client to perform GET/POST requests][ex03]

  ![Screenshot][ex03-screenshot]

  Learn how to implement HTTP client across platforms to perform
  GET/POST requests.

<a name="ex04"/>

### [04. Debug application remotely][ex04]

  ![Screenshot][ex04-screenshot]

  Learn how to work with debug-broker to perform remote debugging.

<a name="ex05"/>

### [05. Node selection][ex05]

  ![Screenshot][ex05-screenshot]

  Learn how to select a node.

<a name="ex06"/>

### [06. Command sequence][ex06]

  ![Screenshot][ex06-screenshot]

  Learn how to compose a sequence of asynchronous commands to combine
  animations with other operations.

<a name="help"/>

Help
====

Feel free to [ask questions][issues] in the issues. Your questions help us
improve examples.

[osg]: http://openscenegraph.org
[osgcpg]: https://github.com/OGStudio/openscenegraph-cross-platform-guide
[custom-osg-cmake]: libs/OpenSceneGraph/CMakeLists.txt
[emscripten-installation]: http://kripken.github.io/emscripten-site/docs/getting_started/downloads.html
[issues]: https://github.com/OGStudio/openscenegraph-cross-platform-examples/issues

[screenshot-desktop]: readme/shot-desktop.png
[screenshot-android]: readme/shot-android.png
[screenshot-ios]: readme/shot-ios.png
[screenshot-web]: readme/shot-web.png

[ex01]: 01.EmbedResource
[ex01-screenshot]: 01.EmbedResource/shot.png

[ex02]: 02.TextureImage
[ex02-screenshot]: 02.TextureImage/shot.png

[ex03]: 03.HTTPClient
[ex03-screenshot]: 03.HTTPClient/shot.png

[ex04]: 04.RemoteDebugging
[ex04-screenshot]: 04.RemoteDebugging/shot.png

[ex05]: 05.NodeSelection
[ex05-screenshot]: 05.NodeSelection/shot.png

[ex06]: 06.CommandSequence
[ex06-screenshot]: 06.CommandSequence/shot.png
