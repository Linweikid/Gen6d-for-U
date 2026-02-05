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

class Arm_Current_Status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.arm_current_status = null;
    }
    else {
      if (initObj.hasOwnProperty('arm_current_status')) {
        this.arm_current_status = initObj.arm_current_status
      }
      else {
        this.arm_current_status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Arm_Current_Status
    // Serialize message field [arm_current_status]
    bufferOffset = _serializer.string(obj.arm_current_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Arm_Current_Status
    let len;
    let data = new Arm_Current_Status(null);
    // Deserialize message field [arm_current_status]
    data.arm_current_status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.arm_current_status);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Arm_Current_Status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '22014e450b07851d8586a5146c339be8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string arm_current_status
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Arm_Current_Status(null);
    if (msg.arm_current_status !== undefined) {
      resolved.arm_current_status = msg.arm_current_status;
    }
    else {
      resolved.arm_current_status = ''
    }

    return resolved;
    }
};

module.exports = Arm_Current_Status;
