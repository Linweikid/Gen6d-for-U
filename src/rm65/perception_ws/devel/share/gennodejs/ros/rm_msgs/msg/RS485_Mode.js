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

class RS485_Mode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.controller_RS485_mode = null;
      this.tool_RS485_mode = null;
      this.baudrate = null;
      this.modbus_timeout = null;
    }
    else {
      if (initObj.hasOwnProperty('controller_RS485_mode')) {
        this.controller_RS485_mode = initObj.controller_RS485_mode
      }
      else {
        this.controller_RS485_mode = 0;
      }
      if (initObj.hasOwnProperty('tool_RS485_mode')) {
        this.tool_RS485_mode = initObj.tool_RS485_mode
      }
      else {
        this.tool_RS485_mode = 0;
      }
      if (initObj.hasOwnProperty('baudrate')) {
        this.baudrate = initObj.baudrate
      }
      else {
        this.baudrate = 0;
      }
      if (initObj.hasOwnProperty('modbus_timeout')) {
        this.modbus_timeout = initObj.modbus_timeout
      }
      else {
        this.modbus_timeout = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RS485_Mode
    // Serialize message field [controller_RS485_mode]
    bufferOffset = _serializer.uint8(obj.controller_RS485_mode, buffer, bufferOffset);
    // Serialize message field [tool_RS485_mode]
    bufferOffset = _serializer.uint8(obj.tool_RS485_mode, buffer, bufferOffset);
    // Serialize message field [baudrate]
    bufferOffset = _serializer.uint32(obj.baudrate, buffer, bufferOffset);
    // Serialize message field [modbus_timeout]
    bufferOffset = _serializer.uint32(obj.modbus_timeout, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RS485_Mode
    let len;
    let data = new RS485_Mode(null);
    // Deserialize message field [controller_RS485_mode]
    data.controller_RS485_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [tool_RS485_mode]
    data.tool_RS485_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [baudrate]
    data.baudrate = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [modbus_timeout]
    data.modbus_timeout = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/RS485_Mode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68f472696d75d9d22a962adaba389926';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 controller_RS485_mode
    uint8 tool_RS485_mode
    uint32 baudrate
    uint32 modbus_timeout
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RS485_Mode(null);
    if (msg.controller_RS485_mode !== undefined) {
      resolved.controller_RS485_mode = msg.controller_RS485_mode;
    }
    else {
      resolved.controller_RS485_mode = 0
    }

    if (msg.tool_RS485_mode !== undefined) {
      resolved.tool_RS485_mode = msg.tool_RS485_mode;
    }
    else {
      resolved.tool_RS485_mode = 0
    }

    if (msg.baudrate !== undefined) {
      resolved.baudrate = msg.baudrate;
    }
    else {
      resolved.baudrate = 0
    }

    if (msg.modbus_timeout !== undefined) {
      resolved.modbus_timeout = msg.modbus_timeout;
    }
    else {
      resolved.modbus_timeout = 0
    }

    return resolved;
    }
};

module.exports = RS485_Mode;
