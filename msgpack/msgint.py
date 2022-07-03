class msgIntBase(int): pass

class msgUInt8(msgIntBase): pass
class msgInt8(msgIntBase): pass
class msgUInt16(msgIntBase): pass
class msgInt16(msgIntBase): pass
class msgUInt32(msgIntBase): pass
class msgInt32(msgIntBase): pass
class msgUInt64(msgIntBase): pass
class msgInt64(msgIntBase): pass

class msgUByte(msgUInt8): pass
class msgByte(msgInt8): pass

class msgFloat(float): pass
class msgDouble(float): pass


MSG_INT_TYPES = [
    msgUInt8,
    msgInt8,
    msgUInt16,
    msgInt16,
    msgUInt32,
    msgInt32,
    msgUInt64,
    msgInt64,
    msgUByte,
    msgByte,
    msgFloat,
    msgDouble,
]


def msg_int_hook(obj, val):
    return MSG_INT_TYPES[val](obj)


def msg_float_hook(obj, val):
    return MSG_INT_TYPES[val](obj)
