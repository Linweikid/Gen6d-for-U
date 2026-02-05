# 操作流程
## 1、工作环境
### UR笔记本`wym`，环境已配好，不要修改
### 双卡3090 `wym_Rm65_Assembly`，环境已配好，不要修改
如果要修改，自己克隆我的环境后，在自己的环境里面修改
## 2、测试U_pose(U型管位姿)和H_pose（插孔位姿）发布（后面这里由林玮琛的代码做发布）
这里发布的是固定位姿，提前写好的U_pose和H_pose（都是同一个位置）
` cd perception_ws `
`source ./devel/setup.bash`
### （如果有问题，删掉 build 和 devel 文件夹重新 catkin_make）
`rosrun pose_estimation_pkg pose_estimation_pub`
## 3、运行FSM
运行`task_fsm.py`即可
`task_fsm.py`包括：
`fsm = TaskFSM(robot=robot, task_loop=2)，执行两次工作循环`
###
    状态机中的所有状态：
        IDLE            开始，读取u和h位姿
        MOVE_GRASP      机器人移动并进行抓取（调用 Dexhand_grasping）
        CHECK_TF        查看抓取到的U型管和机械臂末端的相对TF坐标变换（目前没开）
        MOVE_INSERT     移动到插孔预位姿并进行插孔（调用 Dexhand_insert）
        RETRACT         回撤到安全位，判断是否彻底完成任务：没有完成回到IDLE，彻底完成去到END
        END             当前工件流程彻底完成
###
