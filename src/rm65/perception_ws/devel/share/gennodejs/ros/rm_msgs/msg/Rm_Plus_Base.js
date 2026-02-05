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

class Rm_Plus_Base {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.manu = null;
      this.type = null;
      this.hv = null;
      this.sv = null;
      this.bv = null;
      this.id = null;
      this.dof = null;
      this.check = null;
      this.bee = null;
      this.force = null;
      this.touch = null;
      this.touch_num = null;
      this.touch_sw = null;
      this.hand = null;
      this.pos_up = null;
      this.pos_low = null;
      this.angle_up = null;
      this.angle_low = null;
      this.speed_up = null;
      this.speed_low = null;
      this.force_up = null;
      this.force_low = null;
    }
    else {
      if (initObj.hasOwnProperty('manu')) {
        this.manu = initObj.manu
      }
      else {
        this.manu = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('hv')) {
        this.hv = initObj.hv
      }
      else {
        this.hv = '';
      }
      if (initObj.hasOwnProperty('sv')) {
        this.sv = initObj.sv
      }
      else {
        this.sv = '';
      }
      if (initObj.hasOwnProperty('bv')) {
        this.bv = initObj.bv
      }
      else {
        this.bv = '';
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('dof')) {
        this.dof = initObj.dof
      }
      else {
        this.dof = 0;
      }
      if (initObj.hasOwnProperty('check')) {
        this.check = initObj.check
      }
      else {
        this.check = 0;
      }
      if (initObj.hasOwnProperty('bee')) {
        this.bee = initObj.bee
      }
      else {
        this.bee = 0;
      }
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = false;
      }
      if (initObj.hasOwnProperty('touch')) {
        this.touch = initObj.touch
      }
      else {
        this.touch = false;
      }
      if (initObj.hasOwnProperty('touch_num')) {
        this.touch_num = initObj.touch_num
      }
      else {
        this.touch_num = 0;
      }
      if (initObj.hasOwnProperty('touch_sw')) {
        this.touch_sw = initObj.touch_sw
      }
      else {
        this.touch_sw = 0;
      }
      if (initObj.hasOwnProperty('hand')) {
        this.hand = initObj.hand
      }
      else {
        this.hand = 0;
      }
      if (initObj.hasOwnProperty('pos_up')) {
        this.pos_up = initObj.pos_up
      }
      else {
        this.pos_up = [];
      }
      if (initObj.hasOwnProperty('pos_low')) {
        this.pos_low = initObj.pos_low
      }
      else {
        this.pos_low = [];
      }
      if (initObj.hasOwnProperty('angle_up')) {
        this.angle_up = initObj.angle_up
      }
      else {
        this.angle_up = [];
      }
      if (initObj.hasOwnProperty('angle_low')) {
        this.angle_low = initObj.angle_low
      }
      else {
        this.angle_low = [];
      }
      if (initObj.hasOwnProperty('speed_up')) {
        this.speed_up = initObj.speed_up
      }
      else {
        this.speed_up = [];
      }
      if (initObj.hasOwnProperty('speed_low')) {
        this.speed_low = initObj.speed_low
      }
      else {
        this.speed_low = [];
      }
      if (initObj.hasOwnProperty('force_up')) {
        this.force_up = initObj.force_up
      }
      else {
        this.force_up = [];
      }
      if (initObj.hasOwnProperty('force_low')) {
        this.force_low = initObj.force_low
      }
      else {
        this.force_low = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Rm_Plus_Base
    // Serialize message field [manu]
    bufferOffset = _serializer.string(obj.manu, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int8(obj.type, buffer, bufferOffset);
    // Serialize message field [hv]
    bufferOffset = _serializer.string(obj.hv, buffer, bufferOffset);
    // Serialize message field [sv]
    bufferOffset = _serializer.string(obj.sv, buffer, bufferOffset);
    // Serialize message field [bv]
    bufferOffset = _serializer.string(obj.bv, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [dof]
    bufferOffset = _serializer.int8(obj.dof, buffer, bufferOffset);
    // Serialize message field [check]
    bufferOffset = _serializer.int8(obj.check, buffer, bufferOffset);
    // Serialize message field [bee]
    bufferOffset = _serializer.int8(obj.bee, buffer, bufferOffset);
    // Serialize message field [force]
    bufferOffset = _serializer.bool(obj.force, buffer, bufferOffset);
    // Serialize message field [touch]
    bufferOffset = _serializer.bool(obj.touch, buffer, bufferOffset);
    // Serialize message field [touch_num]
    bufferOffset = _serializer.int8(obj.touch_num, buffer, bufferOffset);
    // Serialize message field [touch_sw]
    bufferOffset = _serializer.int8(obj.touch_sw, buffer, bufferOffset);
    // Serialize message field [hand]
    bufferOffset = _serializer.int8(obj.hand, buffer, bufferOffset);
    // Serialize message field [pos_up]
    bufferOffset = _arraySerializer.int32(obj.pos_up, buffer, bufferOffset, null);
    // Serialize message field [pos_low]
    bufferOffset = _arraySerializer.int32(obj.pos_low, buffer, bufferOffset, null);
    // Serialize message field [angle_up]
    bufferOffset = _arraySerializer.int32(obj.angle_up, buffer, bufferOffset, null);
    // Serialize message field [angle_low]
    bufferOffset = _arraySerializer.int32(obj.angle_low, buffer, bufferOffset, null);
    // Serialize message field [speed_up]
    bufferOffset = _arraySerializer.int32(obj.speed_up, buffer, bufferOffset, null);
    // Serialize message field [speed_low]
    bufferOffset = _arraySerializer.int32(obj.speed_low, buffer, bufferOffset, null);
    // Serialize message field [force_up]
    bufferOffset = _arraySerializer.int32(obj.force_up, buffer, bufferOffset, null);
    // Serialize message field [force_low]
    bufferOffset = _arraySerializer.int32(obj.force_low, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Rm_Plus_Base
    let len;
    let data = new Rm_Plus_Base(null);
    // Deserialize message field [manu]
    data.manu = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [hv]
    data.hv = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sv]
    data.sv = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [bv]
    data.bv = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dof]
    data.dof = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [check]
    data.check = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [bee]
    data.bee = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [force]
    data.force = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [touch]
    data.touch = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [touch_num]
    data.touch_num = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [touch_sw]
    data.touch_sw = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [hand]
    data.hand = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [pos_up]
    data.pos_up = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [pos_low]
    data.pos_low = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [angle_up]
    data.angle_up = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [angle_low]
    data.angle_low = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [speed_up]
    data.speed_up = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [speed_low]
    data.speed_low = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [force_up]
    data.force_up = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [force_low]
    data.force_low = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.manu);
    length += _getByteLength(object.hv);
    length += _getByteLength(object.sv);
    length += _getByteLength(object.bv);
    length += 4 * object.pos_up.length;
    length += 4 * object.pos_low.length;
    length += 4 * object.angle_up.length;
    length += 4 * object.angle_low.length;
    length += 4 * object.speed_up.length;
    length += 4 * object.speed_low.length;
    length += 4 * object.force_up.length;
    length += 4 * object.force_low.length;
    return length + 61;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rm_msgs/Rm_Plus_Base';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6811b6d3be27919dd94cf28267ef3a90';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string manu              # 设备厂家
    int8 type                # 设备类型 1：两指夹爪 2：五指灵巧手 3：三指夹爪
    string hv                # 硬件版本
    string sv                # 软件版本
    string bv                # boot版本
    int32 id                 # 设备ID
    int8 dof                 # 自由度
    int8 check               # 自检开关
    int8 bee                 # 蜂鸣器开关
    bool force               # 力控支持
    bool touch               # 触觉支持
    int8 touch_num           # 触觉个数
    int8 touch_sw            # 触觉开关
    int8 hand                # 手方向 1 ：左手 2： 右手
    int32[] pos_up           # 位置上限,单位：无量纲
    int32[] pos_low          # 位置下限,单位：无量纲
    int32[] angle_up         # 角度上限,单位：0.01度
    int32[] angle_low        # 角度下限,单位：0.01度
    int32[] speed_up         # 速度上限,单位：无量纲
    int32[] speed_low        # 速度下限,单位：无量纲
    int32[] force_up         # 力上限,单位：0.001N 
    int32[] force_low        # 力下限,单位：0.001N 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Rm_Plus_Base(null);
    if (msg.manu !== undefined) {
      resolved.manu = msg.manu;
    }
    else {
      resolved.manu = ''
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.hv !== undefined) {
      resolved.hv = msg.hv;
    }
    else {
      resolved.hv = ''
    }

    if (msg.sv !== undefined) {
      resolved.sv = msg.sv;
    }
    else {
      resolved.sv = ''
    }

    if (msg.bv !== undefined) {
      resolved.bv = msg.bv;
    }
    else {
      resolved.bv = ''
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.dof !== undefined) {
      resolved.dof = msg.dof;
    }
    else {
      resolved.dof = 0
    }

    if (msg.check !== undefined) {
      resolved.check = msg.check;
    }
    else {
      resolved.check = 0
    }

    if (msg.bee !== undefined) {
      resolved.bee = msg.bee;
    }
    else {
      resolved.bee = 0
    }

    if (msg.force !== undefined) {
      resolved.force = msg.force;
    }
    else {
      resolved.force = false
    }

    if (msg.touch !== undefined) {
      resolved.touch = msg.touch;
    }
    else {
      resolved.touch = false
    }

    if (msg.touch_num !== undefined) {
      resolved.touch_num = msg.touch_num;
    }
    else {
      resolved.touch_num = 0
    }

    if (msg.touch_sw !== undefined) {
      resolved.touch_sw = msg.touch_sw;
    }
    else {
      resolved.touch_sw = 0
    }

    if (msg.hand !== undefined) {
      resolved.hand = msg.hand;
    }
    else {
      resolved.hand = 0
    }

    if (msg.pos_up !== undefined) {
      resolved.pos_up = msg.pos_up;
    }
    else {
      resolved.pos_up = []
    }

    if (msg.pos_low !== undefined) {
      resolved.pos_low = msg.pos_low;
    }
    else {
      resolved.pos_low = []
    }

    if (msg.angle_up !== undefined) {
      resolved.angle_up = msg.angle_up;
    }
    else {
      resolved.angle_up = []
    }

    if (msg.angle_low !== undefined) {
      resolved.angle_low = msg.angle_low;
    }
    else {
      resolved.angle_low = []
    }

    if (msg.speed_up !== undefined) {
      resolved.speed_up = msg.speed_up;
    }
    else {
      resolved.speed_up = []
    }

    if (msg.speed_low !== undefined) {
      resolved.speed_low = msg.speed_low;
    }
    else {
      resolved.speed_low = []
    }

    if (msg.force_up !== undefined) {
      resolved.force_up = msg.force_up;
    }
    else {
      resolved.force_up = []
    }

    if (msg.force_low !== undefined) {
      resolved.force_low = msg.force_low;
    }
    else {
      resolved.force_low = []
    }

    return resolved;
    }
};

module.exports = Rm_Plus_Base;
