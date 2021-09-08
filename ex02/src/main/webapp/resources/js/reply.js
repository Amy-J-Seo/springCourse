/*WEBapp/resources/js/reply.js*/
let replyService =(function(){

	function add(callback, err){
	  $.ajax({
		  url:"../replies/",
		  data:$("#replyForm").serialize(),
		  method:"post",
		  dataType:"json",
		  success:function(data){
			  if(callback) callback(data)
		  },
		  error: function(err){
			  console.error(err);
			  
		  }
	  });
  }
	  function getList(param, callback, err){
		  $.ajax({
			  url:"../replies/",
			  method:"get",
			  data:{bno: bno},
			  dataType:"json",
			  success: function(data){
				  if(callback) callback(data)
				},
			  error: function(error){
					  if(error) error(error)
				}
		  });
		 }
		  
		  function deleteReply(rno, callback, err){
		  $.ajax({
			  url:"../replies/"+rno,
			  method:"delete",
			  dataType:"json",
			  success: function(data){
				  if(callback){
				   callback(data)
				   }
				},
			  error: function(error){
					  console.error(error);
				}
		  });
  }
  return {add:add, getList: getList, deleteReply:deleteReply};

})();