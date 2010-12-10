#!/bin/bash

cd ../config

cp machines/config_live_es.yml config.yml

cd ..

./WatirCuke @sc_es sc_live_es

./WatirCuke @sc_remove sc_remove