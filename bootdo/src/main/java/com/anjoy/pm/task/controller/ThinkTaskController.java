package com.anjoy.pm.task.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anjoy.pm.message.service.MessageService;
import com.anjoy.pm.task.domain.ThinkTaskDO;
import com.anjoy.pm.task.service.ThinkTaskService;
import com.anjoy.pm.taskUser.domain.ThinkTaskUserDO;
import com.anjoy.pm.taskUser.service.ThinkTaskUserService;
import com.base.common.controller.BaseController;
import com.base.common.utils.PageUtils;
import com.base.common.utils.Query;
import com.base.common.utils.R;
import com.base.system.domain.UserDO;
import com.base.system.service.UserService;

/**
 * 
 * 
 * @author lufangbu
 * @email 905632226@163.com
 * @date 2018-08-02 10:01:47
 */
 
@Controller
@RequestMapping("/pm/thinkTask")
public class ThinkTaskController extends BaseController{
	
	@Autowired
	private ThinkTaskService thinkTaskService;
	
	@Autowired
	private ThinkTaskUserService thinkTaskUserService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MessageService messageService;
	
	
	@GetMapping()
	@RequiresPermissions("pm:thinkTask:thinkTask")
	String ThinkTask(){
	    return "anjoy/pm/thinkTask/thinkTask";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("pm:thinkTask:thinkTask")
	public List list(@RequestParam Map<String, Object> params){
		//查询列表数据
		params.put("taskState", "0");
		params.put("taskUserId", this.getUserId());
       /* Query query = new Query(params);
		List<ThinkTaskDO> thinkTaskList = thinkTaskService.list(query);
		int total = thinkTaskService.count(query);
		PageUtils pageUtils = new PageUtils(thinkTaskList, total);*/
		//Query query = new Query(params);
		List thinkTaskList = thinkTaskService.list(params);
		//int total = thinkTaskService.count(query);
		//PageUtils pageUtils = new PageUtils(thinkTaskList, total);
		return thinkTaskList;
	}
	
	@GetMapping("/add")
	@RequiresPermissions("pm:thinkTask:add")
	String add(){
	    return "anjoy/pm/thinkTask/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("pm:thinkTask:edit")
	String edit(@PathVariable("id") Integer id,Model model){
		ThinkTaskDO thinkTask = thinkTaskService.get(id);
		model.addAttribute("thinkTask", thinkTask);
	    return "anjoy/pm/thinkTask/edit";
	}
	
	@GetMapping("/detail/{id}")
	String detail(@PathVariable("id") Integer id,Model model){
		ThinkTaskDO thinkTask = thinkTaskService.get(id);
		model.addAttribute("thinkTask", thinkTask);
		UserDO creUser = userService.get(Long.valueOf(thinkTask.getCreaterId()));//任务创建者
		model.addAttribute("creUser", creUser);
	    return "anjoy/pm/thinkTask/detail";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("pm:thinkTask:add")
	public R save( ThinkTaskDO thinkTask, ThinkTaskUserDO user){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		thinkTask.setCreaterId(this.getUserId().toString());
		thinkTask.setCreateTime(format.format(new Date()));
		thinkTask.setTaskState("0");
		thinkTask.setTaskDeleted("否");
		thinkTask.setIsdeploy(0);//是否需要部署代码
		thinkTask.setIspm(0);
		if(thinkTaskService.save(thinkTask)>0){
			thinkTaskService.get(thinkTask.getId());
			user.setTaskId(thinkTask.getId().toString());
			user.setDeleted("否");
			user.setUpdataDate(format.format(new Date()));
			if(thinkTaskUserService.save(user)>0) {
				
				//邮箱通知
				messageService.sendEmail(this.getUser().getName(),
						userService.get(Long.valueOf(user.getUserId())).getName(),
						format.format(new Date()),
						thinkTask.getTaskName(),
						userService.get(Long.valueOf(user.getUserId())).getEmail());
				
				//阿里云短信通知
				messageService.sendMessages(userService.get(Long.valueOf(user.getUserId())).getName(), 
						this.getUser().getName(),thinkTask.getTaskName());
				
				return R.ok();
			}
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("pm:thinkTask:edit")
	public R update( ThinkTaskDO thinkTask){
		thinkTaskService.update(thinkTask);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("pm:thinkTask:remove")
	public R remove( Integer id){
		if(thinkTaskService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("pm:thinkTask:batchRemove")
	public R remove(@RequestParam("ids[]") Integer[] ids){
		thinkTaskService.batchRemove(ids);
		return R.ok();
	}
	
	@GetMapping("/findExecutor")
	String findExecutor() {
		return "anjoy/pm/thinkTask/executor";
	}
	
	@ResponseBody
	@GetMapping("/getTaskSupList")
	public List getTaskSupList(@RequestParam Map<String, Object> params){
		//查询列表数据
       /* Query query = new Query(params);
		List<ThinkTaskDO> thinkTaskList = thinkTaskService.list(query);
		int total = thinkTaskService.count(query);
		PageUtils pageUtils = new PageUtils(thinkTaskList, total);*/
		//Query query = new Query(params);
		params.put("taskDeleted", "否");
		List thinkTaskList = thinkTaskService.list(params);
		//int total = thinkTaskService.count(query);
		//PageUtils pageUtils = new PageUtils(thinkTaskList, total);
		return thinkTaskList;
	}
	
	/**
	 * 结束任务
	 */
	@ResponseBody
	@RequestMapping("/endTask")
	public R endTask( ThinkTaskDO thinkTask){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		thinkTask.setTaskTime(format.format(new Date()));
		thinkTaskService.update(thinkTask);
		return R.ok();
	}
	
	@ResponseBody
	@GetMapping("/completed")
	public PageUtils completed(@RequestParam Map<String, Object> params){
		//查询列表数据
		params.put("taskUserId", this.getUserId());
		Query query = new Query(params);
		List<ThinkTaskDO> thinkTaskList = thinkTaskService.list(query);
		int total = thinkTaskService.count(query);
		PageUtils pageUtils = new PageUtils(thinkTaskList, total);
		return pageUtils;
	}
	
	@GetMapping("/toCompleted")
	String toCompleted() {
		return "anjoy/pm/thinkTask/completed";
	}
	
}