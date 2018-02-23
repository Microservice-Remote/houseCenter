package com.onion.mapper;

import com.onion.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/2/23 0023.
 */
@Repository
public interface UserMapper {

    List<User> getAllUser();

}
