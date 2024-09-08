import asyncio
from datetime import datetime

log.info(f"\n\n" + "#"*80)
# wait for one minute after startup
log.info(f"Waiting for 30 seconds...")
await asyncio.sleep(30)
log.info(f"waiting done!")
log.info(f"\n\n" + "#"*80)

# make sure heater is in correct state when script is loaded

log.info(sensor.terratemp)
log.info("Temperature: {:2.1f} DegC".format(float(sensor.terratemp)))
log.info("Heater is {:}".format(switch.szenaheater_switch))

log.info(f"Setting up Szenarium Heater Automation")
@state_trigger("sensor.terratemp")
def state_trig_func(**kwargs):
    task.unique("terra_temp")
    now = datetime.now()
    # set different temps during day and night
    if (now.hour >= 8) and (now.hour < 19):
        log.info(f"temperature changed during day!")
        low_temp = 24.5
        high_temp = 27.5
    else:
        log.info(f"temperature changed at night!")
        low_temp = 20.0
        high_temp = 23.0

    if (float(sensor.terratemp) <= low_temp) and (switch.szenaheater_switch == 'off'):
        switch.szenaheater_switch.turn_on()
        log.info(f"Enabled heater!")

    if (float(sensor.terratemp) >= high_temp) and (switch.szenaheater_switch == 'on'):
        switch.szenaheater_switch.turn_off()
        log.info(f"Disabled heater!")
        
log.info(f"\n\n" + "#"*80)
log.info(f"\n\n" + "#"*80)
