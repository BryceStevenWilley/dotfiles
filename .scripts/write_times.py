#! /usr/bin/env python

import time
import datetime
import sys

def record_timer(value, f_name, section):
    # TODO(brycew): Section is unused at the moment
    full_format = '[%Y-%m-%d %a %H:%M:%S]'
    with open(f_name, 'a') as f_write:
        current_time = datetime.datetime.now()
        curr_time_str = current_time.strftime(full_format)
        vals = value.split(':')
        if len(vals) == 2:
            duration = datetime.timedelta(minutes=int(vals[0]),
                                          seconds=float(vals[1]))
        elif len(vals) == 3:
            duration = datetime.timedelta(hours=int(vals[0]),
                                          minutes=int(vals[1]),
                                          seconds=float(vals[2]))
        else:
            print('Cannot read time: {}'.format(value))
        prev_time = current_time - duration
        prev_time_str = prev_time.strftime(full_format)
        to_write = 'CLOCK: {}--{} => {}'.format(prev_time_str, curr_time_str, value)
        f_write.write(to_write)

def main():
    if len(sys.argv) != 5:
        print('Need to pass a command, a value, a file, a section')
        return
    command = sys.argv[1]
    if command != 'record':
        print('Command is {}, should be "record"'.format(command))
        return
    f_value = sys.argv[2]
    with open(f_value, 'r') as value_file:
        value = value_file.read()
    f_name = sys.argv[3]
    section = sys.argv[4]
    if command == 'record':
        record_timer(value, f_name, section)

if __name__ == '__main__':
    main()
