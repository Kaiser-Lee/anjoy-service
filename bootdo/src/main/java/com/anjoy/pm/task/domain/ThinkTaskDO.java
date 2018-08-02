package com.anjoy.pm.task.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author lufangbu
 * @email 905632226@163.com
 * @date 2018-08-02 10:01:47
 */
public class ThinkTaskDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer id;
	//
	private String taskPid;
	//
	private String taskName;
	//
	private String taskDesc;
	//
	private String taskLevel;
	//
	private String taskBeg;
	//
	private String taskEnd;
	//0：进行中 1：已完成 3：代码审查 4:代码部署中
	private String taskState;
	//
	private String taskDelay;
	//
	private String taskUdc;
	//
	private String taskDeleted;
	//任务工时
	private String taskHours;
	//
	private String createrId;
	//
	private String createTime;
	//
	private String taskTime;
	//
	private String delayTime;
	//
	private String lableId;
	//
	private String msggroupId;
	//
	private String taskBiFlag;
	//
	private String taskBiFlagType;
	//
	private String tmpImport;
	//1 申请退回
	private String backState;
	//是否pm提单
	private Integer ispm;
	//
	private String filenames;
	//是否需要部署代码
	private Integer isdeploy;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：
	 */
	public void setTaskPid(String taskPid) {
		this.taskPid = taskPid;
	}
	/**
	 * 获取：
	 */
	public String getTaskPid() {
		return taskPid;
	}
	/**
	 * 设置：
	 */
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	/**
	 * 获取：
	 */
	public String getTaskName() {
		return taskName;
	}
	/**
	 * 设置：
	 */
	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}
	/**
	 * 获取：
	 */
	public String getTaskDesc() {
		return taskDesc;
	}
	/**
	 * 设置：
	 */
	public void setTaskLevel(String taskLevel) {
		this.taskLevel = taskLevel;
	}
	/**
	 * 获取：
	 */
	public String getTaskLevel() {
		return taskLevel;
	}
	/**
	 * 设置：
	 */
	public void setTaskBeg(String taskBeg) {
		this.taskBeg = taskBeg;
	}
	/**
	 * 获取：
	 */
	public String getTaskBeg() {
		return taskBeg;
	}
	/**
	 * 设置：
	 */
	public void setTaskEnd(String taskEnd) {
		this.taskEnd = taskEnd;
	}
	/**
	 * 获取：
	 */
	public String getTaskEnd() {
		return taskEnd;
	}
	/**
	 * 设置：0：进行中 1：已完成 3：代码审查 4:代码部署中
	 */
	public void setTaskState(String taskState) {
		this.taskState = taskState;
	}
	/**
	 * 获取：0：进行中 1：已完成 3：代码审查 4:代码部署中
	 */
	public String getTaskState() {
		return taskState;
	}
	/**
	 * 设置：
	 */
	public void setTaskDelay(String taskDelay) {
		this.taskDelay = taskDelay;
	}
	/**
	 * 获取：
	 */
	public String getTaskDelay() {
		return taskDelay;
	}
	/**
	 * 设置：
	 */
	public void setTaskUdc(String taskUdc) {
		this.taskUdc = taskUdc;
	}
	/**
	 * 获取：
	 */
	public String getTaskUdc() {
		return taskUdc;
	}
	/**
	 * 设置：
	 */
	public void setTaskDeleted(String taskDeleted) {
		this.taskDeleted = taskDeleted;
	}
	/**
	 * 获取：
	 */
	public String getTaskDeleted() {
		return taskDeleted;
	}
	/**
	 * 设置：任务工时
	 */
	public void setTaskHours(String taskHours) {
		this.taskHours = taskHours;
	}
	/**
	 * 获取：任务工时
	 */
	public String getTaskHours() {
		return taskHours;
	}
	/**
	 * 设置：
	 */
	public void setCreaterId(String createrId) {
		this.createrId = createrId;
	}
	/**
	 * 获取：
	 */
	public String getCreaterId() {
		return createrId;
	}
	/**
	 * 设置：
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：
	 */
	public String getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：
	 */
	public void setTaskTime(String taskTime) {
		this.taskTime = taskTime;
	}
	/**
	 * 获取：
	 */
	public String getTaskTime() {
		return taskTime;
	}
	/**
	 * 设置：
	 */
	public void setDelayTime(String delayTime) {
		this.delayTime = delayTime;
	}
	/**
	 * 获取：
	 */
	public String getDelayTime() {
		return delayTime;
	}
	/**
	 * 设置：
	 */
	public void setLableId(String lableId) {
		this.lableId = lableId;
	}
	/**
	 * 获取：
	 */
	public String getLableId() {
		return lableId;
	}
	/**
	 * 设置：
	 */
	public void setMsggroupId(String msggroupId) {
		this.msggroupId = msggroupId;
	}
	/**
	 * 获取：
	 */
	public String getMsggroupId() {
		return msggroupId;
	}
	/**
	 * 设置：
	 */
	public void setTaskBiFlag(String taskBiFlag) {
		this.taskBiFlag = taskBiFlag;
	}
	/**
	 * 获取：
	 */
	public String getTaskBiFlag() {
		return taskBiFlag;
	}
	/**
	 * 设置：
	 */
	public void setTaskBiFlagType(String taskBiFlagType) {
		this.taskBiFlagType = taskBiFlagType;
	}
	/**
	 * 获取：
	 */
	public String getTaskBiFlagType() {
		return taskBiFlagType;
	}
	/**
	 * 设置：
	 */
	public void setTmpImport(String tmpImport) {
		this.tmpImport = tmpImport;
	}
	/**
	 * 获取：
	 */
	public String getTmpImport() {
		return tmpImport;
	}
	/**
	 * 设置：1 申请退回
	 */
	public void setBackState(String backState) {
		this.backState = backState;
	}
	/**
	 * 获取：1 申请退回
	 */
	public String getBackState() {
		return backState;
	}
	/**
	 * 设置：是否pm提单
	 */
	public void setIspm(Integer ispm) {
		this.ispm = ispm;
	}
	/**
	 * 获取：是否pm提单
	 */
	public Integer getIspm() {
		return ispm;
	}
	/**
	 * 设置：
	 */
	public void setFilenames(String filenames) {
		this.filenames = filenames;
	}
	/**
	 * 获取：
	 */
	public String getFilenames() {
		return filenames;
	}
	/**
	 * 设置：是否需要部署代码
	 */
	public void setIsdeploy(Integer isdeploy) {
		this.isdeploy = isdeploy;
	}
	/**
	 * 获取：是否需要部署代码
	 */
	public Integer getIsdeploy() {
		return isdeploy;
	}
}
