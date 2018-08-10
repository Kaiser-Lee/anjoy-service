package com.anjoy.pm.task.service;

import com.anjoy.pm.task.domain.ThinkTaskDO;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author lufangbu
 * @email 905632226@163.com
 * @date 2018-08-02 10:01:47
 */
public interface ThinkTaskService {
	
	ThinkTaskDO get(Integer id);
	
	List<ThinkTaskDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(ThinkTaskDO thinkTask);
	
	int update(ThinkTaskDO thinkTask);
	
	int remove(Integer id);
	
	int batchRemove(Integer[] ids);
}
