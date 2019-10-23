package egovframework.example.popup.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PopupController {
	
	@RequestMapping("popup.do")
	public String popup() {
		return "popup/jusoPopup";
	}
}
