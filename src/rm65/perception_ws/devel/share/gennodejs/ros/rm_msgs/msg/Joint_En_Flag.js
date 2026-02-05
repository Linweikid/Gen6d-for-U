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

class Joint_En_Flag {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_en_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_en_flag')) {
        this.joint_en_flag = initObj.joint_en_flag
      }
      else {
        this.joint_en_flag = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Joint_En_Flag
    // Serialize message field [joint_en_flag]
    bufferOffset = _arraySerializer.bool(obj.joint_en_flag, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Joint_En_Flag
    let len;
    let data = new Joint_En_Flag(null);
    // Deserialize message field [joint_en_flag]
    data.joint_en_flag = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.joint_en_flag.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Joint_En_Flag';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e7e77bbef527559ebf285523745d1dc5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool[] joint_en_flag
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Joint_En_Flag(null);
    if (msg.joint_en_flag !== undefined) {
      resolved.joint_en_flag = msg.joint_en_flag;
    }
    else {
      resolved.joint_en_flag = []
    }

    return resolved;
    }
};

module.exports = Joint_En_Flag;
