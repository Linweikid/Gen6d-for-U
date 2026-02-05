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

class Register_Data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Register_Data
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint16(obj.data, buffer, bufferOffset, null);
    // Serialize message field [state]
    bufferOffset = _serializer.bool(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Register_Data
    let len;
    let data = new Register_Data(null);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [state]
    data.state = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.data.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Register_Data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ca800c21ed60db7e7472b2720ef8f45e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16[] data
    bool state
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Register_Data(null);
    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = false
    }

    return resolved;
    }
};

module.exports = Register_Data;
