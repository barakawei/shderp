/**
 * Copyright (c) 2013 barakawei
 */

package shd.common.repository;

import ee.common.repository.BaseRepository;
import shd.common.entity.Dict;

import java.util.List;

public interface DictRepository extends BaseRepository<Dict, Long>{

    List<Dict> findByType(String type );


}
