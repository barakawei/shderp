package shd.common.util;

import ee.sys.organization.entity.Job;
import ee.sys.organization.service.JobService;
import ee.sys.user.entity.User;
import ee.sys.user.entity.UserOrganizationJob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by baraka on 14-8-31.
 */
@Component
public class UserContextUtil {

    @Autowired
    private JobService jobService;

    public  List<String> getUserJobs(User user){
        List<String> jobList = new ArrayList<>();
        List<UserOrganizationJob> jobs = user.getOrganizationJobs();
        for(UserOrganizationJob job:jobs){
            Job j= jobService.findOne(job.getJobId());
            jobList.add(j.getName());
        }
        return jobList;

    }

    public boolean hasJob(User user,String job){
        List<String> jobList =getUserJobs(user);
        if(jobList !=null && jobList.contains(job)){
            return true;

        }
        return false;
    }
}
