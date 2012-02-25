class AGIError < Exception
end

class AGILockError < AGIError
end

class AnswerError < AGIError
end  

class ChannelStatusError < AGIError
end

class SayAlphaError < AGIError
end

class SayPhoneticError < AGIError
end

class SetContextError < AGIError
end

class SetVariableError < AGIError
end

class DatabaseDelError < AGIError
end

class DatabaseDeltreeError < AGIError
end

class DatabaseGetError < AGIError
end

class DatabasePutError < AGIError
end

class GetDataError < AGIError
end