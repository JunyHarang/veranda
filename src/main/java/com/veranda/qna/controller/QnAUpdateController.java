package com.veranda.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.veranda.common.controller.SuperClass;
import com.veranda.qna.dao.QnADao;
import com.veranda.qna.vo.QnA;

public class QnAUpdateController extends SuperClass{

	private QnA bean = null;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int no = Integer.parseInt(request.getParameter("no"));
		QnADao dao = new QnADao();
		
		QnA bean = dao.SelectDataByPk(no);
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/qna/qnaUpdate.jsp" ;
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		bean = new QnA();
		
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setTitle(request.getParameter("title"));
		bean.setContent(request.getParameter("content"));
		bean.setCategory(request.getParameter("category"));
		
		
		System.out.println("bean.information");
		System.out.println(toString());

		if (this.validate(request) == true) {
			System.out.println("qnas update validation check success");
			QnADao dao = new QnADao();
			int cnt = -1;
			cnt = dao.UpdateData(bean);

			new QnADetailViewController().doGet(request, response);

		} else {
			System.out.println("qnas update validation check failure");

			request.setAttribute("bean", bean);
			String gotopage = "/qna/qnaUpdate.jsp";
			super.GotoPage(gotopage);
		}
	}

	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true;
		if (bean.getTitle().length() < 3 || bean.getTitle().length() > 10) {
			request.setAttribute(super.PREFIX + "title", "제목은 3글자 이상 10자리 이하이어야 합니다.");
			isCheck = false;
		}

		if (bean.getContent().length() < 5 || bean.getContent().length() > 30) {
			request.setAttribute(super.PREFIX + "content", "글내용은 5자리 이상 30자리 이하이어야 합니다.");
			isCheck = false;
		}
		return isCheck;

	}

}
