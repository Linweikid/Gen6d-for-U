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

class Read_Register {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.port = null;
      this.address = null;
      this.num = null;
      this.device = null;
    }
    else {
      if (initObj.hasOwnProperty('port')) {
        this.port = initObj.port
      }
      else {
        this.port = 0;
      }
      if (initObj.hasOwnProperty('address')) {
        this.address = initObj.address
      }
      else {
        this.address = 0;
      }
      if (initObj.hasOwnProperty('num')) {
        this.num = initObj.num
      }
      else {
        this.num = 0;
      }
      if (initObj.hasOwnProperty('device')) {
        this.device = initObj.device
      }
      else {
        this.device = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Read_Register
    // Serialize message field [port]
    bufferOffset = _serializer.uint8(obj.port, buffer, bufferOffset);
    // Serialize message field [address]
    bufferOffset = _serializer.uint32(obj.address, buffer, bufferOffset);
    // Serialize message field [num]
    bufferOffset = _serializer.uint32(obj.num, buffer, bufferOffset);
    // Serialize message field [device]
    bufferOffset = _serializer.uint32(obj.device, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Read_Register
    let len;
    let data = new Read_Register(null);
    // Deserialize message field [port]
    data.port = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [address]
    data.address = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [num]
    data.num = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [device]
    data.device = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Read_Register';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e80462a4b4637747ba287fa5251e9e0c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 port
    uint32 address
    uint32 num
    uint32 device
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Read_Register(null);
    if (msg.port !== undefined) {
      resolved.port = msg.port;
    }
    else {
      resolved.port = 0
    }

    if (msg.address !== undefined) {
      resolved.address = msg.address;
    }
    else {
      resolved.address = 0
    }

    if (msg.num !== undefined) {
      resolved.num = msg.num;
    }
    else {
      resolved.num = 0
    }

    if (msg.device !== undefined) {
      resolved.device = msg.device;
    }
    else {
      resolved.device = 0
    }

    return resolved;
    }
};

module.exports = Read_Register;
