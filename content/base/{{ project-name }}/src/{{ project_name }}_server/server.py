import logging
from logging import info


def start():
    print("Starting Service")
    info("Starting Service")

if __name__ == '__main__':
    logging.config.fileConfig(fname='logging.conf', disable_existing_loggers=False)
    start()
