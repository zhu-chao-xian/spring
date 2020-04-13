package com.debug.steadyjack.mapper;

import com.debug.steadyjack.entity.OrderRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderRecord record);

    int insertSelective(OrderRecord record);

    OrderRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderRecord record);

    int updateByPrimaryKey(OrderRecord record);

    List<OrderRecord> selectAll();
}