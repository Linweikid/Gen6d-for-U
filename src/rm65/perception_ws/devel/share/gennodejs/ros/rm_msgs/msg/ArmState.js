// Auto-generated. Do not edit!

// (in-package rm_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class ArmState {
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
        this.Pose = new geometry_msgs.msg.Pose();
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
    // Serializes a message object of type ArmState
    // Serialize message field [joint]
    bufferOffset = _arraySerializer.float32(obj.joint, buffer, bufferOffset, null);
    // Serialize message field [Pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.Pose, buffer, bufferOffset);
    // Serialize message field [err]
    bufferOffset = _arraySerializer.uint16(obj.err, buffer, bufferOffset, null);
    // Serialize message field [dof]
    bufferOffset = _serializer.uint8(obj.dof, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArmState
    let len;
    let data = new ArmState(null);
    // Deserialize message field [joint]
    data.joint = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [Pose]
    data.Pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
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
    return length + 65;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/ArmState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '60c2297bbfaf329585eba3727e7a0a2e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] joint
    geometry_msgs/Pose Pose
    uint16[] err
    uint8  dof
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArmState(null);
    if (msg.joint !== undefined) {
      resolved.joint = msg.joint;
    }
    else {
      resolved.joint = []
    }

    if (msg.Pose !== undefined) {
      resolved.Pose = geometry_msgs.msg.Pose.Resolve(msg.Pose)
    }
    else {
      resolved.Pose = new geometry_msgs.msg.Pose()
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

module.exports = ArmState;
