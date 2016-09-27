package cn.eden.pm.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.eden.pm.pojo.EUDataGridResult;
import cn.eden.pm.pojo.Profile;
import cn.eden.pm.service.ProfileService;

/**
 * 人员管理Controller
 * @author Eden 
 *
 */
@Controller
public class ProfileController {
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping("/profile/{profileId}")
	@ResponseBody
	public Profile getProfileById(@PathVariable BigDecimal profileId){
		Profile profile = profileService.getProfileById(profileId);
		return profile;
	}
	
	@RequestMapping("/profile/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows) {
		EUDataGridResult result = profileService.getProfileList(page, rows);
		return result;
	}
	
}
