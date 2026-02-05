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

class Write_Register {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.port = null;
      this.address = null;
      this.num = null;
      this.data = null;
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
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
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
    // Serializes a message object of type Write_Register
    // Serialize message field [port]
    bufferOffset = _serializer.uint8(obj.port, buffer, bufferOffset);
    // Serialize message field [address]
    bufferOffset = _serializer.uint32(obj.address, buffer, bufferOffset);
    // Serialize message field [num]
    bufferOffset = _serializer.uint32(obj.num, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint16(obj.data, buffer, bufferOffset, null);
    // Serialize message field [device]
    bufferOffset = _serializer.uint32(obj.device, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Write_Register
    let len;
    let data = new Write_Register(null);
    // Deserialize message field [port]
    data.port = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [address]
    data.address = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [num]
    data.num = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [device]
    data.device = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.data.length;
    return length + 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Write_Register';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f824a8509f33e365cbdaf7a07757719';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 port
    uint32 address
    uint32 num
    uint16[] data
    uint32 device
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Write_Register(null);
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

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
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

module.exports = Write_Register;
