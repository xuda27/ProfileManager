package cn.eden.pm.service;

import java.math.BigDecimal;

import cn.eden.pm.pojo.EUDataGridResult;
import cn.eden.pm.pojo.Profile;

public interface ProfileService {
	Profile getProfileById(BigDecimal id);
	
	EUDataGridResult getProfileList(int page, int rows); 
}
