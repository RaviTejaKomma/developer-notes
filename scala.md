Here are 4 tips to stand out as a Software Engineer.

1) Become an expert in a niche area of software development (e.g., CSS, bash scripting, version control, etc.)—you’ll be the go-to person whenever someone on your team needs help in that domain.

2) Take initiative, whether it be starting and leading a project, volunteering to onboard a new engineer, or taking it upon yourself to clean up some tech debt.

3) Do work that others don’t like doing: refactoring code, writing documentation, etc.. Your teammates will appreciate it, and you might find yourself indirectly doing tips 1) and 2).

4) Hone your communication skills—specifically, be the bridge between the engineers and the other stakeholders on your team (designers, product managers, writers, etc.).



SBT: 
Summary of important sbt commands
exit - ends the sbt session
help - lists the available commands
compile - compiles the main sources
test:compile - compiles the test and main sources
test - runs tests after compiling the test and main sources
console - starts the REPL with the project on the classpath
run - runs a main class, passing args provided on command line
clean - deletes files produced by the build in the target directory
reload - reloads the project in the current sbt session
sbtVersion - provides the version of sbt


You can do 'show full-classpath' on sbt command line to see what akka its picking up.

Or even better you can use sbt dependency graph to get a more detailed view



Why Scala?
It runs on JVM.
Statically typed, yet lightweight syntax.
Supports both Object oriented and Functional: Pick the right tool for the job.
Scalable Language: Perfect fit for typesafe DLSs
Stable yet innovative
Fully Interoperable with Java


Scala REPL:
The Read Eval Print Loop is an interactive shell, started via
	- scala from command line
	- console in sbt
Compiles and evaluates Scala code immediately
Very helpful for experiment-driven development

scala>:help

:cp
:help
:history
:javap
:load
:paste
:quit
:replay
:reset
:sh <command line>
:warnings


Code Samples:

1) To convert 
val finalMetrics = metrics.map(metric => Json.obj(metric("key").as[String] -> metric("value"))).foldLeft(Json.obj())(_ ++ _)

2) val appSettings = result._2
val jsonTransformer = (JsPath \ "basic_info").json.update(
  __.read[JsObject].map{ obj => obj ++ Json.obj( "settings" -> appSettings) }
)
jsonObject.transform(jsonTransformer).get



Reference:
https://medium.com/@alessandroheres/scala-programming-an-introduction-33464b390d57	

Old Design Patterns in Scala:
https://www.lihaoyi.com/post/OldDesignPatternsinScala.html


https://docs.scala-lang.org/cheatsheets/

https://data-flair.training/blogs/scala-iterator/

Dependency Injection in Scala - For Blog
https://di-in-scala.github.io/