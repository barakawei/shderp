/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package ee.maintain.notification.service;

import ee.common.service.BaseService;
import ee.maintain.notification.entity.NotificationData;
import ee.maintain.notification.repository.NotificationDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 13-5-22 下午2:40
 * <p>Version: 1.0
 */
@Service
public class NotificationDataService extends BaseService<NotificationData, Long> {

    private NotificationDataRepository getNotificationDataRepository() {
        return (NotificationDataRepository) baseRepository;
    }


    public void markReadAll(final Long userId) {
        getNotificationDataRepository().markReadAll(userId);
    }


    public void markRead(final Long notificationId) {
        NotificationData data = findOne(notificationId);
        if(data == null || data.getRead().equals(Boolean.TRUE)) {
            return;
        }
        data.setRead(Boolean.TRUE);
        update(data);
    }
}
