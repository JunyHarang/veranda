<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%
   /* position for grid system */   
   int offset = 2 ;
   int mywidth = twelve - 2 * offset ;
   int formleft = 3 ;
   int formright = twelve - formleft ;
%> 

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
   .checkout__input_2 input{
      height: 350px;
      width: 100%;
      border: 1px solid #e1e1e1;
      font-size: 14px;
      color: #666666;
      padding-left: 20px;
      margin-bottom: 20px;
   }
   .checkout__input_2 p span {
        color: #f08632;
   }
</style>




<meta charset="UTF-8">
<script>
      $(document).ready(function(){
      });
      
   </script>
</head>
<body>
   <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="<%=FormNo%>main">Home</a>
                        <span>공지사항</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form name="insertform" action="<%=FormYes%>" method="post">
                   <input type="hidden" name="command" value="noInsert">
                   <input type="hidden" name="writer" value="">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                            <h6 class="coupon__code">
                               <span class="icon_tag_alt">
                               </span> 공지사항 작성
                           </h6>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type="text" name="title" id="title">
                                    </div>
                                </div>

                            </div>
                            <div class="checkout__input_2">
                                <p>글 내용<span>*</span></p>
                                <input type="text" name="content" id="content" >
                            </div>
                            <button type="submit" class="site-btn" onclick="return checkForm();">
                               등록
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>
<jsp:include page="/common/footer.jsp"></jsp:include>