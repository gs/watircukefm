#!/bin/bash

cd ../config

cp machines/config_live_en.yml config.yml

cd ..

./WatirCuke @sc_en sc_live_en

./WatirCuke @sc_remove sc_remove