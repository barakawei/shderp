package shd.purchaseorder.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import ee.common.entity.BaseEntity;
import nl.bstoi.poiparser.core.strategy.ReadPoiParser;
import nl.bstoi.poiparser.core.strategy.annotation.AnnotatedReadPoiParserFactory;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.beans.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
import shd.organizeprogress.entity.OrganizeProgress;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Entity
@Table(name = "purchase_order")
public class PurchaseOrder extends BaseEntity<Long> {

    @Column(name = "file_name")
    private String fileName;

    //创建时间
    @Column(name = "create_date")
    private Date createDate;

    @Transient
    private String purchaseJson;

    @Transient
    private String modelJson;

    //客户名
    @Column(name = "customer_name")
    private String customerName;

    //订单号
    @Column(name = "order_number")
    private String orderNumber;

    //序列号
    @Column(name = "serial_number")
    private String serialNumber;

    //订单数量
    @Column(name = "order_amount")
    private String orderAmount;

    //合同交期
    @Column(name = "contract_delivery_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date contractDeliveryDate;

    @Column(name = "status")
    private Integer status;

    //备注
    @Column(name = "remark")
    private String remark;

    //制表人
    private String tabulator;

    //制表日期
    @Column(name = "tabulate_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date tabulateDate;

    //排料人
    @Column(name = "discharge_personk")
    private String dischargePerson;

    //排料日期
    @Column(name = "discharge_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dischargeDate;


    @OneToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER, targetEntity = Purchase.class, mappedBy = "po", orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    @Basic(optional = true, fetch = FetchType.EAGER)
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    //集合缓存引起的
    @org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)//集合缓存
    @OrderBy("categoryNum asc,sortNo asc")
    private List<Purchase> purchases;

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

    public String getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(String orderAmount) {
        this.orderAmount = orderAmount;
    }

    public Date getContractDeliveryDate() {
        return contractDeliveryDate;
    }

    public void setContractDeliveryDate(Date contractDeliveryDate) {
        this.contractDeliveryDate = contractDeliveryDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getTabulator() {
        return tabulator;
    }

    public void setTabulator(String tabulator) {
        this.tabulator = tabulator;
    }

    public Date getTabulateDate() {
        return tabulateDate;
    }

    public void setTabulateDate(Date tabulateDate) {
        this.tabulateDate = tabulateDate;
    }

    public String getDischargePerson() {
        return dischargePerson;
    }

    public void setDischargePerson(String dischargePerson) {
        this.dischargePerson = dischargePerson;
    }

    public Date getDischargeDate() {
        return dischargeDate;
    }

    public void setDischargeDate(Date dischargeDate) {
        this.dischargeDate = dischargeDate;
    }

    public List<Purchase> getPurchases() {
        return purchases;
    }

    public void setPurchases(List<Purchase> purchases) {
        this.purchases = purchases;
    }

    public String getPurchaseJson() {
        return purchaseJson;
    }

    public void setPurchaseJson(String purchaseJson) {
        this.purchaseJson = purchaseJson;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getModelJson() {
        SimplePropertyPreFilter filter = new SimplePropertyPreFilter(Purchase.class);
        filter.getExcludes().add("po");
        String json = JSON.toJSONString(new Purchase(), filter, SerializerFeature.WriteMapNullValue);
        this.modelJson  = json.replaceAll("null","\"\"");
        return this.modelJson;
    }

    public void setModelJson(String modelJson) {
        this.modelJson = modelJson;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public PurchaseOrder parseExcel(MultipartFile file){
        PurchaseOrder po = new PurchaseOrder();
        List<Purchase> purchases= new ArrayList<>();
        po.setPurchases(purchases);
        po.setFileName(file.getOriginalFilename());
        List<Purchase> rows= null;
        String category = "";
        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM d H:m:s z y",Locale.ENGLISH);
        try {
            AnnotatedReadPoiParserFactory<Purchase> poiParserFactory = new AnnotatedReadPoiParserFactory<>(Purchase.class);
            ReadPoiParser<Purchase> poiParser= poiParserFactory.createReadPoiParser(file.getInputStream(), "采购、发料、总结总表");
            rows = poiParser.read();
        }catch (Exception e){
            e.printStackTrace();
        }
        for (int i = 0; i < rows.size(); i++) {
            if (i == 1) {
                po.setCustomerName(rows.get(i).getSex());
                continue;
            }
            if (i == 2) {
                po.setOrderNumber(rows.get(i).getSex());
                po.setSerialNumber(rows.get(i).getColor());
                continue;
            }
            if (i == 3) {
                po.setOrderAmount(rows.get(i).getSex());
                continue;
            }
            String firstColumn = rows.get(i).getName();
            if(null != firstColumn && firstColumn.contains("订单合同交期") && i >= 4){
                    if(StringUtils.isNotBlank(rows.get(i).getSex())){
                        Date date = null;
                        try {
                            date = sdf.parse(rows.get(i).getSex());
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        po.setContractDeliveryDate(date);
                    }
                continue;
            }
            if(null != firstColumn && firstColumn.contains("制表") && i >= 4){
                po.setTabulator(rows.get(i).getSex());
                if(StringUtils.isNotBlank(rows.get(i).getComposition())){
                    Date date = null;
                    try {
                        date = sdf.parse(rows.get(i).getComposition());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    po.setTabulateDate(date);
                }
                continue;
            }
            if(null != firstColumn && firstColumn.contains("排料") && i >= 4){
                po.setDischargePerson(rows.get(i).getSex());
                if(StringUtils.isNotBlank(rows.get(i).getComposition())){
                    Date date = null;
                    try {
                        date = sdf.parse(rows.get(i).getComposition());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    po.setDischargeDate(date);

                }
                break;

            }
            if (null!=firstColumn && !firstColumn.contains("订单合同交期") && i >= 5) {
                if (rows.get(i).getName() != null &&
                        rows.get(i).getSex() == null &&
                        rows.get(i).getType() == null &&
                        rows.get(i).getSpecification() == null &&
                        rows.get(i).getComposition() == null &&
                        rows.get(i).getColor() == null &&
                        rows.get(i).getConsume() == null &&
                        rows.get(i).getUnit() == null &&
                        rows.get(i).getLoss() == null
                        ) {

                    category = rows.get(i).getName();
                    continue;
                }

                Purchase p = new Purchase();
                BeanUtils.copyProperties(rows.get(i), p);
                p.setCategory(category);
                p.setPo(po);
                p.setCreateDate(new Date());
                p.setSortNo(i);
                //下面两个数据为公式，参照预排单耗和预定损耗
                //实排单耗
                if(p.getActualConsume() != null && "FORMULA".equals(p.getActualConsume())){
                    p.setActualConsume(p.getConsume());
                }
                //核定损耗
                if(p.getActualLoss() == null){
                    p.setActualLoss(p.getLoss());
                }
                po.getPurchases().add(p);
            }

        }
        return po;
    }
}

