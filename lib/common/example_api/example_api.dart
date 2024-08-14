// //first we need to add http package for network call then import it like this
// import 'package:http/http.dart' as http;//......
//
// class ApiServices {
//   //this is your api base url ex...
//   String baseUrl="https://auth-api10.p.rapidapi.com/api/v1";
//   String endpointLogin='/login';
//   String endpointSignup='/register';
//   //one thing you notice tha ...base url same on both api call thats why we create a seperate variable name baseUrl to reuse it
//   //always use async and await
//
// login(String email,String password)async{
//   try{
//     var response= await http.post(Uri.parse(baseUrl+endpointLogin),headers: {
//       "x-rapidapi-key":"944bed4e72mshc657c8c7a25e382p19f202jsn121bcb08cfcc", // ye nhi likhna ok
//   //    "Authorization":"BarrierToken ${userToken}"
//       "x-rapidapi-host":"auth-api10.p.rapidapi.com"
//     },
//       body: {
//         'username': 'mandeep',// you can also provide ....
//         'email': email,
//         'password': password,
//         'avatar': 'mandeep.png'
//       }
//     );
//
//     if(response.statusCode==200){
//       print(response.body);
//     }else{
//       print('problem is ${response.body}');
//     }
//   }catch(e){
//     print(e.toString());
//   }
// }
// }
