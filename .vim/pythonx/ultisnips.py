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


def within_class(buffer, line):
    line_number = line - 1
    current = buffer[line_number]
    while not re.match(r'\s*class \w.*', current):
        line_number -= 1
        if line_number < 0:
            return False

        current = buffer[line_number]

    else:
        class_name = re.findall(r'class ([^\(:]+).*:', current)[0]

        return class_name


def within_method(buffer, line):
    class_name = within_class(buffer, line)
    if not class_name:
        return False

    line_number = line - 1
    current = buffer[line_number]
    while not re.match(r'\s*def \w.*', current):
        line_number -= 1
        if re.match(r'\s*class \w.*', current) or line_number < 0:
            return False

        current = buffer[line_number]

    else:
        if '(self' not in current:
            return False

        func_name = re.findall(r'def ([^\(]+)\(', current)[0]
        func_attrs = re.findall(r'\(self(?:, )?(.*)\)', current)[0]

        return class_name, func_name, func_attrs

