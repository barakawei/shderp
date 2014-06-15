package shd.summary.entity;


import ee.common.entity.BaseEntity;

/**
 * Created by baraka on 14-6-8.
 */
public class Summary extends BaseEntity<Long> {

    //客户名
    private String customerName;

    //订单号
    private String orderNumber;

    //序列号
    private String serialNumber;

    private String productionOrderId;


    private String organizeProgressId;


    private String productProgressId;


    private String purchaseOrderId;

    private String productionOrderStatus;
    private String organizeProgressStatus;
    private String productProgressStatus;
    private String purchaseOrderStatus;

    public static Summary getInstance(String customerName, String orderNumber, String serialNumber, String productionOrderId, String organizeProgressId, String productProgressId, String purchaseOrderId, String productionOrderStatus, String organizeProgressStatus, String productProgressStatus, String purchaseOrderStatus) {
        Summary s = new Summary();
        s.customerName = customerName;
        s.orderNumber = orderNumber;
        s.serialNumber = serialNumber;
        s.productionOrderId = productionOrderId;
        s.organizeProgressId = organizeProgressId;
        s.productProgressId = productProgressId;
        s.purchaseOrderId = purchaseOrderId;
        s.productionOrderStatus = productionOrderStatus;
        s.organizeProgressStatus = organizeProgressStatus;
        s.productProgressStatus = productProgressStatus;
        s.purchaseOrderStatus = purchaseOrderStatus;
        return s;
    }

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

    public String getProductionOrderId() {
        return productionOrderId;
    }

    public void setProductionOrderId(String productionOrderId) {
        this.productionOrderId = productionOrderId;
    }

    public String getOrganizeProgressId() {
        return organizeProgressId;
    }

    public void setOrganizeProgressId(String organizeProgressId) {
        this.organizeProgressId = organizeProgressId;
    }

    public String getProductProgressId() {
        return productProgressId;
    }

    public void setProductProgressId(String productProgressId) {
        this.productProgressId = productProgressId;
    }

    public String getPurchaseOrderId() {
        return purchaseOrderId;
    }

    public void setPurchaseOrderId(String purchaseOrderId){
        this.purchaseOrderId = purchaseOrderId;
    }

    public String getProductionOrderStatus() {
        return productionOrderStatus;
    }

    public void setProductionOrderStatus(String productionOrderStatus) {
        this.productionOrderStatus = productionOrderStatus;
    }

    public String getOrganizeProgressStatus() {
        return organizeProgressStatus;
    }

    public void setOrganizeProgressStatus(String organizeProgressStatus) {
        this.organizeProgressStatus = organizeProgressStatus;
    }

    public String getProductProgressStatus() {
        return productProgressStatus;
    }

    public void setProductProgressStatus(String productProgressStatus) {
        this.productProgressStatus = productProgressStatus;
    }

    public String getPurchaseOrderStatus() {
        return purchaseOrderStatus;
    }

    public void setPurchaseOrderStatus(String purchaseOrderStatus) {
        this.purchaseOrderStatus = purchaseOrderStatus;
    }


}
