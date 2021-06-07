import subprocess
import io
import sys


EXPECTEDSWAPPINESS = 30


def print_result(func):
    def wrapper():
        result = func()
        print(result)
        return result
    return wrapper


@print_result
def check_swappiness():
    cmd = ['cat', '/proc/sys/vm/swappiness']
    swappinesscheck = subprocess.run(cmd, capture_output=True)
    swappinessnum = int(swappinesscheck.stdout.decode().strip())
    msg = '[ERROR] swappiness OK.'

    if swappinessnum != EXPECTEDSWAPPINESS:
        msg = '[ERROR] swappiness is: '+str(swappinessnum)+'; expected: '+str(EXPECTEDSWAPPINESS)

    return msg




if __name__ == '__main__':
    data = check_swappiness()
    print(data)
