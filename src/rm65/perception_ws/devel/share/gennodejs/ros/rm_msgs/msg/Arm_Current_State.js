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

class Arm_Current_State {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint = null;
      this.Pose = null;
      this.err = null;
      this.dof = null;
    }
    else {
      if (initObj.hasOwnProperty('joint')) {
        this.joint = initObj.joint
      }
      else {
        this.joint = [];
      }
      if (initObj.hasOwnProperty('Pose')) {
        this.Pose = initObj.Pose
      }
      else {
        this.Pose = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('err')) {
        this.err = initObj.err
      }
      else {
        this.err = [];
      }
      if (initObj.hasOwnProperty('dof')) {
        this.dof = initObj.dof
      }
      else {
        this.dof = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Arm_Current_State
    // Serialize message field [joint]
    bufferOffset = _arraySerializer.float32(obj.joint, buffer, bufferOffset, null);
    // Check that the constant length array field [Pose] has the right length
    if (obj.Pose.length !== 6) {
      throw new Error('Unable to serialize array field Pose - length must be 6')
    }
    // Serialize message field [Pose]
    bufferOffset = _arraySerializer.float32(obj.Pose, buffer, bufferOffset, 6);
    // Serialize message field [err]
    bufferOffset = _arraySerializer.uint16(obj.err, buffer, bufferOffset, null);
    // Serialize message field [dof]
    bufferOffset = _serializer.uint8(obj.dof, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Arm_Current_State
    let len;
    let data = new Arm_Current_State(null);
    // Deserialize message field [joint]
    data.joint = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [Pose]
    data.Pose = _arrayDeserializer.float32(buffer, bufferOffset, 6)
    // Deserialize message field [err]
    data.err = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [dof]
    data.dof = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.joint.length;
    length += 2 * object.err.length;
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Arm_Current_State';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4c96583b56d85a30b9b36f7638260f04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] joint
    float32[6] Pose
    uint16[] err
    uint8 dof
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Arm_Current_State(null);
    if (msg.joint !== undefined) {
      resolved.joint = msg.joint;
    }
    else {
      resolved.joint = []
    }

    if (msg.Pose !== undefined) {
      resolved.Pose = msg.Pose;
    }
    else {
      resolved.Pose = new Array(6).fill(0)
    }

    if (msg.err !== undefined) {
      resolved.err = msg.err;
    }
    else {
      resolved.err = []
    }

    if (msg.dof !== undefined) {
      resolved.dof = msg.dof;
    }
    else {
      resolved.dof = 0
    }

    return resolved;
    }
};

module.exports = Arm_Current_State;
