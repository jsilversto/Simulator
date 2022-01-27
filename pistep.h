/*
  pistep.h - Raspberry Pi stepper signal control

  Copyright (c) 2021 Josh Silverstone
*/

#ifndef _PISTEP_H_

#define _PISTEP_H_

#include <stdint.h>


typedef enum {pistep_en, pistep_step, pistep_dir} pistep_signal_t;

#define PISTEP_LASER_MIN_POWER 0.0
#define PISTEP_LASER_MAX_POWER 1000.0

int pistep_init();
int pistep_set_state(pistep_signal_t signal, uint8_t stepper_id, uint8_t state);
int pistep_set_laser_power(float power);
int pistep_set_laser_enable(unsigned char en);


#endif
