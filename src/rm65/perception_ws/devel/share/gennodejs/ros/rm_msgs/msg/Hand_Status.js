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

class Hand_Status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hand_angle = null;
      this.hand_pos = null;
      this.hand_state = null;
      this.hand_force = null;
      this.hand_err = null;
    }
    else {
      if (initObj.hasOwnProperty('hand_angle')) {
        this.hand_angle = initObj.hand_angle
      }
      else {
        this.hand_angle = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('hand_pos')) {
        this.hand_pos = initObj.hand_pos
      }
      else {
        this.hand_pos = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('hand_state')) {
        this.hand_state = initObj.hand_state
      }
      else {
        this.hand_state = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('hand_force')) {
        this.hand_force = initObj.hand_force
      }
      else {
        this.hand_force = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('hand_err')) {
        this.hand_err = initObj.hand_err
      }
      else {
        this.hand_err = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Hand_Status
    // Check that the constant length array field [hand_angle] has the right length
    if (obj.hand_angle.length !== 6) {
      throw new Error('Unable to serialize array field hand_angle - length must be 6')
    }
    // Serialize message field [hand_angle]
    bufferOffset = _arraySerializer.uint16(obj.hand_angle, buffer, bufferOffset, 6);
    // Check that the constant length array field [hand_pos] has the right length
    if (obj.hand_pos.length !== 6) {
      throw new Error('Unable to serialize array field hand_pos - length must be 6')
    }
    // Serialize message field [hand_pos]
    bufferOffset = _arraySerializer.uint16(obj.hand_pos, buffer, bufferOffset, 6);
    // Check that the constant length array field [hand_state] has the right length
    if (obj.hand_state.length !== 6) {
      throw new Error('Unable to serialize array field hand_state - length must be 6')
    }
    // Serialize message field [hand_state]
    bufferOffset = _arraySerializer.uint16(obj.hand_state, buffer, bufferOffset, 6);
    // Check that the constant length array field [hand_force] has the right length
    if (obj.hand_force.length !== 6) {
      throw new Error('Unable to serialize array field hand_force - length must be 6')
    }
    // Serialize message field [hand_force]
    bufferOffset = _arraySerializer.uint16(obj.hand_force, buffer, bufferOffset, 6);
    // Serialize message field [hand_err]
    bufferOffset = _serializer.uint16(obj.hand_err, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Hand_Status
    let len;
    let data = new Hand_Status(null);
    // Deserialize message field [hand_angle]
    data.hand_angle = _arrayDeserializer.uint16(buffer, bufferOffset, 6)
    // Deserialize message field [hand_pos]
    data.hand_pos = _arrayDeserializer.uint16(buffer, bufferOffset, 6)
    // Deserialize message field [hand_state]
    data.hand_state = _arrayDeserializer.uint16(buffer, bufferOffset, 6)
    // Deserialize message field [hand_force]
    data.hand_force = _arrayDeserializer.uint16(buffer, bufferOffset, 6)
    // Deserialize message field [hand_err]
    data.hand_err = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 50;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Hand_Status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1cce752e69bf0b22631007e9bc8d2458';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #灵巧手上报状态
    
    uint16[6] hand_angle	#手指角度数组，范围：0~2000.
    uint16[6] hand_pos	#手指位置数组，范围：0~1000.
    uint16[6] hand_state	#手指状态,0正在松开，1正在抓取，2位置到位停止，3力到位停止，5电流保护停止，6电缸堵转停止，7电缸故障停止
    uint16[6] hand_force    #灵巧手自由度电流，单位mN
    uint16  hand_err          #灵巧手系统错误，1表示有错误，0表示无错误
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Hand_Status(null);
    if (msg.hand_angle !== undefined) {
      resolved.hand_angle = msg.hand_angle;
    }
    else {
      resolved.hand_angle = new Array(6).fill(0)
    }

    if (msg.hand_pos !== undefined) {
      resolved.hand_pos = msg.hand_pos;
    }
    else {
      resolved.hand_pos = new Array(6).fill(0)
    }

    if (msg.hand_state !== undefined) {
      resolved.hand_state = msg.hand_state;
    }
    else {
      resolved.hand_state = new Array(6).fill(0)
    }

    if (msg.hand_force !== undefined) {
      resolved.hand_force = msg.hand_force;
    }
    else {
      resolved.hand_force = new Array(6).fill(0)
    }

    if (msg.hand_err !== undefined) {
      resolved.hand_err = msg.hand_err;
    }
    else {
      resolved.hand_err = 0
    }

    return resolved;
    }
};

module.exports = Hand_Status;
