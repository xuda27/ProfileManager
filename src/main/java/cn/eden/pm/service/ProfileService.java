package cn.eden.pm.service;

import java.math.BigDecimal;

import cn.eden.pm.pojo.EUDataGridResult;
import cn.eden.pm.pojo.Profile;
import cn.eden.pm.utils.PMResult;

public interface ProfileService {
	Profile getProfileById(BigDecimal id);
	
	EUDataGridResult getProfileList(int page, int rows); 
	
	PMResult updateProfileByPrimaryKey(Profile profile);
	
	PMResult insertProfile(Profile profile);
	
	PMResult deleteProfile(String ids);
}
