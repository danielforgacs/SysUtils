import subprocess
import io
import sys


EXPECTEDSWAPPINESS = '30'


class StdOutCapture:
    def __enter__(self, *args, **kwargs):
        self.stdout = io.StringIO()
        sys.stdout = self.stdout

    def __exit__(self, *args, **kwargs):
        sys.stdout == sys.__stdout__

    @property
    def data(self):
        return self.stdout.getvalue()



def check_swappiness():
    cmd = ['cat', '/proc/sys/vm/swappiness']
    swappinesscheck = subprocess.run(cmd, capture_output=True)
    swappinessnum = swappinesscheck.stdout.decode().strip()
    msg = None

    if swappinessnum != EXPECTEDSWAPPINESS:
        # msg =
        # error('swappiness is: '+swappinessnum+'; expected: '+EXPECTEDSWAPPINESS)
        print('swappiness is: '+swappinessnum+'; expected: '+EXPECTEDSWAPPINESS)




if __name__ == '__main__':
    # sys.stdout = io.StringIO()
    # mysdtout = sys.stdout
    check_swappiness()
    # sys.stdout = sys.__stdout__
    # print(mysdtout.getvalue())
