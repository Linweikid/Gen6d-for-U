
"use strict";

let ArmState = require('./ArmState.js');
let Arm_Analog_Output = require('./Arm_Analog_Output.js');
let Arm_Current_State = require('./Arm_Current_State.js');
let Arm_Current_Status = require('./Arm_Current_Status.js');
let Arm_Digital_Output = require('./Arm_Digital_Output.js');
let Arm_IO_State = require('./Arm_IO_State.js');
let Arm_Joint_Speed_Max = require('./Arm_Joint_Speed_Max.js');
let Arm_Software_Version = require('./Arm_Software_Version.js');
let Cabinet = require('./Cabinet.js');
let CartePos = require('./CartePos.js');
let CartePosCustom = require('./CartePosCustom.js');
let ChangeTool_Name = require('./ChangeTool_Name.js');
let ChangeTool_State = require('./ChangeTool_State.js');
let ChangeWorkFrame_Name = require('./ChangeWorkFrame_Name.js');
let ChangeWorkFrame_State = require('./ChangeWorkFrame_State.js');
let Err = require('./Err.js');
let Force_Position_Move_Pose = require('./Force_Position_Move_Pose.js');
let Force_Position_Move_Pose_Custom = require('./Force_Position_Move_Pose_Custom.js');
let Force_Position_State = require('./Force_Position_State.js');
let GetArmState_Command = require('./GetArmState_Command.js');
let Gripper_Pick = require('./Gripper_Pick.js');
let Gripper_Set = require('./Gripper_Set.js');
let Hand_Angle = require('./Hand_Angle.js');
let Hand_Force = require('./Hand_Force.js');
let Hand_Posture = require('./Hand_Posture.js');
let Hand_Seq = require('./Hand_Seq.js');
let Hand_Speed = require('./Hand_Speed.js');
let Hand_Status = require('./Hand_Status.js');
let IO_Update = require('./IO_Update.js');
let JointPos = require('./JointPos.js');
let JointPosCustom = require('./JointPosCustom.js');
let Joint_Current = require('./Joint_Current.js');
let Joint_En_Flag = require('./Joint_En_Flag.js');
let Joint_Error_Code = require('./Joint_Error_Code.js');
let Joint_Max_Speed = require('./Joint_Max_Speed.js');
let Joint_PoseEuler = require('./Joint_PoseEuler.js');
let Joint_Speed = require('./Joint_Speed.js');
let Joint_Step = require('./Joint_Step.js');
let Joint_Teach = require('./Joint_Teach.js');
let Joint_Temperature = require('./Joint_Temperature.js');
let Joint_Voltage = require('./Joint_Voltage.js');
let LiftState = require('./LiftState.js');
let Lift_Height = require('./Lift_Height.js');
let Lift_In_Position = require('./Lift_In_Position.js');
let Lift_Speed = require('./Lift_Speed.js');
let Manual_Set_Force_Pose = require('./Manual_Set_Force_Pose.js');
let MoveC = require('./MoveC.js');
let MoveJ = require('./MoveJ.js');
let MoveJ_P = require('./MoveJ_P.js');
let Ort_Teach = require('./Ort_Teach.js');
let Plan_State = require('./Plan_State.js');
let Pos_Teach = require('./Pos_Teach.js');
let Read_Register = require('./Read_Register.js');
let Register_Data = require('./Register_Data.js');
let Rm_Plus_Base = require('./Rm_Plus_Base.js');
let Rm_Plus_State = require('./Rm_Plus_State.js');
let RS485_Mode = require('./RS485_Mode.js');
let Servo_GetAngle = require('./Servo_GetAngle.js');
let Servo_Move = require('./Servo_Move.js');
let Set_Force_Position = require('./Set_Force_Position.js');
let Set_Modbus_Mode = require('./Set_Modbus_Mode.js');
let Set_Realtime_Push = require('./Set_Realtime_Push.js');
let Six_Force = require('./Six_Force.js');
let Socket_Command = require('./Socket_Command.js');
let Start_Multi_Drag_Teach = require('./Start_Multi_Drag_Teach.js');
let Stop = require('./Stop.js');
let Stop_Teach = require('./Stop_Teach.js');
let Tool_Analog_Output = require('./Tool_Analog_Output.js');
let Tool_Digital_Output = require('./Tool_Digital_Output.js');
let Tool_IO_State = require('./Tool_IO_State.js');
let Turtle_Driver = require('./Turtle_Driver.js');
let Write_Register = require('./Write_Register.js');
let Force_Position_Move_Joint = require('./Force_Position_Move_Joint.js');
let Joint_Enable = require('./Joint_Enable.js');
let MoveL = require('./MoveL.js');

module.exports = {
  ArmState: ArmState,
  Arm_Analog_Output: Arm_Analog_Output,
  Arm_Current_State: Arm_Current_State,
  Arm_Current_Status: Arm_Current_Status,
  Arm_Digital_Output: Arm_Digital_Output,
  Arm_IO_State: Arm_IO_State,
  Arm_Joint_Speed_Max: Arm_Joint_Speed_Max,
  Arm_Software_Version: Arm_Software_Version,
  Cabinet: Cabinet,
  CartePos: CartePos,
  CartePosCustom: CartePosCustom,
  ChangeTool_Name: ChangeTool_Name,
  ChangeTool_State: ChangeTool_State,
  ChangeWorkFrame_Name: ChangeWorkFrame_Name,
  ChangeWorkFrame_State: ChangeWorkFrame_State,
  Err: Err,
  Force_Position_Move_Pose: Force_Position_Move_Pose,
  Force_Position_Move_Pose_Custom: Force_Position_Move_Pose_Custom,
  Force_Position_State: Force_Position_State,
  GetArmState_Command: GetArmState_Command,
  Gripper_Pick: Gripper_Pick,
  Gripper_Set: Gripper_Set,
  Hand_Angle: Hand_Angle,
  Hand_Force: Hand_Force,
  Hand_Posture: Hand_Posture,
  Hand_Seq: Hand_Seq,
  Hand_Speed: Hand_Speed,
  Hand_Status: Hand_Status,
  IO_Update: IO_Update,
  JointPos: JointPos,
  JointPosCustom: JointPosCustom,
  Joint_Current: Joint_Current,
  Joint_En_Flag: Joint_En_Flag,
  Joint_Error_Code: Joint_Error_Code,
  Joint_Max_Speed: Joint_Max_Speed,
  Joint_PoseEuler: Joint_PoseEuler,
  Joint_Speed: Joint_Speed,
  Joint_Step: Joint_Step,
  Joint_Teach: Joint_Teach,
  Joint_Temperature: Joint_Temperature,
  Joint_Voltage: Joint_Voltage,
  LiftState: LiftState,
  Lift_Height: Lift_Height,
  Lift_In_Position: Lift_In_Position,
  Lift_Speed: Lift_Speed,
  Manual_Set_Force_Pose: Manual_Set_Force_Pose,
  MoveC: MoveC,
  MoveJ: MoveJ,
  MoveJ_P: MoveJ_P,
  Ort_Teach: Ort_Teach,
  Plan_State: Plan_State,
  Pos_Teach: Pos_Teach,
  Read_Register: Read_Register,
  Register_Data: Register_Data,
  Rm_Plus_Base: Rm_Plus_Base,
  Rm_Plus_State: Rm_Plus_State,
  RS485_Mode: RS485_Mode,
  Servo_GetAngle: Servo_GetAngle,
  Servo_Move: Servo_Move,
  Set_Force_Position: Set_Force_Position,
  Set_Modbus_Mode: Set_Modbus_Mode,
  Set_Realtime_Push: Set_Realtime_Push,
  Six_Force: Six_Force,
  Socket_Command: Socket_Command,
  Start_Multi_Drag_Teach: Start_Multi_Drag_Teach,
  Stop: Stop,
  Stop_Teach: Stop_Teach,
  Tool_Analog_Output: Tool_Analog_Output,
  Tool_Digital_Output: Tool_Digital_Output,
  Tool_IO_State: Tool_IO_State,
  Turtle_Driver: Turtle_Driver,
  Write_Register: Write_Register,
  Force_Position_Move_Joint: Force_Position_Move_Joint,
  Joint_Enable: Joint_Enable,
  MoveL: MoveL,
};
