#!/bin/bash

for ext in bc opt cbpl bpl loc gbpl; do
  find . -iname "*.${ext}" -print -delete
done
