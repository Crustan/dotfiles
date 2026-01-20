#!/bin/bash

if lsof -i :5432 > /dev/null 2>&1; then
  echo -n "green" | nc -4u -w0 localhost 1738
else
  echo -n "red" | nc -4u -w0 localhost 1738
fi
