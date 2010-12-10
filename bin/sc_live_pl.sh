#!/bin/bash

cd ../config

cp machines/config_live_pl.yml config.yml

cd ..

./WatirCuke @sc_pl sc_live_pl

./WatirCuke @sc_remove sc_remove