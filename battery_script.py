#! /usr/bin/python3

"""
Wait SLEEP_TIME seconds and check battery level, if is
less than LOWER_LEVEL critical message in printed.
"""

import psutil # dependence 
import time
import subprocess
import logging

# minutes in sleep
SLEEP_TIME = 30
LOWER_LEVEL = 15

if __name__ == '__main__':
	
	logging.debug('Battery script up')

	while(1):

		battery = psutil.sensors_battery()
		if battery.percent <= LOWER_LEVEL:
			subprocess.Popen(['notify-send', '-u', 'critical', 'Low Battery', 'Charge you laptop'])

		time.sleep(SLEEP_TIME)
	
	logging.debug('Battery script down')
	
