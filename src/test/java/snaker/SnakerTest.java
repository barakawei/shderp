package snaker;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.snaker.engine.SnakerEngine;
import org.snaker.engine.helper.StreamHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by baraka on 14-4-29.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class SnakerTest extends AbstractJUnit4SpringContextTests {

    @Resource
    private SnakerEngine snaker;

    @Test
    public void testDeploy() {
        //snaker.process().deploy(StreamHelper.getStreamFromClasspath("flows/productionOrder.xml"));

    }

    @Test
    public void testStart() {
        Map<String, Object> args = new HashMap<String, Object>();
        args.put("apply.operator", new String[]{"snaker"});
        //根据流程定义id启动流程,可接收1~3个参数，分别为流程定义id、处理人、变量参数
        //snaker.startInstanceById("a354e6adffc24a169eaf8ac75a8a247d", "t0");
    }
    @Test
    public void test1() {
        Map<String, Object> args = new HashMap<String, Object>();
        args.put("task2.operator", "606095436628992,06095982609408");
        //snaker.executeTask("49434bdd8c994f2abb8cb46308f1a21b", "t1", args);
    }

    @Test
    public void test2(){
        //snaker.executeTask("ec325203381e45c8b641da79fb41e481", "06095982609408");
    }


}
