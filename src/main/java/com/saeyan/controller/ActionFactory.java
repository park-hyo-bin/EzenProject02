package com.saeyan.controller;

import com.saeyan.controller.action.*;

public class ActionFactory {
private static  ActionFactory instance = new ActionFactory();

private ActionFactory() {
	super();
}


public static ActionFactory getInstance() {
	return instance;
}


public Action getAction(String command) {
	Action action = null;
	System.out.println("ActionFactory : "+ command);
	if(command.equals("main_page")) {
		action = new MainPageAction();
	} else if(command.equals("log_out")) {
		action =  new LogoutAction();
	} else if(command.equals("log_in_form")) {
		action = new LoginFormAction();
	} else if(command.equals("log_in")) {
		action = new LoginAction();
	} else if(command.equals("jo_in_form")) {
		action = new JoinFormAction();
	} else if(command.equals("jo_in")) {
		action = new JoinAction();
	} else if(command.equals("member_update_form")) {
		action = new MemberUpdateFormAction();	
	} else if(command.equals("member_update")) {	
		action = new MemberUpdateAction();
	} 
	
	  else if(command.equals("board_write_form")) {
		action = new BoardWriteFormAction();
	} else if(command.equals("board_update_form")) {
		action = new BoardUpdateFormAction();
	} else if(command.equals("board_view")) {
		action = new BoardViewAction();
	} else if(command.equals("board_write")) {
		action = new BoardWriteAction();
	} else if(command.equals("board_update")) {
		action = new BoardUpdateAction();
	} else if(command.equals("board_delete")) {
		action = new BoardDeleteAction();
	} else if(command.equals("board_list")) {
			action =  new BoardListAction();	
	} 
	
	
	else if(command.equals("comment_write")) {
		action =  new CommentWriterAction();	
	} else if(command.equals("comment_delete")) {
		action =  new CommentDeleteAction();	
	} else if(command.equals("comment_update")) {
		action =  new CommentUpdateAction();	
	} 
	
	
	else if(command.equals("public_list")) {
		action = new PublicfacilitiesListAction();
	} else if(command.equals("public_view")) {
		action = new PublicfacilitiesViewAction();
	} 
	
	else if(command.equals("reservation_write")) {
		action = new ReservationAction();
	} 
	else if(command.equals("reservation_my_form")) {
		action = new ReservationMyAction();
	} else if(command.equals("reservation_delete")) {
		action = new ReservationDeleteAction();
	} else if(command.equals("reservation_view")) {
		action = new ReservationViewAction();
	} 


//else if(command.equals("board_check_pass_form")) {
//action=new BoardCheckPassFormAction();
//}
	return action;
}
}
