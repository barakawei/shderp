package shd.purchaseorder.entity;

import ee.common.entity.BaseEntity;
import nl.bstoi.poiparser.api.strategy.annotations.Cell;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import javax.persistence.*;
import java.text.DecimalFormat;
import java.util.Date;

@Entity
@Table(name = "purchase")
public class Purchase  extends BaseEntity<Long> {

    public static DecimalFormat df = new DecimalFormat("0.00");

    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @Basic(optional = true, fetch = FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    private PurchaseOrder po;

    //排序号
    @Column(name = "sort_no")
    private Integer sortNo;

    //创建时间
    @Column(name = "create_date")
    private Date createDate;

    //类型
    private String category;

    //类型排序号
    @Column(name = "category_num")
    private Integer categoryNum;

    //名称
    @Cell(columnNumber = 0)
    private String name;

    //性别
    @Cell(columnNumber = 1)
    private String sex;

    //类别
    @Cell(columnNumber = 2)
    private String type;

    //型号规格
    @Cell(columnNumber = 3)
    private String specification;

    // 面辅料成分
    @Cell(columnNumber = 4)
    private String composition;

    //计划净宽/CM
    @Cell(columnNumber = 5)
    private String width;

    //单量
    @Cell(columnNumber = 6)
    private String amount;

    //颜色
    @Cell(columnNumber = 7)
    private String color;

    //预排单耗
    @Cell(columnNumber = 8)
    private String consume;

    //单位
    @Cell(columnNumber = 9)
    private String unit;

    //预留损耗1*%
    @Cell(columnNumber = 10)
    private String loss;

    //面辅料特殊要求
    @Cell(columnNumber = 11)
    private String specDesc;

    //预排规格
    @Cell(columnNumber = 12)
    @Column(name = "discharge_spec")
    private String dischargeSpec;

    //采购计划
    @Cell(columnNumber = 13)
    @Column(name = "purchase_amount")
    private String purchaseAmount;

    //库存数量
    @Cell(columnNumber = 14)
    @Column(name = "warehouse_amount")
    private String warehouseAmount;

    //实需采购
    @Cell(columnNumber = 15)
    @Column(name = "actual_purchase_amount")
    private String actualPurchaseAmount;

    //单价
    @Cell(columnNumber = 16)
    private String price;

    // 入库数量
    @Cell(columnNumber = 17)
    @Column(name = "entry_amount")
    private String entryAmount;

    // 计划入库(元)
    @Cell(columnNumber = 18)
    @Column(name = "plan_entry_amount")
    private String planEntryAmount;

    // 缺料预警
    @Cell(columnNumber = 19)
    private String alert;

    //使用面辅料批号
    @Cell(columnNumber = 20)
    @Column(name = "material_number")
    private String materialNumber;

    //实测缩率：经%/纬%
    @Cell(columnNumber = 21)
    private String shrinkage;

    //实排规格
    @Cell(columnNumber = 22)
    @Column(name = "actual_discharge_spec")
    private String actualDischargeSpec;

    //实排门幅(CM)
    @Cell(columnNumber = 23)
    @Column(name = "actual_width")
    private String actualWidth;

    //实排单耗
    @Cell(columnNumber = 24)
    @Column(name = "actual_consume")
    private String actualConsume;

    //核定损耗
    @Cell(columnNumber = 25)
    @Column(name = "actual_loss")
    private String actualLoss;

    //核定用料
    @Cell(columnNumber = 26)
    @Column(name = "confirm_use")
    private String confirmUse;

    //实发用料
    @Cell(columnNumber = 27)
    @Column(name = "send_use")
    private String sendUse;

    //退回
    @Cell(columnNumber = 28)
    @Column(name = "return_use")
    private String returnUse;

    //实际使用
    @Cell(columnNumber = 29)
    @Column(name = "actual_use")
    private String actualUse;

    //超用料(元)
    @Cell(columnNumber = 30)
    @Column(name = "exceed_use")
    private String exceedUse;

    //超用原因
    @Cell(columnNumber = 31)
    @Column(name = "reason")
    private String reason;

    //订单结算(元)
    @Cell(columnNumber = 32)
    @Column(name = "order_settlement")
     private String orderSettlement;

    public PurchaseOrder getPo() {
        return po;
    }

    public void setPo(PurchaseOrder po) {
        this.po = po;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getComposition() {
        return composition;
    }

    public void setComposition(String composition) {
        this.composition = composition;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getDischargeSpec() {
        return dischargeSpec;
    }

    public void setDischargeSpec(String dischargeSpec) {
        this.dischargeSpec = dischargeSpec;
    }

    public String getConsume() {
        return consume;
    }

    public void setConsume(String consume) {
        this.consume = consume;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getLoss() {
        return loss;
    }

    public void setLoss(String loss) {
        this.loss = loss;
    }

    public String getPurchaseAmount() {
        return purchaseAmount;
    }

    public void setPurchaseAmount(String purchaseAmount) {
        this.purchaseAmount = purchaseAmount;
    }

    public String getWarehouseAmount() {
        return warehouseAmount;
    }

    public void setWarehouseAmount(String warehouseAmount) {
        this.warehouseAmount = warehouseAmount;
    }

    public String getActualPurchaseAmount() {
        return actualPurchaseAmount;
    }

    public void setActualPurchaseAmount(String actualPurchaseAmount) {
        this.actualPurchaseAmount = actualPurchaseAmount;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getEntryAmount() {
        return entryAmount;
    }

    public void setEntryAmount(String entryAmount) {
        this.entryAmount = entryAmount;
    }

    public String getPlanEntryAmount() {
        return planEntryAmount;
    }

    public void setPlanEntryAmount(String planEntryAmount) {
        this.planEntryAmount = planEntryAmount;
    }

    public String getAlert() {
        return alert;
    }

    public void setAlert(String alert) {
        this.alert = alert;
    }

    public String getMaterialNumber() {
        return materialNumber;
    }

    public void setMaterialNumber(String materialNumber) {
        this.materialNumber = materialNumber;
    }

    public String getShrinkage() {
        return shrinkage;
    }

    public void setShrinkage(String shrinkage) {
        this.shrinkage = shrinkage;
    }

    public String getActualDischargeSpec() {
        return actualDischargeSpec;
    }

    public void setActualDischargeSpec(String actualDischargeSpec) {
        this.actualDischargeSpec = actualDischargeSpec;
    }

    public String getActualWidth() {
        return actualWidth;
    }

    public void setActualWidth(String actualWidth) {
        this.actualWidth = actualWidth;
    }

    public String getActualConsume() {
        return actualConsume;
    }

    public void setActualConsume(String actualConsume) {
        this.actualConsume = actualConsume;
    }

    public String getActualLoss() {
        return actualLoss;
    }

    public void setActualLoss(String actualLoss) {
        this.actualLoss = actualLoss;
    }

    public String getConfirmUse() {
        return confirmUse;
    }

    public void setConfirmUse(String confirmUse) {
        this.confirmUse = confirmUse;
    }

    public String getSendUse() {
        return sendUse;
    }

    public void setSendUse(String sendUse) {
        this.sendUse = sendUse;
    }

    public String getReturnUse() {
        return returnUse;
    }

    public void setReturnUse(String returnUse) {
        this.returnUse = returnUse;
    }

    public String getActualUse() {
        return actualUse;
    }

    public void setActualUse(String actualUse) {
        this.actualUse = actualUse;
    }

    public String getExceedUse() {
        return exceedUse;
    }

    public void setExceedUse(String exceedUse) {
        this.exceedUse = exceedUse;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getOrderSettlement() {
        return orderSettlement;
    }

    public void setOrderSettlement(String orderSettlement) {
        this.orderSettlement = orderSettlement;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
        if(category!=null){
        if(category.equals("面里料类衣")){
            this.categoryNum = 1;
        }else if(category.equals("辅料类衣")){
            this.categoryNum = 2;

        }else if(category.equals("面里料类裤")){
            this.categoryNum = 3;

        }else if(category.equals("辅料类裤")){
            this.categoryNum = 4;

        }else if(category.equals("标识类")){
            this.categoryNum = 5;

        }else if(category.equals("包装类")){
            this.categoryNum = 6;

        }else if(category.equals("其它")){
            this.categoryNum = 7;

        }else{
            this.categoryNum = 8;
        }}
    }

    public String getSpecDesc() {
        return specDesc;
    }

    public void setSpecDesc(String specDesc) {
        this.specDesc = specDesc;
    }

    public Integer getCategoryNum() {
        return categoryNum;
    }

    public void setCategoryNum(Integer categoryNum) {
        this.categoryNum = categoryNum;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getSortNo() {
        return sortNo;
    }

    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }
}
