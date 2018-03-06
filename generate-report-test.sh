#!/bin/bash

BASEDIR=$(dirname "$0")

sh $BASEDIR/codecover-batch-1.0/codecover.sh instrument --root-directory $BASEDIR/src/main/java/ --destination src.instr --container icmc_tsc.xml --language java --verbose

mvn clean test

find src.instr/ -name *.java | xargs javac

java -cp libs/junit-4.2.jar:codecover-batch-1.0/lib/JUnit-TestRunner.jar:codecover-batch-1.0/lib/plugins/org.codecover.instrumentation.java15-0.1.jar:src.instr/:target/test-classes/ org.codecover.junit4.core.TestRunner -useMethodsAsTestcases usp.icmc.ATest usp.icmc.BTest

# ESSA parte aqui rode a parte trocando o log coverage-log-2018-03-06-16-54-36-070.clf pelo que foi gerado
#codecover-batch-1.0/codecover.sh analyze --container icmc_tsc.xml --coverage-log coverage-log-2018-03-06-16-54-36-070.clf --name JUnitTestSession --comment "Two errors occurred."