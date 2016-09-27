package cn.eden.pm.mapper;

import cn.eden.pm.pojo.Profile;
import cn.eden.pm.pojo.ProfileExample;
import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProfileMapper {
    int countByExample(ProfileExample example);

    int deleteByExample(ProfileExample example);

    int deleteByPrimaryKey(BigDecimal id);

    int insert(Profile record);

    int insertSelective(Profile record);

    List<Profile> selectByExample(ProfileExample example);

    Profile selectByPrimaryKey(BigDecimal id);

    int updateByExampleSelective(@Param("record") Profile record, @Param("example") ProfileExample example);

    int updateByExample(@Param("record") Profile record, @Param("example") ProfileExample example);

    int updateByPrimaryKeySelective(Profile record);

    int updateByPrimaryKey(Profile record);
}