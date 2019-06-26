package global.sesoc.project1.vo;

import java.util.ArrayList;

public class TrafficVO {
	
	int pathType;				//결과 종류(1-지하철 2-버스 3-버스+지하철)
	int searchType;				//결과 구분(도시내 0 or 도시간직통 1 or 도시간 환승 2)
	int outTrafficCheck;		//도시간 "직통" 탐색 결과 유무(환승 X)
	int busCount;				//버스 결과 개수(전체 대상 버스 경로 몇개인지)
	int subwayCount;			//지하철 결과 개수(전체 대상 지하철 경로 몇개인지)
	double trafficDistance;		//도보 제외 총 이동거리
	int totalWalk;				//총 도보 이동거리
	int totalTime;				//총 소요시간
	int payment;				//총 요금
	int busTransitCount;		//버스 환승 카운트
	int subwayTransitCount;		//지하철 환승 카운트
	int totalStationCount;		//총 정류장 합
	int busStationCount;		//버스 정류장 합
	int subwayStationCount;		//지하철 정류장 합

		
	public TrafficVO(
			int pathType, int searchType, int outTrafficCheck, int busCount, int subwayCount, double trafficDistance,
			int totalWalk, int totalTime, int payment, int busTransitCount, int subwayTransitCount, int totalStationCount,
			int busStationCount, int subwayStationCount){
		this.pathType = pathType;
		this.searchType = searchType;
		this.outTrafficCheck = outTrafficCheck;
		this.busCount = busCount;
		this.subwayCount = subwayCount;
		this.trafficDistance = trafficDistance;
		this.totalWalk = totalWalk;
		this.totalTime = totalTime;
		this.payment = payment;
		this.busTransitCount = busTransitCount;
		this.subwayTransitCount = subwayTransitCount;
		this.totalStationCount = totalStationCount;
		this.busStationCount = busStationCount;
		this.subwayStationCount = subwayStationCount;
	}

	public int getPathType() {
		return pathType;
	}

	public void setPathType(int pathType) {
		this.pathType = pathType;
	}

	public int getSearchType() {
		return searchType;
	}

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	public int getOutTrafficCheck() {
		return outTrafficCheck;
	}

	public void setOutTrafficCheck(int outTrafficCheck) {
		this.outTrafficCheck = outTrafficCheck;
	}

	public int getBusCount() {
		return busCount;
	}

	public void setBusCount(int busCount) {
		this.busCount = busCount;
	}

	public int getSubwayCount() {
		return subwayCount;
	}

	public void setSubwayCount(int subwayCount) {
		this.subwayCount = subwayCount;
	}

	public double getTrafficDistance() {
		return trafficDistance;
	}

	public void setTrafficDistance(double trafficDistance) {
		this.trafficDistance = trafficDistance;
	}

	public int getTotalWalk() {
		return totalWalk;
	}

	public void setTotalWalk(int totalWalk) {
		this.totalWalk = totalWalk;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getBusTransitCount() {
		return busTransitCount;
	}

	public void setBusTransitCount(int busTransitCount) {
		this.busTransitCount = busTransitCount;
	}

	public int getSubwayTransitCount() {
		return subwayTransitCount;
	}

	public void setSubwayTransitCount(int subwayTransitCount) {
		this.subwayTransitCount = subwayTransitCount;
	}

	public int getTotalStationCount() {
		return totalStationCount;
	}

	public void setTotalStationCount(int totalStationCount) {
		this.totalStationCount = totalStationCount;
	}

	public int getBusStationCount() {
		return busStationCount;
	}

	public void setBusStationCount(int busStationCount) {
		this.busStationCount = busStationCount;
	}

	public int getSubwayStationCount() {
		return subwayStationCount;
	}

	public void setSubwayStationCount(int subwayStationCount) {
		this.subwayStationCount = subwayStationCount;
	}

	
	
}
