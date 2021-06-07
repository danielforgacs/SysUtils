import subprocess


EXPECTEDSWAPPINESS = '30'


def check_swappiness():
    cmd = ['cat', '/proc/sys/vm/swappiness']
    swappinesscheck = subprocess.run(cmd, capture_output=True)
    swappinessnum = swappinesscheck.stdout.decode().strip()

    if swappinessnum != EXPECTEDSWAPPINESS:
        # error('swappiness is: '+swappinessnum+'; expected: '+EXPECTEDSWAPPINESS)
        print('swappiness is: '+swappinessnum+'; expected: '+EXPECTEDSWAPPINESS)




if __name__ == '__main__':
    check_swappiness()
