#!/bin/bash
ping -c1 8.8.8.8 | grep time |cut -f4 -d'='

