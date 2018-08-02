package com.base.common.controller;

import org.springframework.stereotype.Controller;

import com.base.common.utils.ShiroUtils;
import com.base.common.utils.StringUtils;
import com.base.system.domain.UserDO;
import com.base.system.domain.UserToken;

@Controller
public class BaseController {
	public UserDO getUser() {
		return ShiroUtils.getUser();
	}

	public Long getUserId() {
		return getUser().getUserId();
	}

	public String getUsername() {
		return getUser().getUsername();
	}
}