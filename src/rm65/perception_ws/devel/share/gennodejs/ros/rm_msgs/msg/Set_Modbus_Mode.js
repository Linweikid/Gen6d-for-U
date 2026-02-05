// Auto-generated. Do not edit!

// (in-package rm_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Set_Modbus_Mode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.port = null;
      this.baudrate = null;
      this.timeout = null;
      this.ip = null;
    }
    else {
      if (initObj.hasOwnProperty('port')) {
        this.port = initObj.port
      }
      else {
        this.port = 0;
      }
      if (initObj.hasOwnProperty('baudrate')) {
        this.baudrate = initObj.baudrate
      }
      else {
        this.baudrate = 0;
      }
      if (initObj.hasOwnProperty('timeout')) {
        this.timeout = initObj.timeout
      }
      else {
        this.timeout = 0;
      }
      if (initObj.hasOwnProperty('ip')) {
        this.ip = initObj.ip
      }
      else {
        this.ip = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Set_Modbus_Mode
    // Serialize message field [port]
    bufferOffset = _serializer.uint32(obj.port, buffer, bufferOffset);
    // Serialize message field [baudrate]
    bufferOffset = _serializer.uint32(obj.baudrate, buffer, bufferOffset);
    // Serialize message field [timeout]
    bufferOffset = _serializer.uint32(obj.timeout, buffer, bufferOffset);
    // Serialize message field [ip]
    bufferOffset = _serializer.string(obj.ip, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Modbus_Mode
    let len;
    let data = new Set_Modbus_Mode(null);
    // Deserialize message field [port]
    data.port = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [baudrate]
    data.baudrate = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [timeout]
    data.timeout = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [ip]
    data.ip = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.ip);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Set_Modbus_Mode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b976f7425d6e802fa67e71df2372ee55';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 port
    uint32 baudrate
    uint32 timeout
    string ip
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Set_Modbus_Mode(null);
    if (msg.port !== undefined) {
      resolved.port = msg.port;
    }
    else {
      resolved.port = 0
    }

    if (msg.baudrate !== undefined) {
      resolved.baudrate = msg.baudrate;
    }
    else {
      resolved.baudrate = 0
    }

    if (msg.timeout !== undefined) {
      resolved.timeout = msg.timeout;
    }
    else {
      resolved.timeout = 0
    }

    if (msg.ip !== undefined) {
      resolved.ip = msg.ip;
    }
    else {
      resolved.ip = ''
    }

    return resolved;
    }
};

module.exports = Set_Modbus_Mode;
