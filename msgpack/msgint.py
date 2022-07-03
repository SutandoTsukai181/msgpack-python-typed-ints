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
