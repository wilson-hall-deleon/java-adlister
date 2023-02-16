package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    List<Ad> allFromUserId(long userId);
    // gets a list of ads like the searched term
    List<Ad> searchAds(String query);
    // gets the id of an ad
    Ad getAdId(long id);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
}
