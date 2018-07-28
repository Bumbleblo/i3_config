"""
Wait SLEEP_TIME seconds and check battery level, if is
less than LOWER_LEVEL critical message in printed.
"""

import psutil # dependence 
import time
import subprocess

# seconds in sleep
SLEEP_TIME = 5
LOWER_LEVEL = 15

if __name__ == '__main__':
	
	battery = psutil.sensors_battery()

	while(1):
		if battery.percent <= LOWER_LEVEL:
			subprocess.Popen(['notify-send', '-u', 'critical', 'Low Battery', 'Charge you laptop'])

		time.sleep(SLEEP_TIME*1000)
	
	
