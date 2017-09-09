<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>롯데카드 이용대금 명세서 | 롯데카드</title>
	<style type="text/css">
		#dropzone {
			border:2px dotted #3292A2;
			width:90%;
			height:50px;
			color:#92AAB0;
			text-align:center;
			font-size:24px;
			padding-top:12px;
			margin-top:10px;
		}

		@font-face {
		font-family:'NanumSquare';font-style:normal;font-weight:400;
		src:local('Nanum Square Regular'),
			local('NanumSquareR')
		}
		
		@font-face {
		font-family:'NanumSquare';font-style:bold;font-weight:700;
		src:local('Nanum Square Bold'),
			local('NanumSquareB')
		}
		
		/* RESET */
		html{color:#000;background:#fff;font-size:100%;-webkit-text-size-adjust:none;-ms-text-size-adjust:none}
		body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,
		article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video{margin:0;padding:0}
		article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}
		
		body{font-family:'NanumSquare', dotum, "돋움", sans-serif;font-size:15px;line-height:1.5;color:#666}
		.pc body{background-color:#f2f2f2}
		img{vertical-align:middle;border:0}
		button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle}
		table{border-collapse:collapse;border-spacing:0}
		fieldset{border:0}
		legend{color:#000}
		address,caption,cite,code,dfn,em,th,var{font-style:normal;font-weight:normal}
		strong{font-style:normal}
		ol,ul{list-style:none}
		caption,th{text-align:left}
		h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal;line-height:1.2}
		caption{overflow:hidden;width:0;height:0;font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}
		hr,legend{position:absolute;top:-9999px;font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}
		a,a:link,a:visited,a:active,a:hover,a:focus{color:#666666;font-size:100%;text-decoration:none;cursor:pointer}
		.invisible{overflow:hidden;position:absolute;top:-9999px;left:-9999px;text-indent:-9999px;font-size:0;line-height:0;margin:0;padding:0 !important}
		
		/* 레이아웃 */
		.wrapper{overflow:hidden;max-width:780px;margin:0 auto}
		.pc .wrapper{width:780px}
		.main_swipe{overflow:hidden;width:100%}
		.main_swipe .main_slide{}
		.main_swipe .main_slide:after{display:block;clear:both;content:" "}
		.section01{display:none;width:100%}
		.section01 .sevice_ttl{display:block;position:absolute;width:1px;height:1px;overflow:hidden;font-size:1px;line-height:0;color:transparent;text-shadow:none;background-color:transparent;border:0}
		
		.load_init{position:fixed;top:0;right:0;bottom:0;left:0;background:#000;filter: alpha(opacity=70);opacity:0.7;background:#fff;z-index:100000}
		.load_init p{position:fixed;left:50%;top:50%;margin:0 -52px 0 -55px;padding-top:84px;font-weight:bold;font-size:14px;background:url(https://www.lottecard.co.kr/images/e_bill/load.gif) 50% top no-repeat}
		.mobile .load_init p{margin-top:-21px;padding-top:42px;background-size:42px 42px}
		
		.head_email{position:relative;width:100%;padding-bottom:49px;background:#fff}
		.noti_top .date{font-size:24px;line-height:24px}
		.noti_top{padding:35px 5% 20px;color:#333;background:#c4e362}
		.noti_top h2{display:inline-block;font-size:37px;letter-spacing:-2px}
		.noti_top h2, .noti_top .date{position:relative;z-index:1}
		.noti_top .myacc{margin-top:25px;font-size:17px;color:#656565}
		.noti_top .myacc .word_break:first-child{margin-right:30px}
		.noti_top .myacc em{display:inline-block;width:70px;margin-right:5px}
		.noti_top .myacc .btn_modal{display:inline-block;width:26px;height:26px;margin-left:10px;vertical-align:top}
		.noti_top .myacc .btn_modal img{width:26px;vertical-align:top}
		.noti_top .free_parking{display:none;position:absolute;right:0;top:170px;width:197px;height:33px;background:url(https://www.lottecard.co.kr/images/e_bill/bg_freepark.png) left top no-repeat;z-index:10}
		.noti_top .free_parking a{display:block;width:95px;height:33px}
		.noti_top .free_parking .ani_car{display:block;position:absolute;left:100px;top:-15px;width:50px;height:44px;background:url(https://www.lottecard.co.kr/images/e_bill/img_freepark.png) left top no-repeat;z-index:11}
		.noti_top .bg01{display:block;position:absolute;left:14px;top:8px;width:33px;height:110px;background:url(https://www.lottecard.co.kr/images/e_bill/bg_rectangle.gif) left top no-repeat;z-index:0}
		
		.pc .noti_top{height:155px;padding:54px 0 20px 65px;letter-spacing:-1px;background:#c4e362 url(https://www.lottecard.co.kr/images/e_bill/bg_ems_top.png) 100% center no-repeat}
		.pc .noti_top .free_parking{display:block}
		.pc .noti_top h2{display:block;background:url(https://www.lottecard.co.kr/images/e_bill/tit_ems.gif) left 50% no-repeat}
		.pc .noti_top h2 span{display:inline-block;overflow:hidden;text-indent:-9999px}
		.pc .noti_top .myacc > .word_break{float:left;margin-right:20px}
		.mobile .noti_top .myacc > .word_break{margin-right:0}
		.mobile .noti_top{background-image:none}
		.mobile .noti_top h2{background-image:none}
		.mobile .noti_top .bg01{left:inherit;right:14px}
		
		.gnb_email{position:absolute;left:0;bottom:0;width:100%;transition:position 0.2s ease-in-out;-webkit-transition:position 0.2s ease-in-out;z-index:10}
		.gnb_email:after{display:block;clear:both;content:" "}
		.gnb_email li{position:relative;float:left;width:33%;padding-bottom:9px;text-align:center;background:url(https://www.lottecard.co.kr/images/e_bill/bg_gnbemail.png) left 100% repeat-x}
		.gnb_email li.active{width:34%}
		.gnb_email li.active a{background-color:#333}
		.gnb_email li.active .bg{display:block;position:absolute;left:0;bottom:2px;width:100%;height:10px;background:url(https://www.lottecard.co.kr/images/e_bill/bg_gnbemail_active.png) 50% 100% no-repeat;z-index:10}
		.gnb_email li a{display:block;padding:10px 0 10px;line-height:20px;color:#fff;background:#747266}
		.gnb_email.floating{position:fixed;left:0;top:0;max-width:780px;bottom:initial;margin:0 auto}
			
		.bundle_area{border-bottom:1px solid #e9e9e9}
		.bundle_area h3{padding:0 8%}
		.bundle_area h3 .tit{display:block;position:relative;line-height:18px;padding:40px 10% 40px 0;font-size:18px;color:#4d4d4d}
		.bundle_area h3 .tit strong{display:block;position:absolute;right:0;top:50%;width:16px;height:18px;margin-top:-11px;font-size:18px;background:url(https://www.lottecard.co.kr/images/e_bill/ico_more.gif) left 50% no-repeat;-webkit-transition:-webkit-transform 0.5s;transition:transform 0.5s}
		.bundle_area h3 .tit:active strong, .bundle_area h3 .tit:hover strong{}
		.bundle_area h3 .tit .sub_r{display:inline;float:right;color:#8b8b8b}
		.bundle_area h3 .tit .sub_l{display:inline;float:left}
		.bundle_area h3 .tit:after{display:block;clear:both;content:""}
		.bundle_area.open h3 .tit strong{-webkit-transform:rotate(45deg);transform:rotate(45deg)}
		.bundle_area .bundle_cont{display:none;padding:20px 10%;border-bottom:2px solid #ebebeb;background:#f2f2f2;color:#4d4d4d}
		.bundle_area .bundle_cont .stit{margin-top:20px;font-weight:bold}
		
		/* PC타입 */
		.pc .bundle_area{margin-bottom:10px}
		.pc .bundle_area > h3{padding-top:40px;background:#fff}
		.pc .bundle_area .bundle_cont{display:block;padding:20px 8%;border-bottom:none;background:#fff}
		.pc .bundle_area h3 .tit{display:block;position:relative;line-height:18px;padding:10px 0 30px;font-weight:bold;font-size:18px;color:#4d4d4d;border-bottom:1px dashed #ccc}
		.pc .bundle_area h3 .tit strong{display:none}
		
		.cip_area{}
		.cip_area > .cip_img{display:inline-block;width:100%;max-width:565px;margin-bottom:15px}
		
		
		/* 스타일 */
		.detail_list li{margin-bottom:5px;line-height:22px;font-weight:bold;letter-spacing:-0.25px}
		.detail_list li:after{display:block;clear:both;content:" "}
		.detail_list li > em{display:inline;float:left;width:50%}
		.detail_list li .unit{float:right;width:50%;font-weight:normal;color:#8b8b8b;text-align:right}
		
		.detail_list .t_total{padding:10px 0;border-top:1px solid #b2b2b2;border-bottom:1px solid #b2b2b2;font-weight:bold}
		.detail_list .t_total em{font-weight:bold}
		.detail_list .t_total .unit{color:#cc3333;font-weight:bold}
		
		.d_list{margin-top:10px}
		.d_list li{padding-left:7px;margin-bottom:3px;font-size:14px;background:url(https://www.lottecard.co.kr/images/e_bill/bg_dot_list.gif) left 8px no-repeat}
		.pc .d_list li{font-size:12px;background-position:left 5px}
		
		.txt_admin{}
		.txt_admin table{width:100% !important}
		.txt_admin table th{font-weight:bold;text-align:center;border-bottom:1px solid #9f9f9f;border-top:none;border-left:1px solid #dbdbdb;background:#fff}
		.txt_admin table td{padding:5px;text-align:center;border-left:1px solid #dbdbdb;border-top:1px solid #dbdbdb}
		
		.a_list{margin-top:10px}
		.a_list li{padding-left:7px;margin-bottom:5px;color:#333;background:url(https://www.lottecard.co.kr/images/e_bill/ico_arr_left.gif) left 8px no-repeat}
		.indent_list{margin:10px 0 0 15px}
		.indent_list > li{text-indent:-10px;padding:0 !important;background:none !important}
		.pc .indent_list li{font-size:12px}
		.no_list{margin-top:20px}
		.no_list li{margin-bottom:5px;letter-spacing:-1px}
		
		.bank_list{overflow:hidden;width:100%}
		.bank_list li{margin:5px !important;padding:5px 20px;border:1px solid #ccc;border-radius:5px;background:none !important}
		.bank_list li strong{margin-right:10px}
		.pc .bank_list li{float:left;width:160px;padding-right:10px;font-size:12px}
		.pc .bank_list li.big{width:340px}
		
		
		/* 박스형 */
		.box_white{margin-top:10px;padding:5px 5%;background:#fff}
		.pc .box_white{background:#f2f2f2}
		.box_type01{margin-top:25px;border:1px solid #d9d9d9;color:#666}
		.box_type01 > h3{padding:10px 15px;font-weight:bold;color:#000;background:#e9e9e9}
		.box_type01 .box_cont{padding:10px 20px}
		.pc .box_type01 .box_cont{padding:10px 25px;font-size:12px}
		.box_type01 .box_cont > ul li{margin-top:3px;padding-left:7px;background:url(https://www.lottecard.co.kr/images/e_bill/bg_dot_list.gif) left 8px no-repeat}
		.box_type01 .box_cont > ul li:first-child{margin-top:0}
		
		/* 버튼 */
		a.b_alpha{display:inline-block;padding:4px 8px;line-height:22px;border:1px solid #fff;color:#fff}
		.b_gray{display:inline-block;padding:4px 9px;line-height:22px;border:1px solid #dadada;color:#39393e;background:#dadada}
		.b_gray > img{width:38px}
		a.btn_type01{display:inline-block;margin-right:5px;padding:7px;font-size:15px;line-height:18px;color:#000;text-indent:0 !important;border:1px solid #9f9f9f;background:#fafafa}
		a.btn_type01:active, a.btn_type01:hover{background:#ccc}
		
		.btn_renew{display:block;position:fixed;width:70px;height:52px;padding:10px 0px;text-align:center;border-radius:50%;background:#f18669;font-size:12px;color:#fff !important;line-height:16px;vertical-align: middle;opacity:.8;filter:alpha(opacity=80);
		-webkit-animation: ball 0.5s alternate infinite;
		}
		.pc .btn_renew{left:50%;bottom:10px;margin-left:-470px}
		.mobile .btn_renew{left:10px;bottom:10px}
		@-webkit-keyframes ball {
		0% {bottom:1px}
		100% {bottom:11px}
		}
		.b_noti_total{display:block;margin:0 18px;padding-top:10px;text-align:center;background:#dedede}
		.b_noti_total span{display:inline-block;overflow:hidden;width:13px;height:8px;margin:-2px 0 0 5px;vertical-align:middle}
		.b_noti_total span img{margin-top:0;width:100%;vertical-align:top}
		.b_noti_total.on span img{margin-top:-8px}

		/* table 타입 */
		.tbl_grid_wrap{overflow:hidden;width:100%}
		.tbl_grid_wrap .tbl_grid2{float:left;width:50%}
		.tbl_grid_wrap .tbl_grid3{width:33%}
		.tbl_new01{width:100%;margin-top:10px;border-top:1px solid #9f9f9f;border-bottom:1px solid #9f9f9f;border-collapse:collapse}
		.tbl_new01 th, .tbl_new01 td{padding:5px}
		.tbl_new01 thead th{font-weight:bold;text-align:center;border-bottom:1px solid #9f9f9f;border-top:none;border-left:1px solid #dbdbdb;background:#fff}
		.tbl_new01 thead th.first, .tbl_new01 tbody th.first{border-left:none}
		.tbl_new01 tbody th{font-weight:bold;text-align:center;border-top:1px solid #dbdbdb;border-left:1px solid #dbdbdb;background:#fff}
		.tbl_new01 tbody td{padding:5px;text-align:right;border-left:1px solid #dbdbdb;border-top:1px solid #dbdbdb}
		.tbl_new01 tbody td:first-child, .tbl_new01 tbody td.first{border-left:none}
		.tbl_new01 th, .tbl_new01 td{word-wrap:break-word;word-break:break-all;font-size:12px}
		.tbl_new01 tr:first-child th, .tbl_new01 tr:first-child td{border-top:none}
		.tbl_new01.t_center td{text-align:center}
		.tbl_new01 .t_bundle th, .tbl_new01 .t_bundle td{border-top:1px solid #9f9f9f;border-bottom:1px solid #9f9f9f;font-weight:bold}
		table caption{overflow:hidden;position:absolute;top:-9999px;left:-9999px;text-indent:-9999px;font-size:0;line-height:0;margin:0;padding:0 !important}
		table td .cancel_info{}
		table td .cancel_info h3, table td .cancel_info ul li{}
		.pc .tbl_new01 thead th{background:#f2f2f2}
		.mobile .tbl_new01 .t_bundle th, .mobile .tbl_new01 .t_bundle td{background:none}


		/* 공통 */
		.clfix{*zoom:1}
		.clfix:before,.clfix:after{display:table;line-height:0;content:""}
		.clfix:after{clear:both}
		.fl_r{float:right}
		.fl_l{float:left}
		.al_l{text-align:left !important}
		.al_c{text-align:center !important}
		.al_r{text-align:right !important}
		.mg-t0{margin-top:0px !important}
		.mg-t10{margin-top:10px !important}
		.mg-t20{margin-top:20px !important}
		.mg-t30{margin-top:30px !important}
		.mg-t40{margin-top:40px !important}
		.mg-r0{margin-right:0px !important}
		.mg-r10{margin-right:10px !important}
		.mg-r20{margin-right:20px !important}
		.mg-l10{margin-left:10px !important}
		.mg-l20{margin-left:20px !important}
		.mg-l30{margin-left:30px !important}
		.mg-l40{margin-left:40px !important}
		.pd-t10{padding-top:10px !important}
		.word_break{display:inline-block;margin-right:10px}
		.f_bold{font-weight:bold !important}
	
	
		body{background:#fff !important}
		.foot_inner{display: none !important}
		.bundle_area h3{position:relative}
		.bundle_area .bundle_cont{display:block !important;position:relative}
		.noti_ems{display:block}
	
		.tbl_wrap_scrl{overflow:auto !important}
		.tbl_new01{width:100%;font-size:12px !important}
		
		.approvalTable thead td{
			text-align : center;
			width : 25%;
			height : 20%;
			border: 1px solid black;
		}
		.approvalTable tbody td{
			text-align : center;
			width : 25%;
			height : 80%;
			border: 1px solid black;
		}
		
		.backslash {
			background: url('http://cdn.zetawiki.com/png/backslash.png');
			background-size: 100% 100%;
			text-align: left;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	<script>
		$(function () {
			var obj = $("#dropzone");
	
			obj.on('dragenter', function (e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px solid #5272A0');
			});
	
			obj.on('dragleave', function (e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px dotted #8296C2');
			});
	
			obj.on('dragover', function (e) {
				e.stopPropagation();
				e.preventDefault();
			});
	
			obj.on('drop', function (e) {
				e.preventDefault();
				$(this).css('border', '2px dotted #8296C2');
	
				var files = e.originalEvent.dataTransfer.files;
				if(files.length < 1) return;
	
				F_FileMultiUpload(files, obj);
			});

		});
		
		// 파일 멀티 업로드
		function F_FileMultiUpload(files, obj) {
			var data = new FormData();
			for (var i = 0; i < files.length; i++) {
				data.append('file', files[i]);
			}
			
			var url = "/fileUpload";
			$.ajax({
				url: url,
				method: 'post',
				data: data,
				dataType: 'text',
				processData: false,
				contentType: false,
				success: function(res) {
					$("#lotteCardFrame").attr("src", res);
					$("#lotteCardDiv").css("display", "block");
					$("#dropzone").css("display", "none");
				},
				error : function(err) {
					console.log("err : ", err);
				}
			});
		}
		
		var printLotteCard = function() {
			var bill = $("#lotteCardFrame").contents().find("#popSect01");
			$("#printLotteCardArea").append(bill);
			$("#lotteCardDiv").css("display", "none");
			$("#printLotteCardArea").css("display", "block");
			window.print();
		}
	</script>

</head>
<body>
	<div id="dropzone">Drag & Drop Files Here</div>
	<div id="lotteCardDiv" style="display: none;">
		<div>
			<button onclick="printLotteCard()">인쇄</button>
		</div>
		<iframe id="lotteCardFrame" style="display:block; width:100vw; height: 100vh"></iframe>
	</div>
	<div id="printLotteCardArea" style="display: none;">
	<!-- <div id="printLotteCardArea"> -->
		<div style="text-align: right">
			<br />
			<br />
			<table id="approvalTable" class="approvalTable" align="right" style="width: 260px; height: 90px;">
				<thead>
					<tr>
						<td>담당</td>
						<td></td>
						<td></td>
						<td>그룹장</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td><img src="/img/backslash.png" style="width: 100%; height: 75%" /></td>
						<td><img src="/img/backslash.png" style="width: 100%; height: 75%" /></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</div>
</body>
</html>

























