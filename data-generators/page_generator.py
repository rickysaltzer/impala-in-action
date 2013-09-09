from random import randrange
import datetime
import sys


def generate_epochs(start=datetime.datetime.now() - datetime.timedelta(days=365 * 10), step_range=(0, 2)):
    epoch = long(start.strftime("%s"))
    while True:
        random_step = randrange(step_range[0], step_range[1])
        epoch += random_step
        yield str(epoch)


def generate_pages(domain="http://some-domain"):
    page_range = (1, 100)
    while True:
        yield str("/".join((domain, str(randrange(page_range[0], page_range[1])) + ".html")))


def generate_ips():
    def generate_slot():
        not_valid = (10, 127, 169, 172, 192)
        while True:
            slot = randrange(1, 256)
            if slot not in not_valid:
                yield slot
    slot_gen = generate_slot()
    while True:
        yield ".".join(map(str, (slot_gen.next(), slot_gen.next(), slot_gen.next(), slot_gen.next())))


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage:\n  page_generator.py [num of rows]")
        sys.exit(1)

    ip_generator = generate_ips()
    epoch_generator = generate_epochs()
    page_generator = generate_pages()

    for i in range(int(sys.argv[1])):
        print("\t".join((epoch_generator.next(), ip_generator.next(), page_generator.next())))
