package shd.common.entity;

import ee.common.entity.BaseEntity;
import ee.common.repository.annotation.EnableQueryCache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by baraka on 14-5-17.
 */
@Entity
@Table(name = "dict")
@EnableQueryCache
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Dict extends BaseEntity<Long>{

    private static final long serialVersionUID = 1L;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    private String type;

    @Column(name = "enable")
    private Boolean enable;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }
}
