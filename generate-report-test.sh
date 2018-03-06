#!/bin/bash

BASEDIR=$(dirname "$0")

rm -f $BASEDIR/coverage-log*
rm -f icmc_tsc.xml

sh $BASEDIR/codecover-batch-1.0/codecover.sh instrument --root-directory $BASEDIR/src/main/java/ --destination src.instr --container icmc_tsc.xml --language java --verbose

mvn clean test

find src.instr/ -name *.java | xargs javac

java -cp libs/junit-4.2.jar:codecover-batch-1.0/lib/JUnit-TestRunner.jar:codecover-batch-1.0/lib/plugins/org.codecover.instrumentation.java15-0.1.jar:src.instr/:target/test-classes/ org.codecover.junit4.core.TestRunner -useMethodsAsTestcases usp.icmc.ATest usp.icmc.BTest

file=$(find $BASEDIR -name "coverage*")
sh  $BASEDIR/codecover-batch-1.0/codecover.sh analyze --container icmc_tsc.xml --coverage-log $file --name JUnitTestSession