/*
  pistep.h - Raspberry Pi stepper signal control

  Copyright (c) 2021 Josh Silverstone
*/

#ifndef _PISTEP_H_

#define _PISTEP_H_

#include <stdint.h>


typedef enum {pistep_en, pistep_step, pistep_dir} pistep_signal_t;

int pistep_init();
int pistep_set_state(pistep_signal_t signal, uint8_t stepper_id, uint8_t state);


#endif
