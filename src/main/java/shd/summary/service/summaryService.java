/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.summary.service;
import ee.common.repository.RepositoryHelper;
import ee.common.repository.support.SearchCallback;
import ee.common.search.Searchable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Service;
import shd.summary.entity.Summary;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


@Service
public class SummaryService{

    private static RepositoryHelper rh= new RepositoryHelper(Summary.class);

    public Page<Summary> findAll(Searchable searchable){
        String sql ="select po.customer_name customerName,po.order_number orderNumber,po.serial_number serialNumber,\n" +
                "po.id productionOrderId,op.id organizeProgressId,pp.id productProgressId,puo.id purchaseOrderId,\n" +
                "po.status productionOrderStatus,op.status organizeProgressStatus,pp.status productProgressStatus,\n" +
                "puo.status purchaseOrderStatus\n" +
                "from production_order po \n" +
                "left join product_progress pp on(po.id = pp.po_id) \n" +
                "left join organize_progress op on(po.id = op.po_id)\n" +
                "left join purchase_order puo on(po.order_number = puo.order_number)\n" +
                "where po.status = 4\n";
        String countSql ="select count(po.id)\n" +
                "from production_order po \n" +
                "left join product_progress pp on(po.id = pp.po_id) \n" +
                "left join organize_progress op on(po.id = op.po_id)\n" +
                "left join purchase_order puo on(po.order_number = puo.order_number)\n" +
                "where po.status = 4";
        List<Object> result = rh.findByNative(sql,searchable, SearchCallback.DEFAULT);
        List<Summary> summaries = new ArrayList<Summary>();
        Iterator it = result.iterator( );
        while (it.hasNext( )) {
            Object[] r = (Object[])it.next();
            summaries.add(Summary.getInstance(
                    String.valueOf(r[0]),
                    String.valueOf(r[1]),
                    String.valueOf(r[2]),
                    String.valueOf(r[3]),
                    String.valueOf(r[4]),
                    String.valueOf(r[5]),
                    String.valueOf(r[6]),
                    String.valueOf(r[7]),
                    String.valueOf(r[8]),
                    String.valueOf(r[9]),
                    String.valueOf(r[10])
            ));

        }
        long total = searchable.hasPageable() ? rh.countByNative(countSql, searchable, SearchCallback.DEFAULT) : summaries.size();
        return new PageImpl<Summary>(
                summaries,
                searchable.getPage(),
                total
        );
    }
}
