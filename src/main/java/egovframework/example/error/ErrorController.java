package egovframework.example.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	@RequestMapping("errors")
	public String error() {
		return "cmmn/error";
	}
}
