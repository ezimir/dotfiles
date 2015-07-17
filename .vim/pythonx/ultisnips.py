
def complete(tabstop, options):
    if tabstop:
        options = [option[len(tabstop):] for option in options if option.startswith(tabstop)]

    if len(options) == 1:
        return options[0]

    return '({options})'.format(options = '|'.join(options))

