try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False

@keyword('REMOVE SPACES')
def remove_spaces(file_name):

    lines = []

    with open(file_name, 'r', encoding="utf-8") as f:
        lines = f.readlines()

    f.close()

    newlines = [line for line in lines if line != '\n']
    

    f = open('linkit2.txt', 'w', encoding="utf-8")

    for line in newlines:
        f.write(line)

    f.close()