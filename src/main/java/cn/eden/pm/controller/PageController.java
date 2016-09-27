package cn.eden.pm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转Contrller
 * @author Eden
 *
 */
@Controller
public class PageController {
	
	/**
	 * 展示首页
	 * @return index
	 */
	@RequestMapping("/")
	public String showIndex() {
		return "index";
	}
	
	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page) {
		return page;
	}
}
