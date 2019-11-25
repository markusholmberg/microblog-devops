#!/bin/sh
ls
source venv/bin/activate
cd tests
make exec-tests
make validate
