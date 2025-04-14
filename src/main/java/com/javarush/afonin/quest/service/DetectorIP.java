package com.javarush.afonin.quest.service;

import jakarta.servlet.http.HttpServletRequest;

public class DetectorIP {

    HttpServletRequest request;

    public DetectorIP(HttpServletRequest request) {
        this.request = request;
    }
    public String currentIP() {

        //Если  сервер находится за прокси
        String ipAddress = request.getHeader("X-Forwarded-For");
        if (ipAddress == null || ipAddress.isEmpty()) {
            ipAddress = request.getRemoteAddr();
        }
        //Когда вы тестируете приложение на локальной машине
        if (ipAddress.equals("0:0:0:0:0:0:0:1")) {
            ipAddress = "127.0.0.1";
        }
        return ipAddress;
    }
}
