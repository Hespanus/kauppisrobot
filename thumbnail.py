try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False

@keyword('Edit Img Name')
def edit_img_name(name):
    parts = name.split(".")
    end = parts.pop()
    new_name = ".".join(parts)
    new_name = new_name + "_x250." + end    

    return new_name
    