package com.base.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.base.common.domain.LogDO;
import com.base.common.domain.PageDO;
import com.base.common.utils.Query;
@Service
public interface LogService {
	void save(LogDO logDO);
	PageDO<LogDO> queryList(Query query);
	int remove(Long id);
	int batchRemove(Long[] ids);
}
