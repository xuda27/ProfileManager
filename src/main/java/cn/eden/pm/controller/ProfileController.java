package cn.eden.pm.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.eden.pm.pojo.EUDataGridResult;
import cn.eden.pm.pojo.Profile;
import cn.eden.pm.service.ProfileService;
import cn.eden.pm.utils.PMResult;

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
	
	@RequestMapping(value="/profile/update", method=RequestMethod.POST)
	@ResponseBody
	public PMResult updateProfileByPrimaryKey(Profile profile) {
		PMResult result = profileService.updateProfileByPrimaryKey(profile);
		return result;
	}
	
	@RequestMapping(value="/profile/insert", method=RequestMethod.POST)
	@ResponseBody
	public PMResult insertProfile(Profile profile) {
		PMResult result = profileService.insertProfile(profile);
		return result;
	}
	
	@RequestMapping(value="/profile/delete", method=RequestMethod.POST)
	@ResponseBody
	public PMResult deleteProfile(String ids) {
		PMResult result = profileService.deleteProfile(ids);
		return result;
	}
}
