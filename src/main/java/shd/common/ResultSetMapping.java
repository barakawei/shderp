package shd.common;

import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.SqlResultSetMapping;

/**
 * Created by baraka on 14-6-8.
 */
@SqlResultSetMapping(
        name="resultMapping",
        classes={
                @ConstructorResult(
                        targetClass= shd.summary.entity.Summary.class,
                        columns={
                                @ColumnResult(name="orderNumber"),
                                @ColumnResult(name="serialNumber"),
                                @ColumnResult(name="customerName"),
                                @ColumnResult(name="productionOrderId"),
                                @ColumnResult(name="productProgressId"),
                                @ColumnResult(name="organizeProgressId"),
                                @ColumnResult(name="purchaseOrderIde")
                        }
                )
        }
)
public class ResultSetMapping {
}
