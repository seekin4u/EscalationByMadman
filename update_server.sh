#!/bin/bash
pkill DreamDaemon
git pull
DreamMaker baystation12
nohup DreamDaemon baystation12 2506 -trusted -webclient &