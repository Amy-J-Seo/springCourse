package com.bambbang.app.emp.domain;

import lombok.Data;

@Data
public class LocationsVO {
	private int locationId;
	private String streetAddress;
	private String postalCode;
	private String city;
	private String stateProvince;
	private String countryId;
}
