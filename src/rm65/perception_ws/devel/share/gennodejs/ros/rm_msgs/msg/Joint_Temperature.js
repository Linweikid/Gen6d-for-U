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

class Joint_Temperature {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_temperature = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_temperature')) {
        this.joint_temperature = initObj.joint_temperature
      }
      else {
        this.joint_temperature = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Joint_Temperature
    // Serialize message field [joint_temperature]
    bufferOffset = _arraySerializer.float32(obj.joint_temperature, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Joint_Temperature
    let len;
    let data = new Joint_Temperature(null);
    // Deserialize message field [joint_temperature]
    data.joint_temperature = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.joint_temperature.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Joint_Temperature';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7dbb3b0458bf6107a0e5950b28f68abf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] joint_temperature
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Joint_Temperature(null);
    if (msg.joint_temperature !== undefined) {
      resolved.joint_temperature = msg.joint_temperature;
    }
    else {
      resolved.joint_temperature = []
    }

    return resolved;
    }
};

module.exports = Joint_Temperature;
