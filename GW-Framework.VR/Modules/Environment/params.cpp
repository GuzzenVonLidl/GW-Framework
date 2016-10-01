
class DOUBLES(ADDON,Daytime) {
	title = "Time of Day";
	values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
	texts[] = {"Default(Mission)","00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
	default = (getNumber(missionconfigfile >> "Mission" >> "Intel" >> "hour"));
};

class DOUBLES(ADDON,fullMoon) {
	title = "Force Full Moon";
	values[]={0,1};
	texts[]={"Default(Mission)","Force full Moon"};
	default=0;
};

class DOUBLES(ADDON,Fog) {
	title = "Amount of Fog";
	values[]={0,1,2,3,4};
	texts[]={"Default(Mission)", "Clear", "Low", "Medium", "High"};
	default=0;
};

class DOUBLES(ADDON,Weather) {
	title = "Set type of weather";
	values[]={0,1,2,3,4,5,6,7,8};
	texts[]={"Default(Mission)","Clear (Light Winds)", "Clear (Strong Winds)", "Overcast (Calm)", "Overcast (Light)", "Overcast (Strong)", "Rain (Light)", "Rain (Strong)", "Storm"};
	default=0;
};

class DOUBLES(ADDON,Lightning) {
	title = "Advanced Lightning";
	values[]={0,1,2,3};
	texts[]={"Default(Mission)","Weather Allows It","Force Enabled","Force Disable"};
	default=0;
};
