package com.example.apachecamelwithredpanda;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class UserLoginProcessor {
    public static void process(String body) throws BlacklistedUserPatternException {
        ObjectMapper mapper = new ObjectMapper();
        UserLogin userLogin = null;
        try {
            userLogin = mapper.readValue(body, UserLogin.class);
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        if (userLogin.getUser_name().contains("9") || userLogin.getUser_name().contains("4")) {
            throw new BlacklistedUserPatternException("Encountered User name containing blacklisted pattern");
        }

        System.out.println("userLogin details are : " + userLogin);
    }

}
