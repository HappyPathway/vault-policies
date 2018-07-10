#!/usr/bin/env python
from boto import ec2
from boto.exception import EC2ResponseError
import time

def scan():  
    e_conn = ec2.connect_to_region('us-east-1')
    for istance in e_conn.get_only_instances(filters={'tag:Owner': owner}):
        print(istance)

def main(sleep_time, owner):
    try:
        while True:
            scan(owner)
            time.sleep(int(sleep_time))
    except KeyboardInterrupt:
        print "exiting..."
    except EC2ResponseError, e:
        print str(e)

if __name__ == '__main__':
    from optparse import OptionParser
    parser = OptionParser()
    parser.add_option('-t', dest='sleep_time')
    parser.add_option('-u', dest='owner')
    opt, arg = parser.parse_args()

    main(opt.sleep_time, opt.owner)
