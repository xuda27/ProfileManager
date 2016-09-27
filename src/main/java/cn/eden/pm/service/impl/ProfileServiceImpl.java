package cn.eden.pm.service.impl;

import java.math.BigDecimal;
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

}
