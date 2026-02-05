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

class Err {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.err = null;
    }
    else {
      if (initObj.hasOwnProperty('err')) {
        this.err = initObj.err
      }
      else {
        this.err = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Err
    // Serialize message field [err]
    bufferOffset = _arraySerializer.uint16(obj.err, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Err
    let len;
    let data = new Err(null);
    // Deserialize message field [err]
    data.err = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.err.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Err';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5b0a411346a36392edd94edb3ec31d40';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16[] err
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Err(null);
    if (msg.err !== undefined) {
      resolved.err = msg.err;
    }
    else {
      resolved.err = []
    }

    return resolved;
    }
};

module.exports = Err;
