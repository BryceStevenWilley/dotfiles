#! /usr/bin/env python

import datetime
import sys


def record_timer(value, f_name, section):
    current_time = datetime.datetime.now()
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
        return False
    prev_time = current_time - duration
    if f_name.endswith('.csv'):
        full_format = '%m/%d/%Y %H:%M:%S'
        start_str = prev_time.strftime(full_format)
        to_write = '{},{},"{}","Breathing (catkim)"'.format(
            start_str, value, section)
    else:
        # TODO(brycew): Section is unused at the moment
        full_format = '[%Y-%m-%d %a %H:%M:%S]'
        end_str = current_time.strftime(full_format)
        start_str = prev_time.strftime(full_format)
        to_write = 'CLOCK: {}--{} => {}'.format(start_str, end_str, value)
    with open(f_name, 'a') as f_write:
        f_write.write(to_write)
    return True


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
        if record_timer(value, f_name, section):
            print("Written successfully!")


if __name__ == '__main__':
    main()
