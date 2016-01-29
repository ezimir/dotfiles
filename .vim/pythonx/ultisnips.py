# -*- coding: utf-8 -*-



import re


def complete(tabstop, options):
    if tabstop:
        options = [option[len(tabstop):] for option in options if option.startswith(tabstop)]

    if len(options) == 1:
        return options[0]

    elif not options:
        return u''

    return u'({options})'.format(options = '|'.join(options))


def within_class(snip):
    line_number = snip.line - 1
    current = snip.buffer[line_number]
    while not re.match(r'\s*class \w.*', current):
        line_number -= 1
        if line_number < 0:
            return False

        current = snip.buffer[line_number]

    else:
        class_name = re.findall(r'class ([^\(:]+).*:', current)[0]

        return class_name


def within_method(snip):
    class_name = within_class(snip)
    if not class_name:
        return False

    line_number = snip.line - 1
    current = snip.buffer[line_number]
    while not re.match(r'\s*def \w.*', current):
        line_number -= 1
        if re.match(r'\s*class \w.*', current) or line_number < 0:
            return False

        current = snip.buffer[line_number]

    else:
        if '(self' not in current:
            return False

        func_name = re.findall(r'def ([^\(]+)\(', current)[0]
        func_attrs = re.findall(r'\(self(?:, )?(.*)\)', current)[0]

        return class_name, func_name, func_attrs


def within_tag(snip):
    return re.search('<[^<>]+$', snip.buffer[snip.line - 1][:snip.column])

