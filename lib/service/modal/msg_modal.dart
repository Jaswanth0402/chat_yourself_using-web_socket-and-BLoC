 class Message {
	
	final String name;
	final String text;
	

	Message({
	
		required this.name,
		required this.text,
		
	});

	factory Message.fromJson(Map<String, dynamic> json){
    return Message(name:json['name'], text:json['text']);
  } 
		
	Map<String, dynamic> toJson(){
   return{
    
    'name':name,
    'text':text,
    
   };
   
  } 
}