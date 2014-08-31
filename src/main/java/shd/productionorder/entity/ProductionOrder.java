/**
 * Copyright (c) 2013 barakawei
 */

package shd.productionorder.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.alibaba.fastjson.JSON;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import ee.common.entity.BaseEntity;
import ee.common.repository.annotation.EnableQueryCache;
import shd.common.entity.Upload;
import shd.organizeprogress.entity.OrganizeProgress;
import shd.productprogress.entity.ProductProgress;

@Entity
@Table(name = "production_order")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ProductionOrder extends BaseEntity<Long>{

	private static final long serialVersionUID = 1L;

    //新建
    public static int STATUS_NEW = 0;
    //已提交
    public static int STATUS_SUBMIT = 1;
    //已驳回
    public static int STATUS_REJECT= 2;
    //已审核
    public static int STATUS_AUDIT = 3;
    //已确认
    public static int STATUS_CONFIRM= 4;

	@Transient
	private String productionJson;

    @Column(name = "status")
    private Integer status;
	
	//客户名
	@Column(name = "customer_name")
	private String customerName;
	
	//订单号
	@Column(name = "order_number")
	private String orderNumber;
	
	//序列号
	@Column(name = "serial_number")
	private String serialNumber;
	
	//合同交期
	@Column(name = "contract_delivery_date")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date contractDeliveryDate;
	
	//包装要求
	@Column(name = "packaging_req")
	private String packagingReq;
	
	//装箱要求
	@Column(name = "packing_req")
	private String packingReq;
	
	//尺码带、洗唛等要求
	@Column(name = "sizebelt_req")
	private String sizebeltReq;
	
	//企业标识要求
	@Column(name = "companylogo_req")
	private String companylogoReq;
	
	//随货配件
	@Column(name = "production_parts")
	private String productionParts;
	
	//检测报告内容
	@Column(name = "check_report")
	private String checkReport;
	
	//备注
	@Column(name = "remark")
	private String remark;
	
	//订单负责人
	@Column(name = "order_principal")
	private String orderPrincipal;
	
	//责任助理
	@Column(name = "assistant")
	private String assistant;
	
	//片区经理
	@Column(name = "regional_Manager")
	private String regionalManager;
	
	//销售总监助理
	@Column(name = "sales_director_assistant")
	private String salesDirectorAssistant;
	
	//销售总监
	@Column(name = "sales_director")
	private String salesDirector;
	
	//填单时间
	@Column(name = "fill_date")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fillDate;
	
	//计划部经理
	@Column(name = "plan_manager")
	private String planManager;
	
	//供应部负责人
	@Column(name = "supply_principal")
	private String supplyPrincipal;
	
	//技术总监
	@Column(name = "technique_director")
	private String techniqueDirector;
	
	//生产厂长
	@Column(name = "factory_director")
	private String factoryDirector;

    //变更信息
    @Column(name ="change_info")
    private String changeInfoJson;

    @Transient
    private List<ChangeInfo> changeInfo;

	//标识要求
    @OneToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER, targetEntity = Upload.class, mappedBy = "po", orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    @Basic(optional = true, fetch = FetchType.EAGER)
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    //集合缓存引起的
    @org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)//集合缓存
    @OrderBy()
	private List<Upload> uploads;
		
	//创建时间
	@Column(name = "create_date")
	private Date createDate;

    //流程ID
    private String orderId;
	
	@OneToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER, targetEntity = Production.class, mappedBy = "po", orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    @Basic(optional = true, fetch = FetchType.EAGER)
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    //集合缓存引起的
    @org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)//集合缓存
    @OrderBy()
	private List<Production> productions;

    @OneToOne(cascade = {CascadeType.ALL},fetch=FetchType.LAZY, orphanRemoval = true)
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    private OrganizeProgress op;

    @OneToOne(cascade = {CascadeType.ALL},fetch=FetchType.LAZY, orphanRemoval = true)
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    private ProductProgress pp;

	public String getCustomerName() {
		return customerName;
	}



	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}



	public String getOrderNumber() {
		return orderNumber;
	}



	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}



	public String getSerialNumber() {
		return serialNumber;
	}



	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}



	public Date getContractDeliveryDate() {
		return contractDeliveryDate;
	}



	public void setContractDeliveryDate(Date contractDeliveryDate) {
		this.contractDeliveryDate = contractDeliveryDate;
	}



	public String getPackagingReq() {
		return packagingReq;
	}



	public void setPackagingReq(String packagingReq) {
		this.packagingReq = packagingReq;
	}



	public String getPackingReq() {
		return packingReq;
	}



	public void setPackingReq(String packingReq) {
		this.packingReq = packingReq;
	}



	public String getSizebeltReq() {
		return sizebeltReq;
	}



	public void setSizebeltReq(String sizebeltReq) {
		this.sizebeltReq = sizebeltReq;
	}



	public String getCompanylogoReq() {
		return companylogoReq;
	}



	public void setCompanylogoReq(String companylogoReq) {
		this.companylogoReq = companylogoReq;
	}



	public String getProductionParts() {
		return productionParts;
	}



	public void setProductionParts(String productionParts) {
		this.productionParts = productionParts;
	}



	public String getCheckReport() {
		return checkReport;
	}



	public void setCheckReport(String checkReport) {
		this.checkReport = checkReport;
	}



	public String getRemark() {
		return remark;
	}



	public void setRemark(String remark) {
		this.remark = remark;
	}



	public String getOrderPrincipal() {
		return orderPrincipal;
	}



	public void setOrderPrincipal(String orderPrincipal) {
		this.orderPrincipal = orderPrincipal;
	}



	public String getAssistant() {
		return assistant;
	}



	public void setAssistant(String assistant) {
		this.assistant = assistant;
	}



	public String getRegionalManager() {
		return regionalManager;
	}



	public void setRegionalManager(String regionalManager) {
		this.regionalManager = regionalManager;
	}



	public String getSalesDirectorAssistant() {
		return salesDirectorAssistant;
	}



	public void setSalesDirectorAssistant(String salesDirectorAssistant) {
		this.salesDirectorAssistant = salesDirectorAssistant;
	}



	public String getSalesDirector() {
		return salesDirector;
	}



	public void setSalesDirector(String salesDirector) {
		this.salesDirector = salesDirector;
	}



	public Date getFillDate() {
		return fillDate;
	}



	public void setFillDate(Date fillDate) {
		this.fillDate = fillDate;
	}



	public String getPlanManager() {
		return planManager;
	}



	public void setPlanManager(String planManager) {
		this.planManager = planManager;
	}



	public String getSupplyPrincipal() {
		return supplyPrincipal;
	}



	public void setSupplyPrincipal(String supplyPrincipal) {
		this.supplyPrincipal = supplyPrincipal;
	}



	public String getTechniqueDirector() {
		return techniqueDirector;
	}



	public void setTechniqueDirector(String techniqueDirector) {
		this.techniqueDirector = techniqueDirector;
	}



	public String getFactoryDirector() {
		return factoryDirector;
	}



	public void setFactoryDirector(String factoryDirector) {
		this.factoryDirector = factoryDirector;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public List<Production> getProductions() {
		return productions;
	}



	public void setProductions(List<Production> productions) {
		this.productions = productions;
	}


    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }



	public String getProductionJson() {
		return productionJson;
	}



	public void setProductionJson(String productionJson) {
		this.productionJson = productionJson;
	}

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public OrganizeProgress getOp() {
        return op;
    }

    public void setOp(OrganizeProgress op) {
        this.op = op;
    }

    public ProductProgress getPp() {
        return pp;
    }

    public void setPp(ProductProgress pp) {
        this.pp = pp;
    }

    public List<Upload> getUploads() {
        return uploads;
    }

    public void setUploads(List<Upload> uploads) {
        this.uploads = uploads;
    }

    public void assemble(){
        for(Production p :this.getProductions()) {
            ColorSet main = JSON.parseObject(p.getOutshellMainColor(),ColorSet.class);
            p.setMain(main);
            ColorSet lining = JSON.parseObject(p.getLiningMainColor(),ColorSet.class);
            p.setLining(lining);
            List<ColorSet> outShell = JSON.parseArray(p.getOutshellSetColorJson(),ColorSet.class);
            p.setOutShell(outShell);
            List<ColorSet> liningSet = JSON.parseArray(p.getLiningSetColorJson(),ColorSet.class);
            p.setLiningSet(liningSet);
            List<ColorSet> bagging = JSON.parseArray(p.getBaggingJson(),ColorSet.class);
            p.setBagging(bagging);
        }
        List<ChangeInfo> changeInfos = JSON.parseArray(this.getChangeInfoJson(),ChangeInfo.class);
        this.setChangeInfo(changeInfos);
    }

    public String getChangeInfoJson() {
        return changeInfoJson;
    }

    public void setChangeInfoJson(String changeInfoJson) {
        this.changeInfoJson = changeInfoJson;
    }

    public List<ChangeInfo> getChangeInfo() {
        return changeInfo;
    }

    public void setChangeInfo(List<ChangeInfo> changeInfo) {
        this.changeInfo = changeInfo;
    }
}
