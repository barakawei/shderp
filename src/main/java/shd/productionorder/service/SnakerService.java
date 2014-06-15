package shd.productionorder.service;

import ee.sys.user.entity.User;
import org.snaker.engine.SnakerEngine;
import org.snaker.engine.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by baraka on 14-5-2.
 */
@Service
public class SnakerService {
    @Autowired
    private SnakerEngine snakerEngine;

    public static String PRODUCTION_ORDER_FLOW = "productionOrderFlow";

    //根据流程名字，查询流程定义
    public org.snaker.engine.entity.Process getProcessByName(String name){
       return snakerEngine.process().getProcessByName(name);
    }

    //根据流程定义ID和相关参数启动流程
    public Order startFlowByName(String name,String userName,Map<String, Object> args){
        org.snaker.engine.entity.Process p= this.getProcessByName(name);
        Order order = snakerEngine.startInstanceById(p.getId(),userName,args);
        return order;
    }

}
