#!/bin/bash

basename $0
dirname $0
echo $0
DIR=`readlink -f $0 | xargs dirname`
echo $DIR
