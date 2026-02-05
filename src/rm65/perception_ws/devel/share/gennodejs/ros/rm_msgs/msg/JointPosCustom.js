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

class JointPosCustom {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint = null;
      this.expand = null;
      this.follow = null;
      this.trajectory_mode = null;
      this.radio = null;
    }
    else {
      if (initObj.hasOwnProperty('joint')) {
        this.joint = initObj.joint
      }
      else {
        this.joint = [];
      }
      if (initObj.hasOwnProperty('expand')) {
        this.expand = initObj.expand
      }
      else {
        this.expand = 0.0;
      }
      if (initObj.hasOwnProperty('follow')) {
        this.follow = initObj.follow
      }
      else {
        this.follow = false;
      }
      if (initObj.hasOwnProperty('trajectory_mode')) {
        this.trajectory_mode = initObj.trajectory_mode
      }
      else {
        this.trajectory_mode = 0;
      }
      if (initObj.hasOwnProperty('radio')) {
        this.radio = initObj.radio
      }
      else {
        this.radio = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointPosCustom
    // Serialize message field [joint]
    bufferOffset = _arraySerializer.float32(obj.joint, buffer, bufferOffset, null);
    // Serialize message field [expand]
    bufferOffset = _serializer.float32(obj.expand, buffer, bufferOffset);
    // Serialize message field [follow]
    bufferOffset = _serializer.bool(obj.follow, buffer, bufferOffset);
    // Serialize message field [trajectory_mode]
    bufferOffset = _serializer.uint8(obj.trajectory_mode, buffer, bufferOffset);
    // Serialize message field [radio]
    bufferOffset = _serializer.uint8(obj.radio, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointPosCustom
    let len;
    let data = new JointPosCustom(null);
    // Deserialize message field [joint]
    data.joint = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [expand]
    data.expand = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [follow]
    data.follow = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [trajectory_mode]
    data.trajectory_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radio]
    data.radio = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.joint.length;
    return length + 11;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/JointPosCustom';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2953fc21da6104e47b8b6b70f74f1aee';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #control arm joints without planning
    
    float32[] joint
    float32    expand
    bool follow
    uint8 trajectory_mode
    uint8 radio
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointPosCustom(null);
    if (msg.joint !== undefined) {
      resolved.joint = msg.joint;
    }
    else {
      resolved.joint = []
    }

    if (msg.expand !== undefined) {
      resolved.expand = msg.expand;
    }
    else {
      resolved.expand = 0.0
    }

    if (msg.follow !== undefined) {
      resolved.follow = msg.follow;
    }
    else {
      resolved.follow = false
    }

    if (msg.trajectory_mode !== undefined) {
      resolved.trajectory_mode = msg.trajectory_mode;
    }
    else {
      resolved.trajectory_mode = 0
    }

    if (msg.radio !== undefined) {
      resolved.radio = msg.radio;
    }
    else {
      resolved.radio = 0
    }

    return resolved;
    }
};

module.exports = JointPosCustom;
