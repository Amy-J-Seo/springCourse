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
		
		var bno = param.bno;
		var page = param.page ||1;
		
	$.ajax({
			  url:"../replies/",
			  method:"get",
			  data:{bno: bno,
					page:page
					},
			  dataType:"json",
			  success: function(data){
				  if(callback){
						callback(data.replyCnt, data.list);
					} 
					
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

		 function read(rno, callback, err){
		  $.ajax({
			  url:"../replies/"+rno,
			  method:"get",
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


		function update(editedReply, callback, err){
			console.log(editedReply)
		  $.ajax({
			  url:"../replies/"+editedReply.rno,
			  method:"put",
			  data: JSON.stringify(editedReply),
			  contentType:"application/json; charset=utf-8",
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

  return {add:add, getList: getList, deleteReply:deleteReply, read:read, update:update};

})();