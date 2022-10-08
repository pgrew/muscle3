#!/bin/bash

./muscle -in /input/in.fasta -out /output/out.fasta -msf &>/dev/nu
cat /output/out.fasta
