module Mongo
  enum OpCode
    OP_REPLY = 1
    OP_UPDATE = 2001
    OP_INSERT = 2002
    RESERVED = 2003
    OP_QUERY = 2004
    OP_GET_MORE = 2005
    OP_DELETE = 2006
    OP_KILL_CURSORS = 2007
    OP_MSG = 2013
  end

  # Client Request Messages

  struct OP_UPDATE
    header : MsgHeader
    zero : Int32
    fullCollectionName : String # CString
    flags : Int32
    selector : Document
    update : Document
  end

  struct OP_INSERT
    header : MsgHeader
    flags : Int32
    fullCollectionName : String # CString
    documents : Array(Document)
  end

  struct OP_QUERY
    header : MsgHeader
    flags : Int32
    fullCollectionName : String # CString
    numberToSkip : Int32
    numberToReturn : Int32
    query : Document
    # [ document  returnFieldsSelector ]
  end

  struct OP_GET_MORE
    header : MsgHeader
    zero : Int32
    fullCollectionName : String # CString
    numberToReturn : Int32
    cursorID : Int64
  end

  struct OP_DELETE
    header : MsgHeader
    zero : Int32
    fullCollectionName : String # CString
    flags : Int32
    selector : Document
  end

  struct OP_KILL_CURSORS
    header : MsgHeader
    zero : Int32
    numberOfCursorIDs : Int32
    cursorIDs : Array(Int64)
  end

  struct OP_MSG
    header : MsgHeader
    flagBits : UInt32
    sections : Sections[]
    # checksum : optional<uint32>
  end

  struct OP_REPLY
    header : MsgHeader
    responseFlags : Int32
    cursorID : Int64
    startingFrom : Int32
    numberReturned : Int32
    documents : Array(Document)
  end
end