/**
 * Copyright (c) 2013 barakawei
 */

package shd.productionorder.entity;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import ee.common.entity.BaseEntity;
import ee.common.repository.annotation.EnableQueryCache;

@Entity
@Table(name = "production")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Production extends BaseEntity<Long>{

	private static final long serialVersionUID = 1L;
	
	//品名
	@Column(name = "name")
	private String name;
	
	//商标
	@Column(name = "brand")
	private String brand;
	
	//款号男
	@Column(name = "style_number_male")
	private String styleNumberMale;
	
	//款号女
	@Column(name = "style_number_female")
	private String styleNumberFemale;
	
	//号型标准男
	@Column(name = "size_standards_male")
	private String sizeStandardsMale;
	
	//号型标准女
	@Column(name = "size_standards_female")
	private String sizeStandardsFemale;
	
	//男女款式
	@Column(name = "style")
	private String style;
	
	//处理方式
	@Column(name = "handle_method")
	private String handleMethod;
	
	//提供样衣类型
	@Column(name = "sample_style")
	private String sampleStyle;
	
	//样衣款号
	@Column(name = "sample_style_number")
	private String sampleStyleNumber;
	
	//样衣数量
	@Column(name = "sample_amount")
	private Integer sampleAmount;
	
	//样衣修改说明
	@Column(name = "sample_revision_desc")
	private String sampleRevisionDesc;
	
	//样衣提供单位
	@Column(name = "sample_provider")
	private String sampleProvider;
	
	//面辅料是否预订
	@Column(name = "material_reserve")
	private String materialReserve;
	
	//量体样衣版型
	@Column(name = "measure_sample_version")
	private String measureSampleVersion;
	
	//量体人员
	@Column(name = "measure_staff")
	private String measureStaff;
	
	//归档人员
	@Column(name = "archive_staff")
	private String archiveStaff;
	
	//完成时间
	@Column(name ="finish_date")
	private Date finishDate;
	
	//面料主色
	@Column(name ="outshell_main_color")
	private String outshellMainColor;
	
	//里料主色
	@Column(name ="lining_main_color")
	private String liningMainColor;
	
	//面料镶色
	@Column(name ="outshell_set_color")
	private String outshellSetColorJson;
	
	//里料镶色
	@Column(name ="lining_set_color")
	private String liningSetColorJson;
	
	//袋布
	@Column(name ="bagging")
	private String baggingJson;
	
	//面辅料特殊要求
	@Column(name ="material_special_req")
	private String materialSpecialReq;
	
	//填充物要求
	@Column(name ="packing_req")
	private String packingReq;
	
	//其他要求
	@Column(name ="other_req")
	private String otherReq;
	
	//人数男
	@Column(name ="people_number_male")
	private Integer peopleNumberMale;
	
	//人数女
	@Column(name ="people_number_female")
	private Integer peopleNumberFemale;
	
	//人数合计
	@Column(name ="total_people")
	private Integer totalPeople;
	
	//数量男
	@Column(name ="amount_male")
	private Integer amountMale;
	
	//数量女
	@Column(name ="amount_female")
	private Integer amountFemale;
	
	//可利用男
	@Column(name ="available_male")
	private Integer availableMale;
	
	//可利用女
	@Column(name ="available_female")
	private Integer availableFemale;
	
	//需生产男
	@Column(name ="need_male")
	private Integer needMale;
	
	//需生产女
	@Column(name ="need_female")
	private Integer needFemale;
	
	//订单合计
	@Column(name ="order_total")
	private Integer orderTotal;
	
	//生产合计
	@Column(name ="production_total")
	private Integer productionTotal;
	
	//创建时间
	@Column(name = "create_date")
	private Date createDate;
	
	@ManyToOne(optional = true, fetch = FetchType.EAGER)
	@Basic(optional = true, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private ProductionOrder po;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getStyleNumberMale() {
		return styleNumberMale;
	}

	public void setStyleNumberMale(String styleNumberMale) {
		this.styleNumberMale = styleNumberMale;
	}

	public String getStyleNumberFemale() {
		return styleNumberFemale;
	}

	public void setStyleNumberFemale(String styleNumberFemale) {
		this.styleNumberFemale = styleNumberFemale;
	}

	public String getSizeStandardsMale() {
		return sizeStandardsMale;
	}

	public void setSizeStandardsMale(String sizeStandardsMale) {
		this.sizeStandardsMale = sizeStandardsMale;
	}

	public String getSizeStandardsFemale() {
		return sizeStandardsFemale;
	}

	public void setSizeStandardsFemale(String sizeStandardsFemale) {
		this.sizeStandardsFemale = sizeStandardsFemale;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getHandleMethod() {
		return handleMethod;
	}

	public void setHandleMethod(String handleMethod) {
		this.handleMethod = handleMethod;
	}

	public String getSampleStyle() {
		return sampleStyle;
	}

	public void setSampleStyle(String sampleStyle) {
		this.sampleStyle = sampleStyle;
	}

	public String getSampleStyleNumber() {
		return sampleStyleNumber;
	}

	public void setSampleStyleNumber(String sampleStyleNumber) {
		this.sampleStyleNumber = sampleStyleNumber;
	}

	public Integer getSampleAmount() {
		return sampleAmount;
	}

	public void setSampleAmount(Integer sampleAmount) {
		this.sampleAmount = sampleAmount;
	}

	public String getSampleRevisionDesc() {
		return sampleRevisionDesc;
	}

	public void setSampleRevisionDesc(String sampleRevisionDesc) {
		this.sampleRevisionDesc = sampleRevisionDesc;
	}

	public String getSampleProvider() {
		return sampleProvider;
	}

	public void setSampleProvider(String sampleProvider) {
		this.sampleProvider = sampleProvider;
	}

	public String getMaterialReserve() {
		return materialReserve;
	}

	public void setMaterialReserve(String materialReserve) {
		this.materialReserve = materialReserve;
	}

	public String getMeasureSampleVersion() {
		return measureSampleVersion;
	}

	public void setMeasureSampleVersion(String measureSampleVersion) {
		this.measureSampleVersion = measureSampleVersion;
	}

	public String getMeasureStaff() {
		return measureStaff;
	}

	public void setMeasureStaff(String measureStaff) {
		this.measureStaff = measureStaff;
	}

	public String getArchiveStaff() {
		return archiveStaff;
	}

	public void setArchiveStaff(String archiveStaff) {
		this.archiveStaff = archiveStaff;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public String getOutshellMainColor() {
		return outshellMainColor;
	}

	public void setOutshellMainColor(String outshellMainColor) {
		this.outshellMainColor = outshellMainColor;
	}

	public String getLiningMainColor() {
		return liningMainColor;
	}

	public void setLiningMainColor(String liningMainColor) {
		this.liningMainColor = liningMainColor;
	}

	public String getOutshellSetColorJson() {
		return outshellSetColorJson;
	}

	public void setOutshellSetColorJson(String outshellSetColorJson) {
		this.outshellSetColorJson = outshellSetColorJson;
	}

	public String getLiningSetColorJson() {
		return liningSetColorJson;
	}

	public void setLiningSetColorJson(String liningSetColorJson) {
		this.liningSetColorJson = liningSetColorJson;
	}

	public String getBaggingJson() {
		return baggingJson;
	}

	public void setBaggingJson(String baggingJson) {
		this.baggingJson = baggingJson;
	}

	public String getMaterialSpecialReq() {
		return materialSpecialReq;
	}

	public void setMaterialSpecialReq(String materialSpecialReq) {
		this.materialSpecialReq = materialSpecialReq;
	}

	public String getPackingReq() {
		return packingReq;
	}

	public void setPackingReq(String packingReq) {
		this.packingReq = packingReq;
	}

	public String getOtherReq() {
		return otherReq;
	}

	public void setOtherReq(String otherReq) {
		this.otherReq = otherReq;
	}

	public Integer getPeopleNumberMale() {
		return peopleNumberMale;
	}

	public void setPeopleNumberMale(Integer peopleNumberMale) {
		this.peopleNumberMale = peopleNumberMale;
	}

	public Integer getPeopleNumberFemale() {
		return peopleNumberFemale;
	}

	public void setPeopleNumberFemale(Integer peopleNumberFemale) {
		this.peopleNumberFemale = peopleNumberFemale;
	}

	public Integer getTotalPeople() {
		return totalPeople;
	}

	public void setTotalPeople(Integer totalPeople) {
		this.totalPeople = totalPeople;
	}

	public Integer getAmountMale() {
		return amountMale;
	}

	public void setAmountMale(Integer amountMale) {
		this.amountMale = amountMale;
	}

	public Integer getAmountFemale() {
		return amountFemale;
	}

	public void setAmountFemale(Integer amountFemale) {
		this.amountFemale = amountFemale;
	}

	public Integer getAvailableMale() {
		return availableMale;
	}

	public void setAvailableMale(Integer availableMale) {
		this.availableMale = availableMale;
	}

	public Integer getAvailableFemale() {
		return availableFemale;
	}

	public void setAvailableFemale(Integer availableFemale) {
		this.availableFemale = availableFemale;
	}

	public Integer getNeedMale() {
		return needMale;
	}

	public void setNeedMale(Integer needMale) {
		this.needMale = needMale;
	}

	public Integer getNeedFemale() {
		return needFemale;
	}

	public void setNeedFemale(Integer needFemale) {
		this.needFemale = needFemale;
	}

	public Integer getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(Integer orderTotal) {
		this.orderTotal = orderTotal;
	}

	public Integer getProductionTotal() {
		return productionTotal;
	}

	public void setProductionTotal(Integer productionTotal) {
		this.productionTotal = productionTotal;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public ProductionOrder getPo() {
		return po;
	}

	public void setPo(ProductionOrder po) {
		this.po = po;
	}
	
	
}
