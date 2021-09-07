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
			  if(err){
				  err();
			  }
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
  return {add:add, getList: getList};

})();