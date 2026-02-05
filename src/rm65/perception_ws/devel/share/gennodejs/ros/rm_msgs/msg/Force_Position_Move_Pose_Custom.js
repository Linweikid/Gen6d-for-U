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

class Force_Position_Move_Pose_Custom {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Pose = null;
      this.sensor = null;
      this.mode = null;
      this.dir = null;
      this.force = null;
      this.follow = null;
      this.trajectory_mode = null;
      this.radio = null;
    }
    else {
      if (initObj.hasOwnProperty('Pose')) {
        this.Pose = initObj.Pose
      }
      else {
        this.Pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('sensor')) {
        this.sensor = initObj.sensor
      }
      else {
        this.sensor = 0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('dir')) {
        this.dir = initObj.dir
      }
      else {
        this.dir = 0;
      }
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = 0;
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
    // Serializes a message object of type Force_Position_Move_Pose_Custom
    // Serialize message field [Pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.Pose, buffer, bufferOffset);
    // Serialize message field [sensor]
    bufferOffset = _serializer.uint8(obj.sensor, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.uint8(obj.mode, buffer, bufferOffset);
    // Serialize message field [dir]
    bufferOffset = _serializer.uint8(obj.dir, buffer, bufferOffset);
    // Serialize message field [force]
    bufferOffset = _serializer.int16(obj.force, buffer, bufferOffset);
    // Serialize message field [follow]
    bufferOffset = _serializer.bool(obj.follow, buffer, bufferOffset);
    // Serialize message field [trajectory_mode]
    bufferOffset = _serializer.uint8(obj.trajectory_mode, buffer, bufferOffset);
    // Serialize message field [radio]
    bufferOffset = _serializer.uint8(obj.radio, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Force_Position_Move_Pose_Custom
    let len;
    let data = new Force_Position_Move_Pose_Custom(null);
    // Deserialize message field [Pose]
    data.Pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [sensor]
    data.sensor = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dir]
    data.dir = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [force]
    data.force = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [follow]
    data.follow = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [trajectory_mode]
    data.trajectory_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [radio]
    data.radio = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Force_Position_Move_Pose_Custom';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ba22909657b007c304f2b2ecbe12b041';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose Pose
    uint8 sensor
    uint8 mode
    uint8 dir
    int16 force
    bool follow
    uint8 trajectory_mode
    uint8 radio
    
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
    const resolved = new Force_Position_Move_Pose_Custom(null);
    if (msg.Pose !== undefined) {
      resolved.Pose = geometry_msgs.msg.Pose.Resolve(msg.Pose)
    }
    else {
      resolved.Pose = new geometry_msgs.msg.Pose()
    }

    if (msg.sensor !== undefined) {
      resolved.sensor = msg.sensor;
    }
    else {
      resolved.sensor = 0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.dir !== undefined) {
      resolved.dir = msg.dir;
    }
    else {
      resolved.dir = 0
    }

    if (msg.force !== undefined) {
      resolved.force = msg.force;
    }
    else {
      resolved.force = 0
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

module.exports = Force_Position_Move_Pose_Custom;
