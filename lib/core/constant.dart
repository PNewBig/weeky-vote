
class ApiPath{
   static const String baseUrl = "http://192.168.185.30:3000/api";
   static const String register = "$baseUrl/user/register";
   static const String signIn = "$baseUrl/user/login";
   static const String getPosition = "$baseUrl/position/getposition";
   static const String joinRoom = "$baseUrl/teams/jointeam";
   static const String fectRoomData = "$baseUrl/teams/GetDetailTeam";
   static const String getComment = "$baseUrl/vote/getallcoomentofuser";
   static const String postCommnet = "$baseUrl/vote/vote";
}