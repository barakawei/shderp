/**
 * Copyright (c) 2013 barakawei
 */

package shd.organizeprogress.entity;

import ee.common.entity.BaseEntity;
import ee.common.repository.annotation.EnableQueryCache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;
import shd.productionorder.entity.ProductionOrder;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "organize_progress")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class OrganizeProgress extends BaseEntity<Long>{

	private static final long serialVersionUID = 1L;

    //组织中
    public static int STATUS_UNFINISH = 0;
    //组织完成
    public static int STATUS_FINISH = 1;

    @OneToOne(fetch=FetchType.EAGER)
    private ProductionOrder po = new ProductionOrder();

    //数据计划完成时间
    @Column(name = "data_plan_finish_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dataPlanFinishDate;

    //标准样确认时间
    @Column(name = "standerd_sample_confirm_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date standardSampleConfirmDate;

    //面料组织计划完成时间
    @Column(name = "fabric_organize_plan_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fabricOrganizePlanDate;

    //面料组织实际完成时间
    @Column(name = "fabric_organize_actual_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fabricOrganizeActualDate;

    //辅料组织计划完成时间
    @Column(name = "accessory_organize_plan_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accessoryOrganizePlanDate;

    //辅料组织实际完成时间
    @Column(name = "accessory_organize_actual_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accessoryOrganizeActualDate;

    @Column(name = "status")
    private Integer status;

    public ProductionOrder getPo() {
        return po;
    }

    public void setPo(ProductionOrder po) {
        this.po = po;
    }

    public Date getDataPlanFinishDate() {
        return dataPlanFinishDate;
    }

    public void setDataPlanFinishDate(Date dataPlanFinishDate) {
        this.dataPlanFinishDate = dataPlanFinishDate;
    }

    public Date getStandardSampleConfirmDate() {
        return standardSampleConfirmDate;
    }

    public void setStandardSampleConfirmDate(Date standardSampleConfirmDate) {
        this.standardSampleConfirmDate = standardSampleConfirmDate;
    }

    public Date getFabricOrganizePlanDate() {
        return fabricOrganizePlanDate;
    }

    public void setFabricOrganizePlanDate(Date fabricOrganizePlanDate) {
        this.fabricOrganizePlanDate = fabricOrganizePlanDate;
    }

    public Date getFabricOrganizeActualDate() {
        return fabricOrganizeActualDate;
    }

    public void setFabricOrganizeActualDate(Date fabricOrganizeActualDate) {
        this.fabricOrganizeActualDate = fabricOrganizeActualDate;
    }

    public Date getAccessoryOrganizePlanDate() {
        return accessoryOrganizePlanDate;
    }

    public void setAccessoryOrganizePlanDate(Date accessoryOrganizePlanDate) {
        this.accessoryOrganizePlanDate = accessoryOrganizePlanDate;
    }

    public Date getAccessoryOrganizeActualDate() {
        return accessoryOrganizeActualDate;
    }

    public void setAccessoryOrganizeActualDate(Date accessoryOrganizeActualDate) {
        this.accessoryOrganizeActualDate = accessoryOrganizeActualDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
