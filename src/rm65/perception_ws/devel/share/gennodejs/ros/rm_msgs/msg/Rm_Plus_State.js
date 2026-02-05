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

class Rm_Plus_State {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sys_state = null;
      this.sys_err = null;
      this.dof_state = null;
      this.dof_err = null;
      this.pos = null;
      this.speed = null;
      this.angle = null;
      this.current = null;
      this.normal_force = null;
      this.tangential_force = null;
      this.tangential_force_dir = null;
      this.tsa = null;
      this.tma = null;
      this.touch_data = null;
      this.force = null;
    }
    else {
      if (initObj.hasOwnProperty('sys_state')) {
        this.sys_state = initObj.sys_state
      }
      else {
        this.sys_state = 0;
      }
      if (initObj.hasOwnProperty('sys_err')) {
        this.sys_err = initObj.sys_err
      }
      else {
        this.sys_err = 0;
      }
      if (initObj.hasOwnProperty('dof_state')) {
        this.dof_state = initObj.dof_state
      }
      else {
        this.dof_state = [];
      }
      if (initObj.hasOwnProperty('dof_err')) {
        this.dof_err = initObj.dof_err
      }
      else {
        this.dof_err = [];
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = [];
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = [];
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = [];
      }
      if (initObj.hasOwnProperty('current')) {
        this.current = initObj.current
      }
      else {
        this.current = [];
      }
      if (initObj.hasOwnProperty('normal_force')) {
        this.normal_force = initObj.normal_force
      }
      else {
        this.normal_force = [];
      }
      if (initObj.hasOwnProperty('tangential_force')) {
        this.tangential_force = initObj.tangential_force
      }
      else {
        this.tangential_force = [];
      }
      if (initObj.hasOwnProperty('tangential_force_dir')) {
        this.tangential_force_dir = initObj.tangential_force_dir
      }
      else {
        this.tangential_force_dir = [];
      }
      if (initObj.hasOwnProperty('tsa')) {
        this.tsa = initObj.tsa
      }
      else {
        this.tsa = [];
      }
      if (initObj.hasOwnProperty('tma')) {
        this.tma = initObj.tma
      }
      else {
        this.tma = [];
      }
      if (initObj.hasOwnProperty('touch_data')) {
        this.touch_data = initObj.touch_data
      }
      else {
        this.touch_data = [];
      }
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Rm_Plus_State
    // Serialize message field [sys_state]
    bufferOffset = _serializer.int32(obj.sys_state, buffer, bufferOffset);
    // Serialize message field [sys_err]
    bufferOffset = _serializer.int32(obj.sys_err, buffer, bufferOffset);
    // Serialize message field [dof_state]
    bufferOffset = _arraySerializer.int32(obj.dof_state, buffer, bufferOffset, null);
    // Serialize message field [dof_err]
    bufferOffset = _arraySerializer.int32(obj.dof_err, buffer, bufferOffset, null);
    // Serialize message field [pos]
    bufferOffset = _arraySerializer.int32(obj.pos, buffer, bufferOffset, null);
    // Serialize message field [speed]
    bufferOffset = _arraySerializer.int32(obj.speed, buffer, bufferOffset, null);
    // Serialize message field [angle]
    bufferOffset = _arraySerializer.int32(obj.angle, buffer, bufferOffset, null);
    // Serialize message field [current]
    bufferOffset = _arraySerializer.int32(obj.current, buffer, bufferOffset, null);
    // Serialize message field [normal_force]
    bufferOffset = _arraySerializer.int32(obj.normal_force, buffer, bufferOffset, null);
    // Serialize message field [tangential_force]
    bufferOffset = _arraySerializer.int32(obj.tangential_force, buffer, bufferOffset, null);
    // Serialize message field [tangential_force_dir]
    bufferOffset = _arraySerializer.int32(obj.tangential_force_dir, buffer, bufferOffset, null);
    // Serialize message field [tsa]
    bufferOffset = _arraySerializer.uint32(obj.tsa, buffer, bufferOffset, null);
    // Serialize message field [tma]
    bufferOffset = _arraySerializer.uint32(obj.tma, buffer, bufferOffset, null);
    // Serialize message field [touch_data]
    bufferOffset = _arraySerializer.int32(obj.touch_data, buffer, bufferOffset, null);
    // Serialize message field [force]
    bufferOffset = _arraySerializer.int32(obj.force, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Rm_Plus_State
    let len;
    let data = new Rm_Plus_State(null);
    // Deserialize message field [sys_state]
    data.sys_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sys_err]
    data.sys_err = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dof_state]
    data.dof_state = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [dof_err]
    data.dof_err = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [pos]
    data.pos = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [speed]
    data.speed = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [angle]
    data.angle = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [current]
    data.current = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [normal_force]
    data.normal_force = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [tangential_force]
    data.tangential_force = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [tangential_force_dir]
    data.tangential_force_dir = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [tsa]
    data.tsa = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [tma]
    data.tma = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [touch_data]
    data.touch_data = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [force]
    data.force = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.dof_state.length;
    length += 4 * object.dof_err.length;
    length += 4 * object.pos.length;
    length += 4 * object.speed.length;
    length += 4 * object.angle.length;
    length += 4 * object.current.length;
    length += 4 * object.normal_force.length;
    length += 4 * object.tangential_force.length;
    length += 4 * object.tangential_force_dir.length;
    length += 4 * object.tsa.length;
    length += 4 * object.tma.length;
    length += 4 * object.touch_data.length;
    length += 4 * object.force.length;
    return length + 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Rm_Plus_State';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'decaf5adc4942742a6b89965c207ee54';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 sys_state                 #系统状态
    int32 sys_err                   #系统错误
    int32[] dof_state               #各自由度当前状态
    int32[] dof_err                 #各自由度错误信息
    int32[] pos                     #各自由度当前位置
    int32[] speed                   #各自由度当前速度
    int32[] angle                   #各自由度当前角度
    int32[] current                 #各自由度当前电流
    int32[] normal_force            #自由度触觉三维力的法向力
    int32[] tangential_force        #自由度触觉三维力的切向力
    int32[] tangential_force_dir    #自由度触觉三维力的切向力方向
    uint32[] tsa                    #自由度触觉自接近
    uint32[] tma                    #自由度触觉互接近
    int32[] touch_data              #触觉传感器原始数据
    int32[] force                   #自由度力矩
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Rm_Plus_State(null);
    if (msg.sys_state !== undefined) {
      resolved.sys_state = msg.sys_state;
    }
    else {
      resolved.sys_state = 0
    }

    if (msg.sys_err !== undefined) {
      resolved.sys_err = msg.sys_err;
    }
    else {
      resolved.sys_err = 0
    }

    if (msg.dof_state !== undefined) {
      resolved.dof_state = msg.dof_state;
    }
    else {
      resolved.dof_state = []
    }

    if (msg.dof_err !== undefined) {
      resolved.dof_err = msg.dof_err;
    }
    else {
      resolved.dof_err = []
    }

    if (msg.pos !== undefined) {
      resolved.pos = msg.pos;
    }
    else {
      resolved.pos = []
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = []
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = []
    }

    if (msg.current !== undefined) {
      resolved.current = msg.current;
    }
    else {
      resolved.current = []
    }

    if (msg.normal_force !== undefined) {
      resolved.normal_force = msg.normal_force;
    }
    else {
      resolved.normal_force = []
    }

    if (msg.tangential_force !== undefined) {
      resolved.tangential_force = msg.tangential_force;
    }
    else {
      resolved.tangential_force = []
    }

    if (msg.tangential_force_dir !== undefined) {
      resolved.tangential_force_dir = msg.tangential_force_dir;
    }
    else {
      resolved.tangential_force_dir = []
    }

    if (msg.tsa !== undefined) {
      resolved.tsa = msg.tsa;
    }
    else {
      resolved.tsa = []
    }

    if (msg.tma !== undefined) {
      resolved.tma = msg.tma;
    }
    else {
      resolved.tma = []
    }

    if (msg.touch_data !== undefined) {
      resolved.touch_data = msg.touch_data;
    }
    else {
      resolved.touch_data = []
    }

    if (msg.force !== undefined) {
      resolved.force = msg.force;
    }
    else {
      resolved.force = []
    }

    return resolved;
    }
};

module.exports = Rm_Plus_State;
