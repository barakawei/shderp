/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.common.repository;

import ee.common.repository.BaseRepository;
import ee.showcase.upload.entity.UploadFile;

public interface UploadRepository extends BaseRepository<UploadFile, Long> {

    UploadFile findByName(String name);

    UploadFile findBySrc(String src);

}
