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

class Lift_In_Position {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.device = null;
      this.state = null;
      this.trajectory_connect = null;
      this.trajectory_state = null;
    }
    else {
      if (initObj.hasOwnProperty('device')) {
        this.device = initObj.device
      }
      else {
        this.device = 0;
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = '';
      }
      if (initObj.hasOwnProperty('trajectory_connect')) {
        this.trajectory_connect = initObj.trajectory_connect
      }
      else {
        this.trajectory_connect = 0;
      }
      if (initObj.hasOwnProperty('trajectory_state')) {
        this.trajectory_state = initObj.trajectory_state
      }
      else {
        this.trajectory_state = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lift_In_Position
    // Serialize message field [device]
    bufferOffset = _serializer.uint8(obj.device, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = _serializer.string(obj.state, buffer, bufferOffset);
    // Serialize message field [trajectory_connect]
    bufferOffset = _serializer.uint8(obj.trajectory_connect, buffer, bufferOffset);
    // Serialize message field [trajectory_state]
    bufferOffset = _serializer.bool(obj.trajectory_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lift_In_Position
    let len;
    let data = new Lift_In_Position(null);
    // Deserialize message field [device]
    data.device = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [trajectory_connect]
    data.trajectory_connect = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [trajectory_state]
    data.trajectory_state = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.state);
    return length + 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Lift_In_Position';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8560798487e4b58bf325a3d3d0cad027';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 device
    string state
    uint8 trajectory_connect
    bool trajectory_state
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Lift_In_Position(null);
    if (msg.device !== undefined) {
      resolved.device = msg.device;
    }
    else {
      resolved.device = 0
    }

    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = ''
    }

    if (msg.trajectory_connect !== undefined) {
      resolved.trajectory_connect = msg.trajectory_connect;
    }
    else {
      resolved.trajectory_connect = 0
    }

    if (msg.trajectory_state !== undefined) {
      resolved.trajectory_state = msg.trajectory_state;
    }
    else {
      resolved.trajectory_state = false
    }

    return resolved;
    }
};

module.exports = Lift_In_Position;
