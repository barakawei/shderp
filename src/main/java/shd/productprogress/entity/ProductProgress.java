/**
 * Copyright (c) 2013 barakawei
 */

package shd.productprogress.entity;

import ee.common.entity.BaseEntity;
import ee.common.repository.annotation.EnableQueryCache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.format.annotation.DateTimeFormat;
import shd.productionorder.entity.ProductionOrder;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "product_progress")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ProductProgress extends BaseEntity<Long>{

	private static final long serialVersionUID = 1L;

    //生产中
    public static int STATUS_UNFINISH = 0;
    //已入库
    public static int STATUS_FINISH = 1;

    @OneToOne(fetch=FetchType.EAGER)
    private ProductionOrder po = new ProductionOrder();

    @Column(name = "product_status")
    private String productStatus;

    @Column(name = "order_type")
    private String orderType;

    //计划入库时间
    @Column(name = "plan_warehouse_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date planWarehouseDate;

    //实际入库时间
    @Column(name = "actual_warehouse_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date actualWarehouseDate;

    @Column(name = "status")
    private Integer status;

    public ProductionOrder getPo() {
        return po;
    }

    public void setPo(ProductionOrder po) {
        this.po = po;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public Date getPlanWarehouseDate() {
        return planWarehouseDate;
    }

    public void setPlanWarehouseDate(Date planWarehouseDate) {
        this.planWarehouseDate = planWarehouseDate;
    }

    public Date getActualWarehouseDate() {
        return actualWarehouseDate;
    }

    public void setActualWarehouseDate(Date actualWarehouseDate) {
        this.actualWarehouseDate = actualWarehouseDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
