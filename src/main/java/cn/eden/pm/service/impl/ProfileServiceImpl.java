package cn.eden.pm.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.eden.pm.mapper.ProfileMapper;
import cn.eden.pm.pojo.EUDataGridResult;
import cn.eden.pm.pojo.Profile;
import cn.eden.pm.pojo.ProfileExample;
import cn.eden.pm.pojo.ProfileExample.Criteria;
import cn.eden.pm.service.ProfileService;
import cn.eden.pm.utils.PMResult;
/**
 * 人员管理service
 * @author Eden
 *
 */
@Service
public class ProfileServiceImpl implements ProfileService {
	@Autowired
	private ProfileMapper profileMapper;
	
	@Override
	public Profile getProfileById(BigDecimal id) {
		//添加查询条件
		ProfileExample profileExample = new ProfileExample();
		Criteria criteria = profileExample.createCriteria();
		criteria.andIdEqualTo(id);
		List<Profile> list = profileMapper.selectByExample(profileExample);
		if(list != null && list.size() > 0) {
			Profile profile = list.get(0);
			return profile;
		}
		return null;
	}

	/**
	 * 人员列表查询
	 */
	@Override
	public EUDataGridResult getProfileList(int page, int rows) {
		// 查询人员列表
		ProfileExample example = new ProfileExample();
		// 分页处理
		PageHelper.startPage(page, rows);
		List<Profile> list = profileMapper.selectByExample(example);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		PageInfo<Profile> pageInfo = new PageInfo<Profile>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	
	/**
	 * 如果更新成功返回ok
	 */
	@Override
	public PMResult updateProfileByPrimaryKey(Profile profile) {
		int result = profileMapper.updateByPrimaryKey(profile);
		if(result > 0) {
			return PMResult.ok();
		}
		return null;
	}

	@Override
	public PMResult insertProfile(Profile profile) {
		int result = profileMapper.insert(profile);
		if(result > 0) {
			return PMResult.ok();
		}
		return null;
	}

	@Override
	public PMResult deleteProfile(String ids) {
		String[] idsArray = ids.split(",");
		List<BigDecimal> values = new ArrayList<BigDecimal>();
		for(String id : idsArray) {
			values.add(BigDecimal.valueOf((Long.parseLong(id))));
		}
		ProfileExample example = new ProfileExample();
		Criteria c = example.createCriteria();
		c.andIdIn(values);
		int result = profileMapper.deleteByExample(example);
		if(result > 0){
			return PMResult.ok();
		}
		return null;
	}

}
