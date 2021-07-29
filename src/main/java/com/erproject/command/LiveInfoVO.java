package com.erproject.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LiveInfoVO {
	private String parkingBikeTotCnt;
	private String rackTotCnt;
	private String shared;
	private String stationId;
	private String stationName;
	private String stationLatitude;
	private String stationLongitude;
}
