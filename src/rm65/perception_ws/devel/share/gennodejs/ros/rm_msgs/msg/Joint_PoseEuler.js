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

class Joint_PoseEuler {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.euler = null;
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('euler')) {
        this.euler = initObj.euler
      }
      else {
        this.euler = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Joint_PoseEuler
    // Check that the constant length array field [euler] has the right length
    if (obj.euler.length !== 3) {
      throw new Error('Unable to serialize array field euler - length must be 3')
    }
    // Serialize message field [euler]
    bufferOffset = _arraySerializer.float32(obj.euler, buffer, bufferOffset, 3);
    // Check that the constant length array field [position] has the right length
    if (obj.position.length !== 3) {
      throw new Error('Unable to serialize array field position - length must be 3')
    }
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float32(obj.position, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Joint_PoseEuler
    let len;
    let data = new Joint_PoseEuler(null);
    // Deserialize message field [euler]
    data.euler = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Joint_PoseEuler';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9254815d452fb49553cab1a1384a3e0a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[3] euler
    float32[3] position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Joint_PoseEuler(null);
    if (msg.euler !== undefined) {
      resolved.euler = msg.euler;
    }
    else {
      resolved.euler = new Array(3).fill(0)
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = new Array(3).fill(0)
    }

    return resolved;
    }
};

module.exports = Joint_PoseEuler;
