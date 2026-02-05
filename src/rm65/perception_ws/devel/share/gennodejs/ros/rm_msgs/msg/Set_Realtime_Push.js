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

class Set_Realtime_Push {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cycle = null;
      this.port = null;
      this.force_coordinate = null;
      this.ip = null;
      this.aloha_state_enable = null;
      this.arm_current_status_enable = null;
      this.expand_state_enable = null;
      this.hand_enable = null;
      this.joint_acc_enable = null;
      this.joint_speed_enable = null;
      this.lift_state_enable = null;
      this.tail_end_enable = null;
      this.rm_plus_base_enable = null;
      this.rm_plus_state_enable = null;
    }
    else {
      if (initObj.hasOwnProperty('cycle')) {
        this.cycle = initObj.cycle
      }
      else {
        this.cycle = 0;
      }
      if (initObj.hasOwnProperty('port')) {
        this.port = initObj.port
      }
      else {
        this.port = 0;
      }
      if (initObj.hasOwnProperty('force_coordinate')) {
        this.force_coordinate = initObj.force_coordinate
      }
      else {
        this.force_coordinate = 0;
      }
      if (initObj.hasOwnProperty('ip')) {
        this.ip = initObj.ip
      }
      else {
        this.ip = '';
      }
      if (initObj.hasOwnProperty('aloha_state_enable')) {
        this.aloha_state_enable = initObj.aloha_state_enable
      }
      else {
        this.aloha_state_enable = false;
      }
      if (initObj.hasOwnProperty('arm_current_status_enable')) {
        this.arm_current_status_enable = initObj.arm_current_status_enable
      }
      else {
        this.arm_current_status_enable = false;
      }
      if (initObj.hasOwnProperty('expand_state_enable')) {
        this.expand_state_enable = initObj.expand_state_enable
      }
      else {
        this.expand_state_enable = false;
      }
      if (initObj.hasOwnProperty('hand_enable')) {
        this.hand_enable = initObj.hand_enable
      }
      else {
        this.hand_enable = false;
      }
      if (initObj.hasOwnProperty('joint_acc_enable')) {
        this.joint_acc_enable = initObj.joint_acc_enable
      }
      else {
        this.joint_acc_enable = false;
      }
      if (initObj.hasOwnProperty('joint_speed_enable')) {
        this.joint_speed_enable = initObj.joint_speed_enable
      }
      else {
        this.joint_speed_enable = false;
      }
      if (initObj.hasOwnProperty('lift_state_enable')) {
        this.lift_state_enable = initObj.lift_state_enable
      }
      else {
        this.lift_state_enable = false;
      }
      if (initObj.hasOwnProperty('tail_end_enable')) {
        this.tail_end_enable = initObj.tail_end_enable
      }
      else {
        this.tail_end_enable = false;
      }
      if (initObj.hasOwnProperty('rm_plus_base_enable')) {
        this.rm_plus_base_enable = initObj.rm_plus_base_enable
      }
      else {
        this.rm_plus_base_enable = false;
      }
      if (initObj.hasOwnProperty('rm_plus_state_enable')) {
        this.rm_plus_state_enable = initObj.rm_plus_state_enable
      }
      else {
        this.rm_plus_state_enable = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Set_Realtime_Push
    // Serialize message field [cycle]
    bufferOffset = _serializer.uint16(obj.cycle, buffer, bufferOffset);
    // Serialize message field [port]
    bufferOffset = _serializer.uint16(obj.port, buffer, bufferOffset);
    // Serialize message field [force_coordinate]
    bufferOffset = _serializer.uint16(obj.force_coordinate, buffer, bufferOffset);
    // Serialize message field [ip]
    bufferOffset = _serializer.string(obj.ip, buffer, bufferOffset);
    // Serialize message field [aloha_state_enable]
    bufferOffset = _serializer.bool(obj.aloha_state_enable, buffer, bufferOffset);
    // Serialize message field [arm_current_status_enable]
    bufferOffset = _serializer.bool(obj.arm_current_status_enable, buffer, bufferOffset);
    // Serialize message field [expand_state_enable]
    bufferOffset = _serializer.bool(obj.expand_state_enable, buffer, bufferOffset);
    // Serialize message field [hand_enable]
    bufferOffset = _serializer.bool(obj.hand_enable, buffer, bufferOffset);
    // Serialize message field [joint_acc_enable]
    bufferOffset = _serializer.bool(obj.joint_acc_enable, buffer, bufferOffset);
    // Serialize message field [joint_speed_enable]
    bufferOffset = _serializer.bool(obj.joint_speed_enable, buffer, bufferOffset);
    // Serialize message field [lift_state_enable]
    bufferOffset = _serializer.bool(obj.lift_state_enable, buffer, bufferOffset);
    // Serialize message field [tail_end_enable]
    bufferOffset = _serializer.bool(obj.tail_end_enable, buffer, bufferOffset);
    // Serialize message field [rm_plus_base_enable]
    bufferOffset = _serializer.bool(obj.rm_plus_base_enable, buffer, bufferOffset);
    // Serialize message field [rm_plus_state_enable]
    bufferOffset = _serializer.bool(obj.rm_plus_state_enable, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Realtime_Push
    let len;
    let data = new Set_Realtime_Push(null);
    // Deserialize message field [cycle]
    data.cycle = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [port]
    data.port = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [force_coordinate]
    data.force_coordinate = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [ip]
    data.ip = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [aloha_state_enable]
    data.aloha_state_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [arm_current_status_enable]
    data.arm_current_status_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [expand_state_enable]
    data.expand_state_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [hand_enable]
    data.hand_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [joint_acc_enable]
    data.joint_acc_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [joint_speed_enable]
    data.joint_speed_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [lift_state_enable]
    data.lift_state_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [tail_end_enable]
    data.tail_end_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [rm_plus_base_enable]
    data.rm_plus_base_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [rm_plus_state_enable]
    data.rm_plus_state_enable = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.ip);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Set_Realtime_Push';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '29a80623aa411fb9cc6b96b119e8d448';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 cycle
    uint16 port
    uint16 force_coordinate
    string ip
    bool aloha_state_enable
    bool arm_current_status_enable
    bool expand_state_enable
    bool hand_enable
    bool joint_acc_enable
    bool joint_speed_enable
    bool lift_state_enable
    bool tail_end_enable
    bool rm_plus_base_enable
    bool rm_plus_state_enable
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Set_Realtime_Push(null);
    if (msg.cycle !== undefined) {
      resolved.cycle = msg.cycle;
    }
    else {
      resolved.cycle = 0
    }

    if (msg.port !== undefined) {
      resolved.port = msg.port;
    }
    else {
      resolved.port = 0
    }

    if (msg.force_coordinate !== undefined) {
      resolved.force_coordinate = msg.force_coordinate;
    }
    else {
      resolved.force_coordinate = 0
    }

    if (msg.ip !== undefined) {
      resolved.ip = msg.ip;
    }
    else {
      resolved.ip = ''
    }

    if (msg.aloha_state_enable !== undefined) {
      resolved.aloha_state_enable = msg.aloha_state_enable;
    }
    else {
      resolved.aloha_state_enable = false
    }

    if (msg.arm_current_status_enable !== undefined) {
      resolved.arm_current_status_enable = msg.arm_current_status_enable;
    }
    else {
      resolved.arm_current_status_enable = false
    }

    if (msg.expand_state_enable !== undefined) {
      resolved.expand_state_enable = msg.expand_state_enable;
    }
    else {
      resolved.expand_state_enable = false
    }

    if (msg.hand_enable !== undefined) {
      resolved.hand_enable = msg.hand_enable;
    }
    else {
      resolved.hand_enable = false
    }

    if (msg.joint_acc_enable !== undefined) {
      resolved.joint_acc_enable = msg.joint_acc_enable;
    }
    else {
      resolved.joint_acc_enable = false
    }

    if (msg.joint_speed_enable !== undefined) {
      resolved.joint_speed_enable = msg.joint_speed_enable;
    }
    else {
      resolved.joint_speed_enable = false
    }

    if (msg.lift_state_enable !== undefined) {
      resolved.lift_state_enable = msg.lift_state_enable;
    }
    else {
      resolved.lift_state_enable = false
    }

    if (msg.tail_end_enable !== undefined) {
      resolved.tail_end_enable = msg.tail_end_enable;
    }
    else {
      resolved.tail_end_enable = false
    }

    if (msg.rm_plus_base_enable !== undefined) {
      resolved.rm_plus_base_enable = msg.rm_plus_base_enable;
    }
    else {
      resolved.rm_plus_base_enable = false
    }

    if (msg.rm_plus_state_enable !== undefined) {
      resolved.rm_plus_state_enable = msg.rm_plus_state_enable;
    }
    else {
      resolved.rm_plus_state_enable = false
    }

    return resolved;
    }
};

module.exports = Set_Realtime_Push;
