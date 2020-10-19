#!/bin/bash
cd /opt/livy && /opt/livy/bin/livy-server start && tail -f /dev/null
