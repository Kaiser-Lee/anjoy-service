package com.anjoy.pm.task.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.anjoy.pm.task.dao.ThinkTaskDao;
import com.anjoy.pm.task.domain.ThinkTaskDO;
import com.anjoy.pm.task.service.ThinkTaskService;



@Service
public class ThinkTaskServiceImpl implements ThinkTaskService {
	@Autowired
	private ThinkTaskDao thinkTaskDao;
	
	@Override
	public ThinkTaskDO get(Integer id){
		return thinkTaskDao.get(id);
	}
	
	@Override
	public List<ThinkTaskDO> list(Map<String, Object> map){
		return thinkTaskDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return thinkTaskDao.count(map);
	}
	
	@Override
	public int save(ThinkTaskDO thinkTask){
		return thinkTaskDao.save(thinkTask);
	}
	
	@Override
	public int update(ThinkTaskDO thinkTask){
		return thinkTaskDao.update(thinkTask);
	}
	
	@Override
	public int remove(Integer id){
		return thinkTaskDao.remove(id);
	}
	
	@Override
	public int batchRemove(Integer[] ids){
		return thinkTaskDao.batchRemove(ids);
	}
	
}
