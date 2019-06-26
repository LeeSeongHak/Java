package global.sesoc.project1.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import global.sesoc.project1.dao.DiaryDAO;
import global.sesoc.project1.dao.UserDAO;
import global.sesoc.project1.vo.DiaryVO;
import global.sesoc.project1.vo.TrafficVO;
import global.sesoc.project1.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	DiaryDAO diaryDAO;
	
	private final static Logger logger = LoggerFactory.getLogger(DiaryController.class);

	//Login Form
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String password, Model model, HttpSession session){
		UserVO vo = null;
		vo = dao.login(id, password);
		
		
		
		
		if(vo == null){
			model.addAttribute("vo", vo);
			return "redirect:/";
		}
		
		else{
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			session.setAttribute("name", vo.getName());
			session.setAttribute("country", vo.getCountry());
			session.setAttribute("region", vo.getRegion());
			
			return "sample/diary";
		}
	}
	
	//Join Form
	@RequestMapping(value = "/join", method= RequestMethod.GET)
	public String join1(){
		return "user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join2(String custid, UserVO vo){
		vo.setid(custid);
		int cnt=0;
		cnt = dao.join(vo);
		
		if(cnt==0){
			return " user/join";
		}
		else{
			return "redirect:/";
		}
	}
	
	//ID �ߺ�Ȯ��
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public String idCheck(){
		return "user/idCheck";
	}
	

	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public String idCheck2(String searchId, Model model){

		UserVO vo = dao.getCustomer(searchId);

		model.addAttribute("searchId", searchId);

		model.addAttribute("searchResult", vo);

		model.addAttribute("search", true);
		return "user/idCheck";
	}
	
	@RequestMapping(value="/news", method=RequestMethod.GET)
	public String news(HttpSession session){
		String clientId = "ibvum1Y0Dx5JXH1pXGDp";
        String clientSecret = "4Bwp4Jf6Cg";
        String country = (String)session.getAttribute("country") + " " + (String)session.getAttribute("region");
        try {
            String text = URLEncoder.encode("광주광역시 광산구 우산동", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text + "&display=100&start=1&sort=sim"; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            logger.debug(response.toString());
            String[] aa = response.toString().split("title");
            for(int i = 0; i < aa.length; i++){
            	logger.debug("aa : {}", aa[i]);
            }
        } catch (Exception e) {
            System.out.println(e);
        }       
        return "home";
	}
	
	@RequestMapping(value="/locationTest", method=RequestMethod.GET)
	public String location(){
		return "locationTest";
	}
	
	@RequestMapping(value="/mapTest2", method=RequestMethod.GET)
	public String map2(){
		return "mapTest2";
	}
	
	@RequestMapping(value="/mapTest3", method=RequestMethod.GET)
	public String map3(){
		return "mapTest3";
	}
	
	@RequestMapping(value="/mapTest4", method=RequestMethod.GET)
	public String map4(){
		return "mapTest4";
	}
	
	@RequestMapping(value="/mapTest5", method=RequestMethod.GET)
	public String map5(){
		return "mapTest5";
	}
	
	@RequestMapping(value="/mapTest6", method=RequestMethod.GET)
	public String map6(){
		return "mapTest6";
	}
	
	@RequestMapping(value="/mapTest7", method=RequestMethod.GET)
	public String map7(){
		return "mapTest7";
	}
	
	@RequestMapping(value="/mapTest8", method=RequestMethod.GET)
	public String map8(){
		return "mapTest8";
	}
	
	@RequestMapping(value="/mapTest9", method=RequestMethod.GET)
	public String map9(){
		return "mapTest9";
	}
	
	@RequestMapping(value="/mapTest10", method=RequestMethod.GET)
	public String map10(){
		return "mapTest10";
	}
	
	@RequestMapping(value="/mapTest11", method=RequestMethod.GET)
	public String map11(){
		return "mapTest11";
	}
	
	@RequestMapping(value="/mapTest12", method=RequestMethod.GET)
	public String map12(){
		return "mapTest12";
	}
	
	@RequestMapping(value="/mapTest13", method=RequestMethod.GET)
	public String map13(){
		return "mapTest13";
	}
	
	@RequestMapping(value="/mapTest14", method=RequestMethod.GET)
	public String map14(){
		return "mapTest14";
	}
	
	@RequestMapping(value="/mapTest15", method=RequestMethod.GET)
	public String map15(){
		return "mapTest15";
	}
	
	@RequestMapping(value="/mapTest16", method=RequestMethod.GET)
	public String map16(HttpSession session){
		String sList[] = new String[4];
		
		sList[0] = "126.80469172350797";
		sList[1] = "35.157130204977335";
		
		sList[2] = "126";
		sList[3] = "35";
		
		session.setAttribute("lat1", sList[0]);
		session.setAttribute("lon1", sList[1]);
		session.setAttribute("lat2", sList[2]);
		session.setAttribute("lon2", sList[3]);
		session.setAttribute("sListSize", sList.length);
		return "mapTest16";
	}
	
	/*@ResponseBody
	@RequestMapping(value="/trafficTest1", method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	public void list(String str){
		
		Gson gson = new Gson();
        JsonParser parser = new JsonParser();
        
        //[]대괄호 만나면 JsonArray 객체에 넣어주기. JsonArray jsonArray = (JsonArray) parser.parse(str);
        //JsonArray doj = (JsonArray) jso.get("return_object"); (jso = JsonObject)
        
        //{}중괄호 만나면 JsonObject 객체에 넣어주기. JsonObject object = (JsonObject) jsonArray.get(0);
        
        //각각 key 값으로 value 값을 가져오기. String index = object.get("INDEX").getAsString();
        
        //Json
        JsonObject json = (JsonObject)parser.parse(str);
        
        //result
        JsonObject result = (JsonObject)json.get("result");
        
        //path
        JsonArray path = (JsonArray) result.get("path");
        
        String name = null;
        String busNo = null;
        String startName = null;
        double startX = 0;
        double startY = 0;
        String endName = null;
        double endX = 0;
        double endY = 0;
        
        ArrayList<TrafficVO> ar = new ArrayList<TrafficVO>();
        
        logger.debug("path.size() : {}", path.size());
        
        //path 내의 경로 n개. path array의 갯수만큼 가져와서 arrayList에 담아 쓰면 될듯.
        for(int i = 0; i < path.size(); i++){
        	
        	JsonObject route = (JsonObject) path.get(i);
	        
	        //pathType
	        int pathType = route.get("pathType").getAsInt();
	        
	        //result내의 searchType
	        int searchType = result.get("searchType").getAsInt();
	        
	        //result내의 outTrafficCheck
	        int outTrafficCheck = result.get("outTrafficCheck").getAsInt();
	        
	        //result내의 busCount
	        int busCount = result.get("busCount").getAsInt();
	        
	        //result내의 subwayCount
	        int subwayCount = result.get("subwayCount").getAsInt();
	    	
	        //route 내. 각 동선별 정보.
	        //route내의 info내의 trafficDistance(도보제외 총 이동거리)
	        JsonObject info = (JsonObject)route.get("info");
	        double trafficDistance = info.get("trafficDistance").getAsDouble();
	        
	        //info내의 totalWalk(총 도보 이동거리)
	        int totalWalk = info.get("totalWalk").getAsInt();
	        
	        //info내의 totalTime(총 소요시간)
	        int totalTime = info.get("totalTime").getAsInt();
	        
	        //info내의 payment(총 요금)
	        int payment = info.get("payment").getAsInt();
	        
	        //info내의 busTrainsitCount(버스 환승 카운트)
	        int busTransitCount = info.get("busTransitCount").getAsInt();
	        
	        //info내의 subwayTransitCount(지하철 환승 카운트)
	        int subwayTransitCount = info.get("subwayTransitCount").getAsInt();
	        
	        //info내의 totalStationCount(총 정류장 갯수)
	        int totalStationCount = info.get("totalStationCount").getAsInt();
	        
	        //info내의 busStationCount(버스 정류장 갯수)
	        int busStationCount = info.get("busStationCount").getAsInt();
	        
	        //info내의 subwayStationCount(지하철 정류장 갯수)
	        int subwayStationCount = info.get("subwayStationCount").getAsInt();
	        
	        //subPath 내. n번째 노선의 경로(도보 + 지하철 + 버스 노선정보. 이동동선 보여줌)
	        JsonArray ar = (JsonArray) route.get("subPath");
	        
	        //subPath 내의 m번째 노선
	        for(i = 0; i < subPath.size(); i ++){
		        JsonObject subRoute = (JsonObject) subPath.get(i);
		        
		        //m번째 노선의 trafficType(지하철이면 1, 버스면 2, 도보면 3)
		        int trafficType = subRoute.get("trafficType").getAsInt();
		        
		        //m번째 노선의 distance(m번째 노선의 이동거리)
		        double distance = subRoute.get("distance").getAsDouble();
		        
		        //m번째 노선의 sectionTime(이동시간)
		        int sectionTime = subRoute.get("sectionTime").getAsInt();
		        
		        logger.debug("trafficType : {}, distance : {}, sectionTime : {}",
		        		trafficType, distance, sectionTime);
		        
		        logger.debug("subpath:{}", subPath);
		        
		        if(trafficType != 3){
			        JsonArray lane = (JsonArray) subRoute.get("lane");
			        
			        if(trafficType == 1){
			        	//lane의 크기만큼 출력한뒤, name이 있는 경우에 출력할 수 있도록 해야함.
			        	for(i = 0; i < lane.size(); i++){
			        		JsonObject laneNum = (JsonObject) lane.get(i);
			        		if(!(laneNum.get("name").getAsString().isEmpty())){
			        			name.add(laneNum.get("name").getAsString());
					        	//해당 노선의 출발 좌표 및 도착 좌표(출발지, 도착지) 및 거리 및 걸리는 시간
					        	startName = subRoute.get("startName").getAsString();
					        	startX = subRoute.get("startX").getAsDouble();
					        	startY = subRoute.get("startY").getAsDouble();
					        	endName = subRoute.get("endName").getAsString();
					        	endX = subRoute.get("endX").getAsDouble();
					        	endY = subRoute.get("endY").getAsDouble(); 
			        		}
			        	}
			        }
			        
			        if(trafficType == 2){
			        	//lane의 크기만큼 출력한뒤, busNo가 있는 경우에 출력할 수 있도록 해야함.
			        	for(i = 0; i < lane.size(); i++){
			        		JsonObject laneNum = (JsonObject) lane.get(i);
			        		if(!(laneNum.get("busNo").getAsString().equals(null))){
			        			busNo.add(laneNum.get("busNo").getAsString());
					        	//해당 노선의 출발 좌표 및 도착 좌표
					        	startName = subRoute.get("startName").getAsString();
					        	startX = subRoute.get("startX").getAsDouble();
					        	startY = subRoute.get("startY").getAsDouble();
					        	endName = subRoute.get("endName").getAsString();
					        	endX = subRoute.get("endX").getAsDouble();
					        	endY = subRoute.get("endY").getAsDouble(); 
			        		}
			        	}
			        }

				}
	        }
	   
	        TrafficVO vo = new TrafficVO(pathType, searchType, outTrafficCheck, busCount, subwayCount, trafficDistance,
	    			totalWalk, totalTime, payment, busTransitCount, subwayTransitCount, totalStationCount,
	    			busStationCount, subwayStationCount);
	        
	        ar.add(vo);
	        	
	        logger.debug("ar : {}", ar.get(i));
	        
        }
	}*/
	
	@RequestMapping(value="/reverseGeoCording", method=RequestMethod.GET)
	public String reverseGeoCording(){
		return "reverseGeoCording";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginLocation", method=RequestMethod.POST)
	public void loginLocation(double lat, double lon){
		logger.debug("{}, {}",lat, lon);
		return;
	}
}	