/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package ee.showcase.upload.repository;

import ee.common.repository.BaseRepository;
import ee.showcase.upload.entity.UploadFile;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 13-2-4 下午3:00
 * <p>Version: 1.0
 */
public interface UploadRepository extends BaseRepository<UploadFile, Long> {

    UploadFile findByName(String name);

}
