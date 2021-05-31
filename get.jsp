<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
.uploadResult {
	width: 100%;
	background-color: #ddd;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 20px;
}

.uploadResult ul li span {
	color: white;
}
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 400px;
}
</style>
<jsp:include page="../includes/header.jsp"></jsp:include>
<!-- header 끝------------------------------------------------------------------------------ -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>Board No</label><input class="form-control" name="bno"
						value='<c:out value="${board.bno }"/>' readonly>
				</div>
				<div class="form-group">
					<label>Title</label><input class="form-control" name="title"
						value="<c:out value="${board.title}"/>" readonly>
				</div>
				<div class="form-group">
					<label>Content</label>
					<textarea class="form-control" rows="3" name="content" readonly><c:out
							value="${board.content}" /></textarea>
				</div>
				<div class="form-group">
					<label>Writer</label><input class="form-control" name="writer"
						value="<c:out value="${board.writer}"/>" readonly>
				</div>
				<sec:authentication property="principal" var="pinfo"/>
				<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq board.writer }">
				<button data-oper='modify' type="submit" class="btn btn-success">Modify</button>
				</c:if>
				</sec:authorize>
				<button data-oper='list' type="submit" class="btn btn-warning">list</button>
				<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno"
						value='<c:out value="${board.bno }"/>'> <input
						type="hidden" name="pageNum"
						value='<c:out value="${cri.pageNum }"/>'> <input
						type="hidden" name="amount"
						value='<c:out value="${cri.amount }"/>'> <input
						type="hidden" name="keyword"
						value='<c:out value="${cri.keyword }"/>'> <input
						type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->

		<!-- modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModellabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					</div>
					<div class="modal-body">
						<div class="form-froup">
							<label>Reply</label> <input class="form-control" name='reply'
								value='New Reply!!!'>
						</div>
						<div class="form-froup">
							<label>Replyer</label> <input class="form-control" name='replyer'
								value='Replyer'>
						</div>
						<div class="form-froup">
							<label>ReplyDate</label> <input class="form-control" name='updateDate'
								value=''>
						</div>
					</div>
					<!-- /.modal-body -->
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
						<button id='modalRegisterBtn' type="button"
							class="btn btn-success">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default">close</button>
					</div>
				</div>
				<!-- /.model-content -->
			</div>
			<!-- /.model-dialog -->
		</div>
		<!--/. modal -->

		<!-- 첨부 파일 -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">File Attach</div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<div class="form-group uploadDiv">
							<!-- <input type="file" name='uploadFile' multiple> -->
						</div>

						<div class="uploadResult">
							<ul></ul>
						</div>
						<div class="bigPictureWrapper">
							<div class="bigPicture"></div>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- reply -->
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i>Reply
			<sec:authorize access="isAuthenticated()">
			<button id="addReplyBtn" class="btn btn-primary btn xs pull-right">New
				Reply</button>
			</sec:authorize>
			
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno="12">
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong> <small
								class="pull-right text-muted">2021-05-18 13:13</small>
						</div>
						<p>Good Job</p>
					</div>
				</li>
			</ul>
		</div>
		<!-- /.panel-body -->
		<div class="panel-footer"></div>
		<!-- /.panel-fotter -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- /.row -->

<!-- footer시작 ----------------------------------------------------------- -->
<jsp:include page="../includes/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/reply.js">

</script>
<script type="text/javascript">
function showImage(fileCallPath) {
	alert(fileCallPath);
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html(
			"<img src='/display?fileName="+fileCallPath+"'>").animate({
		width : '100%',
		height : '100%'
	}, 1000);
}
	$(document).ready(function() {
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width:'0%', height:'0%'},1000);
			setTimeout(function(){
				$(".bigPictureWrapper").hide();
			},1000);
		});
		//bigPictureWrapper click
		var operForm = $("#operForm");
		$('button[data-oper="modify"]').on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});
		$('button[data-oper="list"]').on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
		
		// reply part
		console.log(replyService);
		var bnoValue='<c:out value="${board.bno}"/>';
		// 댓글 이벤트 처리
		var replyUL = $(".chat");	// showList(페이지번호)는 해당 게시글의 댓글을 가져온 후 <li>태그를 만들어서 
		showList(1);				// 화면에 보여준다.
		function showList(page){
			replyService.getList({
				bno:bnoValue,
				page:page||1
			},function(replyCnt,list){
				console.log("replyCnt: "+replyCnt);
				console.log("list : "+ list);
				if(page==-1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				var str="";
				if(list==null||list.length==0){
					replyUL.html("");
					return;
				}
				for (var i = 0, len = list.length||0; i < len; i++) {
					str+="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str+="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str+="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].updateDate)+"</small></div>";
					str+="<p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
			});
			//function call
		}
		//showList
		
		//modal
		var modal=$(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='updateDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		var replyer =null;
		<sec:authorize access="isAuthenticated()"> 
		replyer ='<sec:authentication property="principal.username"/>';
		</sec:authorize>
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$("#addReplyBtn").on("click",function(e){
			modal.find("input").val("");
			modal.find("input[name='replyer']").val(replyer);
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			modalRegisterBtn.show();
			$(".modal").modal("show");
			
		});
		// end addReplyBtn
		
		//ajax spring security header.. CSRF 토큰을 기본적으로 전송하도록 설정
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
		modalRegisterBtn.on("click",function(e){
			var reply={
					reply:modalInputReply.val(),
					replyer:modalInputReplyer.val(),
					bno:bnoValue
			};
			replyService.add(reply,function(result){
				alert(result);
				modal.find("input").val("");//댓글 등록이 정상적으로 이뤄지면, 내용을 지움
				modal.modal("hide"); //모달창 닫음
				
				showList(-1); // 새 댓글이 보일 수 있도록 새로고침
			}); 
		});
		//end madalRegisterBtn
		
		$(".chat").on("click","li",function(e){
			var rno=$(this).data("rno");
			console.log(rno);
			
			replyService.get(rno,function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.updateDate))
				.attr("readonly","readonly");
				modal.data("rno",reply.rno);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				$(".modal").modal("show");
			
		});
	});
		//end get reply readonly
		
		modalModBtn.on("click",function(e){
			var originalReplyer=modalInputReplyer.val();
			var reply ={
					rno:modal.data("rno"),
					reply:modalInputReply.val(),
					replyer:originalReplyer
					
			};
			if(!replyer){
				alert("로그인 후 수정 가능");
				modal.modal("hide");
				return;
			}
			console.log("Original Replyer : "+originalReplyer);
			if(replyer != originalReplyer){
				alert("자신이 작성한 댓글만 수정가능");
				modal.modal("hide");
				return;
			}
			
			replyService.update(reply,function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		//end modalModBtn
		
		modalRemoveBtn.on("click",function(e){
			var rno = modal.data("rno");
			console.log("REPLYER : "+replyer);
			if(!replyer){
				alert("로그인한 후 삭제가 가능");
				modal.modal("hide");
				return;
			}
			var originalReplyer = modalInputReplyer.val();
			console.log("ORIGINAL Replayer : "+ originalReplyer); // 원 댓글 작성자
			if(replyer!=originalReplyer){
				alert("자신이 작성한 댓글만 삭제가능");
				modal.modal("hide");
				return;
			}
		replyService.remove(rno, originalReplyer, function(result){
			
				alert(result);
				modal.modal("hide");
				showList(pageNum);
				
				
			});
		});
		//end modalRemoveBtn
		
		var pageNum=1;
		var replyPageFooter=$(".panel-footer");
		function showReplyPage(replyCnt){
			console.log("showReplyPage : "+replyCnt);
			var endNum = Math.ceil(pageNum/10.0)*10;
			var startNum = endNum-9;
			var prev = startNum != 1;
			var next = false;
			if(endNum*10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			if(endNum*10 < replyCnt){
				next = true;
			}
			var str = "<ul class='pagination pull-right'>";
			if(prev){
				str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
			}
			for(var i = startNum; i<=endNum; i++){
				var active = pageNum ==i? "active":"";
				str+="<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			if(next){
				str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
			}
			str+="</ul></div>";
			console.log(str);
			replyPageFooter.html(str);
			
			replyPageFooter.on("click","li a",function(e){
				e.preventDefault();
				console.log("page click");
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: "+ targetPageNum);
				pageNum = targetPageNum;
				showList(pageNum);
			});
		}
		// showReplyPage 끝
		
		
	/* 	replyService.add(
		{reply:"JS TEST", replyer:"js tester", bno:bnoValue}
		,function(result){
			alert("RESULT : " +result);
		});
		//end reply add
		
		replyService.getList({
			bno:350, page:1
		},
		function(list){
			for (var i = 0, len=list.length||0; i < len; i++) {
				console.log(list[i]);
			}
		});
		//end reply getList
		
		replyService.remove(
				32
				,function(count){
					console.log(count);
					if(count==="success"){
						alert("REMOVED");
					}
				},function(err){
						alert('error occurred...');
					
				});
			//end reply remove
			replyService.update({
				rno:37,
				bno:bnoValue,
				reply:"modified reply"
			},function(result){
				alert("수정 완료!")
			});
			//end reply update
			
			replyService.get(35,function(data){
				console.log(data);
			}); */
	
			// end reply part
			
			var bno = '<c:out value="${board.bno}"/>';
			$.getJSON("/board/getAttachList",{bno:bno},function(arr){
				console.log(arr);
				
			var str="";
			$(arr).each(function(i,obj){
				if(!obj.fileType){
					var fileCallPath= encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
				
					str +="<img src='/resources/images/attach.png'></a>"
					str +="</div></li>";
					console.log("파일이 아닌 타입:"+ fileCallPath);
				}else{
					var fileCallPath= encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
					
					str +="<img src='/display?fileName="+fileCallPath+"'>"; 
					str +="</div></li>";
					console.log("파일인 타입:"+ fileCallPath);
				}
			});
			$(".uploadResult ul").html(str);
				
		});
			// getJSON 끝
			
		$(".uploadResult").on("click","li",function(e){
			
			var liobj=$(this);
			var path=encodeURIComponent(liobj.data("path")+"/"+liobj.data("uuid")+"_"+liobj.data("filename"));
			console.log("view image");
			if(!liobj.data("type")){
				self.location="/download?fileName="+path;
			}else{
				showImage(path.replace(new RegExp(/\\/g),"/"));
			}
		});
			// uploadResult 클릭 부분 끝
			
	});
	// end document.ready function
</script>

</body>

</html>
