package com.base.system.controller;

import java.util.Collection;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.base.common.utils.R;
import com.base.system.domain.UserOnline;
import com.base.system.service.SessionService;

@RequestMapping("/sys/online")
@Controller
public class SessionController {
	@Autowired
	SessionService sessionService;

	@GetMapping()
	public String online() {
		return "system/online/online";
	}

	@ResponseBody
	@RequestMapping("/list")
	public List<UserOnline> list() {
		return sessionService.list();
	}

	@ResponseBody
	@RequestMapping("/forceLogout/{sessionId}")
	public R forceLogout(@PathVariable("sessionId") String sessionId, RedirectAttributes redirectAttributes) {
		try {
			sessionService.forceLogout(sessionId);
			return R.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return R.error();
		}

	}

	@ResponseBody
	@RequestMapping("/sessionList")
	public Collection<Session> sessionList() {
		return sessionService.sessionList();
	}
	
	@ResponseBody
	@RequestMapping("/sysInfo")
	public R sysInfo(HttpServletRequest request) {
		Properties props = System.getProperties();
        //java版本
        String javaVersion = props.getProperty("java.version");
        //操作系统名称
        String osName = props.getProperty("os.name") + props.getProperty("os.version");
        //用户的主目录
        String userHome = props.getProperty("user.home");
        //用户的当前工作目录
        String userDir = props.getProperty("user.dir");
        //服务器IP
        String serverIP = request.getLocalAddr();
        //客户端IP
        String clientIP = request.getRemoteHost();
        //WEB服务器
        String webVersion = request.getServletContext().getServerInfo();
        //CPU个数
        String cpu = Runtime.getRuntime().availableProcessors() + "核";
        //虚拟机内存总量
        String totalMemory = (Runtime.getRuntime().totalMemory() / 1024 / 1024) + "M";
        //虚拟机空闲内存量
        String freeMemory = (Runtime.getRuntime().freeMemory() / 1024 / 1024) + "M";
        //虚拟机使用的最大内存量
        String maxMemory = (Runtime.getRuntime().maxMemory() / 1024 / 1024) + "M";
        //网站根目录
        String webRootPath = request.getSession().getServletContext().getRealPath("");
        
        R result = R.ok("系统信息");
        result.put("javaVersion", javaVersion)
        .put("osName", osName)
        .put("userHome", userHome)
        .put("userDir", userDir)
        .put("clientIP", clientIP)
        .put("serverIP", serverIP)
        .put("cpu", cpu)
        .put("totalMemory", totalMemory)
        .put("freeMemory", freeMemory)
        .put("maxMemory", maxMemory)
        .put("webVersion", webVersion)
        //.put("mysqlVersion", mysqlVersion)
        .put("webRootPath", webRootPath);
        return result;
      
	}
	

}
