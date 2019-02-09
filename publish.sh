#!/bin/bash
docker login
docker build . --tag dimitrykislichenko/credits:latest
docker push dimitrykislichenko/credits:latest