module Mongo
  # Standard Message Header

  struct MsgHeader
    messageLength : Int32
    requestID : Int32
    responseTo : Int32
    opCode : Int32
  end
end
