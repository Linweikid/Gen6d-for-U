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

class Joint_Voltage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_voltage = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_voltage')) {
        this.joint_voltage = initObj.joint_voltage
      }
      else {
        this.joint_voltage = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Joint_Voltage
    // Serialize message field [joint_voltage]
    bufferOffset = _arraySerializer.float32(obj.joint_voltage, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Joint_Voltage
    let len;
    let data = new Joint_Voltage(null);
    // Deserialize message field [joint_voltage]
    data.joint_voltage = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.joint_voltage.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Joint_Voltage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f712751501e1263b5499f008c4b07694';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] joint_voltage
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Joint_Voltage(null);
    if (msg.joint_voltage !== undefined) {
      resolved.joint_voltage = msg.joint_voltage;
    }
    else {
      resolved.joint_voltage = []
    }

    return resolved;
    }
};

module.exports = Joint_Voltage;
