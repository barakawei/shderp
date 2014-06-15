/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.common.entity;

import ee.common.entity.BaseEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import shd.productionorder.entity.ProductionOrder;

import javax.persistence.*;

@Entity
@Table(name = "upload")
public class Upload extends BaseEntity<Long> {

    @Column(name = "name")
    private String name;

    @Column(name = "src")
    private String src;

    @Column(name = "type")
    private String type;

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

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public ProductionOrder getPo() {
        return po;
    }

    public void setPo(ProductionOrder po) {
        this.po = po;
    }
}
