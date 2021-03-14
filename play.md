Library dependencies:
--------------------- 
Library dependencies can be added in two ways:

unmanaged dependencies are jars dropped into the lib directory
managed dependencies are configured in the build definition and downloaded automatically from repositories

1) % and %% symbols meaning: 

Getting the right Scala version with %% 
If you use organization %% moduleName % version rather than organization % moduleName % version (the difference is the double %% after the organization), sbt will add your project’s binary Scala version to the artifact name. This is just a shortcut. You could write this without the %%:

libraryDependencies += "org.scala-tools" % "scala-stm_2.11" % "0.3"
Assuming the scalaVersion for your build is 2.11.1, the following is identical (note the double %% after "org.scala-tools"):

libraryDependencies += "org.scala-tools" %% "scala-stm" % "0.3"
The idea is that many dependencies are compiled for multiple Scala versions, and you’d like to get the one that matches your project to ensure binary compatibility.

As you can see above, if you use %%, you don't have to specify the version.

The percent symbol % is a actually a method used to build dependencies. The double percent sign %% injects the current Scala version - this allows you to get the correct library for the version of scala you are running. This is to avoid having to change your build file when you update Scala.

Reference: https://www.scala-sbt.org/release/docs/Library-Dependencies.html

Steps with new Play project:
---------------------------
1. App
	controllers
	services
	views
2. Configure the Database connections, Server HTTP settings in application.conf

3. Add library dependencies in the build.sbt file.

4. Adding custom error handler to the project. Reference: https://www.playframework.com/documentation/2.8.x/ScalaErrorHandling

5. Configuring logging: https://www.playframework.com/documentation/2.8.x/SettingsLogger

6. Handling errors: https://www.playframework.com/documentation/2.8.x/ScalaErrorHandling

https://www.playframework.com/documentation/2.8.x/Tutorials

https://www.playframework.com/documentation/2.8.x/ScalaHome


